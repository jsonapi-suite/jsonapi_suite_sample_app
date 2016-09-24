require 'rails_helper'

RSpec.describe 'employees#index', type: :request do
  let!(:employee1) { Employee.create!(name: 'Homer Simpson', age: 38) }
  let!(:employee2) { Employee.create!(name: 'Smithers', age: 40) }

  it 'lists employees' do
    get '/api/employees'
    expect(response.status).to eq(200)
    expect(json_items.length).to eq(2)
    assert_payload(:employee, employee1, json_items[0])
    assert_payload(:employee, employee2, json_items[1])
  end

  context 'when filtering on name_prefix' do
    it 'finds employees with name starting with this filter' do
      get '/api/employees', params: { filter: { name_prefix: 'smi' } }
      expect(json_items.length).to eq(1)
      assert_payload(:employee, employee2, json_items[0])
    end
  end

  context 'when sideloading' do
    let!(:department) do
      employee1.build_department(name: 'Safety')
      employee1.save!
      employee1.department
    end

    it 'sideloads pertinent records' do
      get '/api/employees', params: { include: 'department' }
      expect(json_included_types).to match_array(%w(departments))
      assert_payload(:department, department, json_include('departments'))
    end
  end
end

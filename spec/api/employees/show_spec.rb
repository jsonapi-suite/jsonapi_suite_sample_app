require 'rails_helper'

RSpec.describe 'employees#show', type: :request do
  let!(:employee) { Employee.create!(name: 'Homer Simpson', age: 38) }

  it 'renders employee' do
    get "/api/employees/#{employee.id}"
    expect(response.status).to eq(200)
    assert_payload(:employee, employee, json_item)
  end

  context 'when sideloading' do
    let!(:department) do
      employee.build_department(name: 'Safety')
      employee.save!
      employee.department
    end

    let!(:goal) { Goal.create!(description: 'No explosions', department: department) }

    it 'sideloads pertinent records' do
      get "/api/employees/#{employee.id}", params: { include: 'department.goals' }
      expect(json_included_types).to match_array(%w(departments goals))
      assert_payload(:department, department, json_include('departments'))
      assert_payload(:goal, goal, json_include('goals'))
    end
  end
end

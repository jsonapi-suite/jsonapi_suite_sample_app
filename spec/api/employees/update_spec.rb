require 'rails_helper'

RSpec.describe 'employees#update', type: :request do
  let(:department1) { Department.new(name: 'Safety') }
  let(:department2) { Department.create!(name: 'Henchmen') }

  let!(:employee) do
    Employee.create! name: 'Homer Simpson',
      age: 38,
      department: department1
  end

  let(:params) do
    {
      data: {
        type: 'employees',
        id: employee.id.to_s,
        attributes: { age: 39 },
        relationships: {
          department: {
            data: {
              type: 'departments',
              id: department2.id.to_s
            }
          }
        }
      }
    }
  end

  it 'creates an employee with department' do
    expect {
      put "/api/employees/#{employee.id}", params: params
    }.to change { employee.reload.age }.from(38).to(39)

    expect(response.status).to eq(200)
    assert_payload(:employee, employee, json_item)
    assert_payload(:department, department2, json_include('departments'))

    expect(employee.department).to eq(department2)
  end
end

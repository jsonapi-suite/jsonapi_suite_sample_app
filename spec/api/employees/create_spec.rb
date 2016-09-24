require 'rails_helper'

RSpec.describe 'employees#create', type: :request do
  let(:params) do
    {
      data: {
        type: 'employees',
        attributes: { name: 'Homer Simpson', age: 38 },
        relationships: {
          department: {
            type: 'departments',
            data: {
              attributes: { name: 'Safety' }
            }
          }
        }
      }
    }
  end

  it 'creates an employee with department' do
    expect {
      post '/api/employees', params: params
    }.to change { Employee.count }.by(1)
    employee = Employee.last

    expect(response.status).to eq(200)
    assert_payload(:employee, employee, json_item)
    assert_payload(:department, employee.department, json_include('departments'))
  end
end

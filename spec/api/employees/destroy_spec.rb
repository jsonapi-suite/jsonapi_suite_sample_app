require 'rails_helper'

RSpec.describe 'employees#destroy', type: :request do
  let!(:employee) { Employee.create!(name: 'Homer Simpson', age: 38) }

  it 'deletes the employee' do
    expect {
      delete "/api/employees/#{employee.id}"
    }.to change { Employee.count }.from(1).to(0)
    expect(response.status).to eq(200)
    assert_payload(:employee, employee, json_item)
  end
end

class DepartmentResource < ApplicationResource
  type :departments

  belongs_to :employee,
    foreign_key: :employee_id,
    scope: -> { Employee.all },
    resource: EmployeeResource
end

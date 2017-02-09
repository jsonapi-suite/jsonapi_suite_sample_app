class DepartmentResource < ApplicationResource
  type :departments

  allow_filter :id
  allow_filter :name

  has_many :employees,
    foreign_key: :department_id,
    scope: -> { Employee.all },
    resource: EmployeeResource
  has_many :goals,
    foreign_key: :department_id,
    scope: -> { Goal.all },
    resource: GoalResource
end

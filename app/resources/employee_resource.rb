class EmployeeResource < ApplicationResource
  type :employees

  allow_filter :name
  allow_filter :age

  allow_filter :name_prefix do |scope, value|
    scope.where(["name LIKE ?", "#{value}%"])
  end

  has_many :departments,
    scope: -> { Department.all },
    foreign_key: :employee_id,
    resource: DepartmentResource
end

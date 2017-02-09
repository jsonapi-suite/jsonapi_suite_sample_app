class EmployeeResource < ApplicationResource
  type :employees

  allow_filter :id
  allow_filter :department_id
  allow_filter :name
  allow_filter :age

  allow_filter :name_prefix do |scope, value|
    scope.where(["name LIKE ?", "#{value}%"])
  end

  belongs_to :department,
    scope: -> { Department.all },
    foreign_key: :department_id,
    resource: DepartmentResource
end

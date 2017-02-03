class GoalResource < ApplicationResource
  type :goals

  belongs_to :department,
    scope: -> { Department.all },
    foreign_key: :department_id,
    resource: DepartmentResource
end

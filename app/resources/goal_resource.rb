class GoalResource < ApplicationResource
  type :goals

  allow_filter :department_id

  belongs_to :department,
    scope: -> { Department.all },
    foreign_key: :department_id,
    resource: DepartmentResource
end

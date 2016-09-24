class GoalSerializer < ApplicationSerializer
  attributes :description

  belongs_to :department
end

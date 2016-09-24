class EmployeeSerializer < ApplicationSerializer
  attributes :name, :age, :created_at, :updated_at

  belongs_to :department
end

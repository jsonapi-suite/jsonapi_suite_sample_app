class DepartmentSerializer < ApplicationSerializer
  attributes :name

  has_many :employees
  has_many :goals
end

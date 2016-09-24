class Employee < ApplicationRecord
  include NestedAttributeReassignable

  belongs_to :department

  reassignable_nested_attributes_for :department
end

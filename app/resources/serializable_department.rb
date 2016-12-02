class SerializableDepartment < JSONAPI::Serializable::Resource
  type 'departments'

  attribute :name

  has_many :employees
  has_many :goals
end

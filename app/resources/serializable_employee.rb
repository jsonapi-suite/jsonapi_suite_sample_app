class SerializableEmployee < JSONAPI::Serializable::Resource
  type 'employees'

  attributes :name, :age, :created_at, :updated_at

  belongs_to :department
end

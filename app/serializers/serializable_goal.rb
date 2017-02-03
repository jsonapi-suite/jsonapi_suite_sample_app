class SerializableGoal < JSONAPI::Serializable::Resource
  type 'goals'

  attribute :description

  belongs_to :department
end

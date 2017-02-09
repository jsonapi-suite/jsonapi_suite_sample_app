class SerializableGoal < JSONAPI::Serializable::Resource
  type 'goals'

  attribute :description

  belongs_to :department do
    link :related do
      @url_helpers.department_url(@object.department_id)
    end
  end
end

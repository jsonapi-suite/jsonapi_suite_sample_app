class SerializableEmployee < JSONAPI::Serializable::Resource
  type 'employees'

  attributes :name, :age, :created_at, :updated_at

  belongs_to :department do
    link :related do
      @url_helpers.department_url(@object.department_id)
    end
  end
end

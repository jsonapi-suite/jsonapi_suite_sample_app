class SerializableDepartment < JSONAPI::Serializable::Resource
  type 'departments'

  attribute :name

  has_many :employees do
    link :related do
      @url_helpers.employees_url(filter: { department_id: @object.id })
    end
  end

  has_many :goals do
    link :related do
      @url_helpers.goals_url(filter: { department_id: @object.id })
    end
  end
end

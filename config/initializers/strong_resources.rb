StrongResources.configure do
  strong_param :department_enum,
    swagger: :string,
    type: ActionController::Parameters.enum('Safety', 'Management', 'Henchmen')

  strong_resource :employee do
    attribute :name, :string
    attribute :age, :integer
  end

  strong_resource :department do
    attribute :name, :department_enum
  end
end

class ApplicationResource < JsonapiCompliable::Resource
  use_adapter JsonapiCompliable::Adapters::ActiveRecord
end

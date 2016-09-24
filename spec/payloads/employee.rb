JsonapiSpecHelpers::Payload.register(:employee) do
  key(:name)
  key(:age)

  timestamps!
end

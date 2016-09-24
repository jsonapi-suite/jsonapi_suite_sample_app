class ApplicationController < ActionController::API
  include JsonapiSuite::ControllerMixin

  rescue_from Exception do |e|
    handle_exception(e)
  end
end

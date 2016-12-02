class DepartmentsController < ApplicationController
  jsonapi { }

  def index
    departments = Department.all
    render_jsonapi(departments)
  end
end

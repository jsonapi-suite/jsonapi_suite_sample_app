class DepartmentsController < ApplicationController
  jsonapi resource: DepartmentResource

  def index
    departments = Department.all
    render_jsonapi(departments)
  end
end

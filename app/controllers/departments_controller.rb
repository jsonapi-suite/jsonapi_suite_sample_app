class DepartmentsController < ApplicationController
  jsonapi resource: DepartmentResource

  def index
    departments = Department.all
    render_jsonapi(departments)
  end

  def show
    scope = jsonapi_scope(Department.where(id: params[:id]))
    render_jsonapi(scope.resolve.first, scope: false)
  end
end

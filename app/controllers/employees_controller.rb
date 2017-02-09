class EmployeesController < ApplicationController
  jsonapi resource: EmployeeResource

  before_action :deserialize_jsonapi!, only: [:create, :update]

  strong_resource :employee do
    belongs_to :department
  end

  def index
    employees = Employee.all
    render_jsonapi(employees)
  end

  def show
    employee = jsonapi_scope(Employee.where(id: params[:id]))
    render_jsonapi(employee.resolve.first, scope: false)
  end

  def create
    employee = Employee.new(strong_resource)

    if employee.save
      render_jsonapi(employee, scope: false)
    else
      render_errors_for(employee)
    end
  end

  def update
    employee = Employee.find(params[:id])

    if employee.update_attributes(strong_resource)
      render_jsonapi(employee, scope: false)
    else
      render_errors_for(employee)
    end
  end

  def destroy
    employee = Employee.find(params[:id])
    employee.destroy
    render_jsonapi(employee, scope: false)
  end
end

class EmployeesController < ApplicationController
  jsonapi do
    allow_filter :name
    allow_filter :age

    allow_filter :name_prefix do |scope, value|
      scope.where(["name LIKE ?", "#{value}%"])
    end

    includes whitelist: {
      index: :department,
      show: { department: :goals }
    }
  end

  before_action :deserialize_jsonapi!, only: [:create, :update]

  strong_resource :employee do
    belongs_to :department
  end

  def index
    employees = Employee.all
    render_ams(employees)
  end

  def show
    employee = jsonapi_scope(Employee.all).find(params[:id])
    render_ams(employee)
  end

  def create
    employee = Employee.new(strong_resource)

    if employee.save
      render_ams(employee)
    else
      render_errors_for(employee)
    end
  end

  def update
    employee = Employee.find(params[:id])

    if employee.update_attributes(strong_resource)
      render_ams(employee, scope: false)
    else
      render_errors_for(employee)
    end
  end

  def destroy
    employee = Employee.find(params[:id])
    employee.destroy
    render_ams(employee)
  end
end

class DepartmentsController < ApplicationController
  jsonapi { }

  def index
    departments = Department.all
    render_ams(departments)
  end
end

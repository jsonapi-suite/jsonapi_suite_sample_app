class GoalsController < ApplicationController
  jsonapi resource: GoalResource

  def index
    departments = Goal.all
    render_jsonapi(departments)
  end

  def show
    scope = jsonapi_scope(Goal.where(id: params[:id]))
    render_jsonapi(scope.resolve.first, scope: false)
  end
end

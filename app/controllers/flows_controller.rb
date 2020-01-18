class FlowsController < ApplicationController
  respond_to :json

  def index
    flows = Flow.limit(10)
    render jsonapi: flows
  end

  def create
    flow = Flow.new(create_params)
    flow.created_by = current_user
    if flow.save
      render jsonapi: flow
    else
      render jsonapi_errors: flow.errors, :status => :bad_request
    end
  end

  private
    def create_params
      params
        .require(:data)
        .require(:attributes)
        .permit(:title, :description, :default_responsable_id)
    end
end

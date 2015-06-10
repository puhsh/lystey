class AdminController < ApplicationController
  def index
    @agent = Agent.friendly.find(params[:agent_id])
    respond_to do |format|
      format.html
    end
  end
end

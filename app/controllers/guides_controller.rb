class GuidesController < ApplicationController
  before_filter :find_agent

  def index
  end

  private

  def find_agent
    @agent = Agent.friendly.find(params[:agent_id])
  end
end

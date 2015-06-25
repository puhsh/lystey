class ThemesController < ApplicationController
  before_filter :find_agent

  def edit
  end

  private

  def find_agent
    id = params[:id] || params[:agent_id]
    @agent = Agent.friendly.find(id)
  end
end

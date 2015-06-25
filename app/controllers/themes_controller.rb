class ThemesController < ApplicationController
  before_filter :find_agent

  def edit
    @theme = @agent.theme

    respond_to do |format|
      format.html
    end
  end

  private

  def find_agent
    id = params[:id] || params[:agent_id]
    @agent = Agent.friendly.find(id)
  end
end

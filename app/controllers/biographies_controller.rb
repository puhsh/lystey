class BiographiesController < ApplicationController
  before_filter :find_agent

  def show
  end

  def edit
    @biography = @agent.biography || @agent.build_biography

    respond_to do |format|
      format.html
    end
  end

  def update
  end

  private

  def find_agent
    id = params[:agent_id] || params[:id]
    @agent = Agent.friendly.find(id)
  end
end

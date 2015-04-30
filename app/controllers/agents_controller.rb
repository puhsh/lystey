class AgentsController < ApplicationController
  def show
    @agent = Agent.friendly.find(params[:id])
    respond_to do |format|
      if id_param?
        format.html { redirect_to agent_path(@agent.friendly_id) }
      else
        format.html
      end
    end
  end

  private

  def id_param?
    params[:id] != @agent.friendly_id
  end

end

class AgentsController < ApplicationController
  before_filter :find_agent

  def show
    respond_to do |format|
      if id_param? || friendly_id_param?
        format.html { redirect_to agent_root_url(subdomain: @agent.friendly_id) }
      else
        format.html
      end
    end
  end

  private

  def find_agent
    if request.subdomain.present?
      @agent = Agent.friendly.find(request.subdomain)
    else
      @agent = Agent.friendly.find(params[:id])
    end
  end

  def id_param?
    params[:id] && params[:id] != @agent.friendly_id
  end

  def friendly_id_param?
    params[:id] && params[:id] == @agent.friendly_id
  end

end

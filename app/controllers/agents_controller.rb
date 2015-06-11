class AgentsController < ApplicationController
  before_filter :find_agent

  def show
    respond_to do |format|
      if id_param?
        format.html { redirect_to agent_path(@agent.friendly_id) }
        format.json { render json: @agent }
      else
        format.html
      end
    end
  end

  def edit
    respond_to do |format|
      if @agent
        @office_address = @agent.addresses.where(address_type: :office).first || @agent.addresses.build(address_type: :office)
        @mailing_address = @agent.addresses.where(address_type: :mailing).first || @agent.addresses.build(address_type: :mailing)

        if @agent.certifications.blank?
          @agent.certifications.build
        end

        format.html
      else
        format.html { redirect_to agent_path(@agent) }
      end
    end
  end

  def update
  end

  private

  def find_agent
    @agent = Agent.friendly.find(params[:id])
  end

  def id_param?
    params[:id] && params[:id] != @agent.friendly_id
  end

  def friendly_id_param?
    params[:id] && params[:id] == @agent.friendly_id
  end

end

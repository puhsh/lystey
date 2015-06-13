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
        @office_address = @agent.addresses.where(address_type: :office).first || @agent.addresses.build(address_type: :office, same_as_office: false)
        @mailing_address = @agent.addresses.where(address_type: :mailing).first || @agent.addresses.build(address_type: :mailing)

        if @agent.certifications.blank?
          @agent.certifications.build
        end

        format.html
      else
        format.html { redirect_to edit_agent_path(@agent) }
      end
    end
  end

  def update
    return_path = determine_return_path
    respond_to do |format|
      if @agent.update_attributes(agent_params)
        format.html { redirect_to return_path }
      else
        format.html {
          flash[:alert] = 'Error'
          redirect_to return_path
        }
      end
    end
  end

  def guides
    @buyers_guide = @agent.guides.where(guide_type: :buyers).first || @agent.guides.build(guide_type: :buyers)
    @sellers_guide = @agent.guides.where(guide_type: :sellers).first || @agent.guides.build(guide_type: :sellers)

    respond_to do |format|
      format.html
    end
  end

  private

  def find_agent
    id = params[:id] || params[:agent_id]
    @agent = Agent.friendly.find(id)
  end

  def id_param?
    params[:id] && params[:id] != @agent.friendly_id
  end

  def agent_params
    params.require(:agent).permit!
  end

  def determine_return_path
    case params[:from_section]
    when 'guides'
      return_path = agent_edit_guides_path(@agent)
    else
      return_path = edit_agent_path(@agent)
    end
  end
end

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

  def links
    @theme = @agent.theme || @agent.build_theme
    @links = @agent.social_links

    # Social Links
    @facebook_link = @links.where(site: :facebook).first || @agent.social_links.build(site: :facebook)
    @twitter_link = @links.where(site: :twitter).first || @agent.social_links.build(site: :twitter)
    @pinterest_link = @links.where(site: :pinterest).first || @agent.social_links.build(site: :pinterest)
    @instagram_link = @links.where(site: :instagram).first || @agent.social_links.build(site: :instagram)
    @google_plus_link = @links.where(site: :google_plus).first || @agent.social_links.build(site: :google_plus)
    @linkedin_link = @links.where(site: :linkedin).first || @agent.social_links.build(site: :linkedin)

    # Realtor Sites
    @realtor = @links.where(site: :realtor).first || @agent.social_links.build(site: :realtor)
    @zillow = @links.where(site: :zillow).first || @agent.social_links.build(site: :zillow)
    @trulia = @links.where(site: :trulia).first || @agent.social_links.build(site: :trulia)

    # Other links
    @other_links = @links.where(site: :personal)
    
    if @other_links.empty?
      @other_links = @agent.social_links.build(site: :personal)
    end

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
      agent_edit_guides_path(@agent)
    when 'links'
      agent_edit_links_path(@agent)
    else
      edit_agent_path(@agent)
    end
  end
end

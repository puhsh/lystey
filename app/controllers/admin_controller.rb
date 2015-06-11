class AdminController < ApplicationController
  def index
    @agent = Agent.includes(:certifications, :addresses).friendly.find(params[:agent_id])

    if @agent
      @certifications = @agent.certifications || @agent.certifications.build
      @office_address = @agent.addresses.where(address_type: :office).first || @agent.addresses.build(address_type: :office)
      @mailing_address = @agent.addresses.where(address_type: :mailing).first || @agent.addresses.build(address_type: :mailing)
    end

    respond_to do |format|
      format.html
    end
  end
end

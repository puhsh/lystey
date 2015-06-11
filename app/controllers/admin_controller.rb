class AdminController < ApplicationController
  def index
    @agent = Agent.includes(:certifications, :addresses).friendly.find(params[:agent_id])

    respond_to do |format|
      if @agent
        @office_address = @agent.addresses.where(address_type: :office).first || @agent.addresses.build(address_type: :office)
        @mailing_address = @agent.addresses.where(address_type: :mailing).first || @agent.addresses.build(address_type: :mailing)

        if @agent.certifications.blank?
          @agent.certifications.build
        end

        format.html
      else
        format.html { redirect_to root_url }
      end
    end
  end
end

class GuidesController < ApplicationController
  before_filter :find_agent
  before_filter :find_theme, only: [:buyers, :sellers]
  before_filter :show_footer

  def buyers
    @buyers_guide = @agent.guides.where(guide_type: :buyers).first
    respond_to do |format|
      format.html
    end
  end

  def sellers
    @sellers_guide = @agent.guides.where(guide_type: :sellers).first
    @testimonials = @agent.testimonials.limit(3).order(created_at: :desc)

    respond_to do |format|
      format.html
    end
  end
end

class Theme < ActiveRecord::Base
  extend Enumerize

  # Attributes
  enumerize :font, in: [:arial, :impact, :tahoma, :verdana, :georgia, :palatino, :times, :courier, :lucida], scopes: false, predicates: false

  # Relationships
  belongs_to :agent

  # Validations
  validates :testimonial_page_title, length: { maximum: 100 }
  validates :testimonial_page_main_copy, length: { maximum: 10000 }
  # Scopes

  # Methods
end

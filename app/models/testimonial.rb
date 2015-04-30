class Testimonial < ActiveRecord::Base
  # Attributes

  # Relationships
  belongs_to :agent

  # Validations
  validates :text, length: { maximum: 1000 }

  # Scopes

  # Methods
end

class Biography < ActiveRecord::Base
  # Attributes

  # Relationships
  belongs_to :agent

  # Validations
  validates :title, presence: true
  validates :short_bio, presence: true, length: { maximum: 250 }
  validates :long_bio, presence: true, length: { maximum: 10000 }

  # Scopes

  # Methods
end

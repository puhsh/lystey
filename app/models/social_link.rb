class SocialLink < ActiveRecord::Base
  extend Enumerize

  # Attributes
  enumerize :site, in: [:facebook, :twitter, :pinterest, :google_plus, :instagram, :linkedin, :realtor, :zillow, :trulia, :personal], scopes: false, predicates: false

  # Relationships
  belongs_to :agent, touch: true

  # Validations
  validates :url, presence: true

  # Scopes

  # Methods
end

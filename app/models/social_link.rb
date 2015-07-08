class SocialLink < ActiveRecord::Base
  extend Enumerize

  # Attributes
  enumerize :site, in: [:facebook, :twitter, :pinterest, :google_plus, :instagram, :linkedin, :realtor, :zillow, :trulia, :personal], scopes: false, predicates: false

  # Relationships
  belongs_to :agent, touch: true

  # Validations

  # Scopes
  scope :social_media, -> { where.not(site: [:realtor, :zillow, :trulia, :personal]) }
  scope :realtor_sites, -> { where(site: [:realtor, :zillow, :trulia]) }

  # Methods
end

class SocialLink < ActiveRecord::Base
  extend Enumerize

  # Atrributes
  enumerize :site, in: [:personal, :facebook, :twitter, :pinterest, :google_plus, :instagram, :linkedin, :realtor, :zillow, :trulia], scopes: false, predicates: false

  # Relationships
  belongs_to :agent, touch: true

  # Validations

  # Scopes

  # Methods
end

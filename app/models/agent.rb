class Agent < ActiveRecord::Base
  # Atrributes

  # Relationships
  has_many :addresses
  has_many :social_links, dependent: :destroy

  # Validations

  # Scopes

  # Methods
end

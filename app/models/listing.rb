class Listing < ActiveRecord::Base
  # Attributes

  # Relationships
  belongs_to :agent

  # Validations
  validates :mls_number

  # Scopes

  # Methods
end

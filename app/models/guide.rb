class Guide < ActiveRecord::Base
  extend Enumerize

  # Attributes
  enumerize :guide_type, in: [:buyers, :seller]

  # Relationships
  belongs_to :agent

  # Validations

  # Scopes

  # Methods
end

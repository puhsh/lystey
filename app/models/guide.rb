class Guide < ActiveRecord::Base
  extend Enumerize

  # Attributes
  enumerize :guide_type, in: [:buyers, :sellers]

  # Relationships
  belongs_to :agent, touch: true

  # Validations

  # Scopes

  # Methods
end

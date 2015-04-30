class Certification < ActiveRecord::Base
  # Attributes

  # Relationships
  belongs_to :agent

  # Validations
  validates :certification_type, presence: true, uniqueness: { scope: :agent_id }

  # Scopes

  # Methods
end

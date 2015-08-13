class Team < ActiveRecord::Base
  # Attributes

  # Relationships
  belongs_to :agent
  has_many :team_members, dependent: :destroy
  has_many :team_openings, dependent: :destroy

  # Validations
  accepts_nested_attributes_for :team_members, :team_openings, reject_if: :new_record?, allow_destroy: true

  # Scopes

  # Methods
end

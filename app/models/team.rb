class Team < ActiveRecord::Base
  # Attributes

  # Relationships
  belongs_to :agent
  has_many :job_openings, dependent: :destroy
  has_many :team_members, dependent: :destroy

  # Validations
  accepts_nested_attributes_for :team_members, reject_if: :new_record?

  # Scopes

  # Methods
end

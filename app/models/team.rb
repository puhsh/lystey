class Team < ActiveRecord::Base
  # Attributes

  # Relationships
  belongs_to :agent
  has_many :job_openings, dependent: :destroy
  has_many :team_members, dependent: :destroy

  # Validations
  validates :title, presence: true, length: { maximum: 100 }
  validates :about, presence: true, length: { maximum: 10000 }

  # Scopes

  # Methods
end

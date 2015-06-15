class Guide < ActiveRecord::Base
  extend Enumerize

  # Attributes
  enumerize :guide_type, in: [:buyers, :sellers]

  # Relationships
  belongs_to :agent, touch: true

  # Validations
  validates :guide_title, length: { maximum: 100 }
  validates :content, length: { maximum: 10000 }

  # Scopes

  # Methods
end

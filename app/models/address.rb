class Address < ActiveRecord::Base
  extend Enumerize

  # Attributes
  enumerize :address_type, in: [:office, :mailing], scope: true, predicates: true

  # Relationships
  belongs_to :agent, touch: true

  # Validations

  # Scopes
  scope :office_first, -> { order(address_type: :desc) }

  # Methods
end

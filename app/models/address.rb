class Address < ActiveRecord::Base
  extend Enumerize

  # Attributes
  enumerize :address_type, in: [:office, :mailing], scope: true, predicates: true

  # Relationships
  belongs_to :agent, touch: true

  # Validations
  validates :line_1, presence: true, unless: :same_as_office?
  validates :city, presence: true, unless: :same_as_office?
  validates :state, presence: true, unless: :same_as_office?
  validates :zipcode, presence: true, unless: :same_as_office?

  # Scopes

  # Methods
end

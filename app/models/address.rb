class Address < ActiveRecord::Base
  extend Enumerize

  # Atrributes
  enumerize :address_type, in: [:office, :mailing], scopes: true, predicates: true

  # Relationships
  belongs_to :agent, touch: true

  # Validations

  # Scopes

  # Methods
end

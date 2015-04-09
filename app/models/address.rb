class Address < ActiveRecord::Base
  extend Enumerize

  # Attributes
  enumerize :address_type, in: [:mailing, :physical]

  # Relationships
  belongs_to :realtor, touch: true

  # Scopes

  # Validations

  # Methods
end

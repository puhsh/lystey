class Theme < ActiveRecord::Base
  extend Enumerize

  # Attributes
  enumerize :font, in: [:helvetica, :impact, :tahoma, :verdana, :georgia, :palatino, :times, :courier, :lucida], scopes: false, predicates: false

  # Relationships
  belongs_to :agent

  # Validations

  # Scopes

  # Methods
end

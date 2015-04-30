class Broker < ActiveRecord::Base
  # Attributes

  # Relationships
  belongs_to :agent

  # Validations

  # Scopes

  # Methods

  # Returns the name. If the broker's agent is not registered, it will return placeholder text.
  def name
    if agent.registered?
      self.read_attribute(:name)
    else
      "Unknown. Register to complete"
    end
  end

end

class Theme < ActiveRecord::Base
  extend Enumerize

  # Attributes
  enumerize :font, in: [:helvetica, :impact, :tahoma, :verdana, :georgia, :palatino, :times, :courier, :lucida], scopes: false, predicates: false

  # Relationships
  belongs_to :agent

  # Validations

  # Scopes

  # Methods

  # Resets the theme for the agent
  def reset!
    self.background_color = nil
    self.font_color = nil
    self.button_color = nil
    self.font = :helvetica
    self.save
  end
end

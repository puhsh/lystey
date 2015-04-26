class Agent < ActiveRecord::Base
  # Atrributes

  # Relationships
  has_many :addresses
  has_many :social_links, dependent: :destroy

  # Validations

  # Scopes

  # Methods

  # Returns the full name (first + last + suffix) of an agent
  def full_name
    "#{self.first_name} #{self.last_name}, #{self.suffix}"
  end

  def phone_number
    if self.registered?
      self.read_attribute(:phone_number)
    else
      "(972) 555-XXXX"
    end
  end

  def email
    if self.registered?
      self.read_attribute(:email)
    else
      "#{self.first_name}@XXXXXX.XXX"
    end
  end
end

class Agent < ActiveRecord::Base
  extend FriendlyId
  extend Enumerize

  # Attributes
  friendly_id :first_and_last_name, use: :slugged
  enumerize :license_type, in: [:sale, :brk, :bllc, :bcrp, :six, :reb, :prin, :rein, :apin, :illc, :icrp, :erwi, :erwo]

  # Relationships
  has_many :addresses, dependent: :destroy
  has_many :social_links, dependent: :destroy
  has_many :certifications, dependent: :destroy
  has_one :broker, dependent: :destroy
  has_one :biography, dependent: :destroy
  has_one :team, dependent: :destroy
  has_many :testimonials, dependent: :destroy
  has_one :theme, dependent: :destroy
  has_many :guides, dependent: :destroy
  has_many :listings, dependent: :destroy

  # Validations
  accepts_nested_attributes_for :certifications, :addresses, :guides, :theme, :social_links, :testimonials, :team, :listings, reject_if: :new_record?
  validates :first_name, presence: true

  # Scopes

  # Methods

  # Returns the full name (first + last + suffix) of an agent
  def full_name
    if self.suffix.present?
      "#{self.first_name} #{self.last_name}, #{self.suffix}"
    else
      "#{self.first_name} #{self.last_name}"
    end
  end

  def first_and_last_name
    "#{self.first_name} #{self.last_name}"
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
      "#{self.first_name.try(&:downcase)}@XXXXXX.XXX"
    end
  end
end

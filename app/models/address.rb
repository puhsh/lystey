class Address < ActiveRecord::Base
  extend Enumerize

  # Attributes
  enumerize :address_type, in: [:office, :mailing], scope: true, predicates: true
  geocoded_by :full_address, latitude: :office_latitude, longitude: :office_longitude

  # Relationships
  belongs_to :agent, touch: true

  # Validations
  validates :line_1, presence: true, unless: :same_as_office?
  validates :city, presence: true, unless: :same_as_office?
  validates :state, presence: true, unless: :same_as_office?
  validates :zipcode, presence: true, unless: :same_as_office?

  # Callbacks
  after_validation :geocode, if: ->(x) { x.address_type == :office  && (x.line_1_changed? || x.line_2_changed? || x.line_3_changed? || x.city_changed? || x.state_changed? || x.zipcode_changed?) }

  # Scopes

  # Methods
  def full_address
    [self.line_1, self.line_2, self.line_3, self.city, self.state, self.zipcode].reject(&:blank?).join(", ")
  end
end

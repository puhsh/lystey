class Certification < ActiveRecord::Base
  extend Enumerize

  # Attributes
  enumerize :certification_type, in: [:abr, :abrm, :ahwd, :alc, :bpor, :ccim, :cips, :cpm, :crb, :cre, :crs, :epro, :gaa, :green, :gri, :mrp, :pmn, :raa, :rsps, :sfr, :sior, :srres, :srs]

  # Relationships
  belongs_to :agent

  # Validations
  validates :certification_type, presence: true, uniqueness: { scope: :agent_id }

  # Scopes

  # Methods
end

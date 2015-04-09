class Realtor < ActiveRecord::Base
  extend Enumerize

  # Attributes
  enumerize :license_type, in: [:sale, :brk, :bllc, :bcrp, :six, :reb, :prin, :rein, :apin, :illc, :icrp, :erwi, :erwo]
  enumerize :license_status, in: ['20', '21', '30', '31', '45', '47', '56', '57', '80']
  enumerize :education_status, in: ['0', '1', '2']
  enumerize :mce_status, in: ['0', '1', '2']
  enumerize :designated_supervisor_flag, in: ['0', '1']
  enumerize :related_license_type, in: [:sale, :brk, :bllc, :bcrp, :six, :reb, :prin, :rein, :apin, :illc, :icrp, :erwi, :erwo]

  # Relationships

  # Scopes

  # Validations

  # Methods
end

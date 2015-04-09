namespace :realtors do

  desc 'Populates Texas Realtors'
  task populate_texas: :environment do
    File.open("#{ENV['HOME']}/Dropbox/Realtors/Mailing Lists/Texas/trecfile.txt").each do |line|
      data = line.split("\t")
      r = Realtor.new.tap do |r|
        r.license_type = data[0] == "6" ? :six : data[0].downcase
        r.license_number = data[1]
        r.full_name = data[2]
        r.suffix = data[3].present? ? data[3] : nil
        r.license_status = data[4]
        r.original_license_date = data[5].to_date
        r.license_expiration_date = data[6].to_date
        r.education_status = data[7]
        r.mce_status = data[8]
        r.designated_supervisor_flag = data[9]
        r.phone_number = data[10]
        r.email = data[11]
        r.related_license_type = data[26] == "6" ? :six : data[26].downcase
        r.related_license_number = data[27].present? ? data[27] : nil
        r.related_license_full_name = data[28] == "\u0000" ? nil : data[28]
        r.related_license_suffix = data[29].present? ? data[29] : nil
        r.relationship_start_date = data[30].present? ? data[30].to_date : nil
        r.agency_identifier = data[31]
        r.key_name = data[32]
      end

      # Check for a mailing address
      if data[12] != "\u0000"
        mailing_address = r.addresses.build
        mailing_address.address_type = :mailing
        mailing_address.address_line_1 = data[12] == "\u0000" ? nil : data[12]
        mailing_address.address_line_2 = data[13] == "\u0000" ? nil : data[13]
        mailing_address.address_line_3 = data[14] == "\u0000" ? nil : data[14]
        mailing_address.city = data[15].present? ? data[15] : nil
        mailing_address.state_code = data[16].present? ? data[16] : nil
        mailing_address.zip_code = data[17].present? ? data[17] : nil
        mailing_address.county_code = data[18].present? ? data[18] : nil
      end

      # Check for a physical address
      if data[19] != "\u0000"
        physical_address = r.addresses.build
        physical_address.address_type = :physical
        physical_address.address_line_1 = data[19] == "\u0000" ? nil : data[19]
        physical_address.address_line_2 = data[20] == "\u0000" ? nil : data[20]
        physical_address.address_line_3 = data[21] == "\u0000" ? nil : data[21]
        physical_address.city = data[22].present? ? data[22] : nil
        physical_address.state_code = data[23].present? ? data[23] : nil
        physical_address.zip_code = data[24].present? ? data[24] : nil
        physical_address.county_code = data[25].present? ? data[25] : nil
      end

      r.save!
    end
  end
end

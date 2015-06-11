require 'rails_helper'

RSpec.describe Address, :type => :model do
  it { is_expected.to belong_to(:agent) }

  describe '#office_first' do
    let!(:office) { FactoryGirl.create(:address, address_type: :office) }
    let!(:mailing) { FactoryGirl.create(:address, address_type: :mailing) }

    it 'sorts the office address first' do
      expect(Address.all.office_first.first).to eq(office)
      expect(Address.all.office_first.last).to eq(mailing)
    end
  end
end

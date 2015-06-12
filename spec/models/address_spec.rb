require 'rails_helper'

RSpec.describe Address, :type => :model do
  it { is_expected.to belong_to(:agent) }

  describe '.line_1' do
    let(:address) { FactoryGirl.build(:address) }

    it 'is required' do
      address.line_1 = nil
      address.save
      expect(address).to_not be_valid
    end

    it 'is not required if the same_as_office flag is true' do
      address.same_as_office = true
      address.line_1 = nil
      address.save
      expect(address).to be_valid
    end
  end

  describe '.city' do
    let(:address) { FactoryGirl.build(:address) }

    it 'is required' do
      address.city = nil
      address.save
      expect(address).to_not be_valid
    end

    it 'is not required if the same_as_office flag is true' do
      address.same_as_office = true
      address.city = nil
      address.save
      expect(address).to be_valid
    end
  end

  describe '.state' do
    let(:address) { FactoryGirl.build(:address) }

    it 'is required' do
      address.state = nil
      address.save
      expect(address).to_not be_valid
    end

    it 'is not required if the same_as_office flag is true' do
      address.same_as_office = true
      address.state = nil
      address.save
      expect(address).to be_valid
    end
  end

  describe '.zipcode' do
    let(:address) { FactoryGirl.build(:address) }

    it 'is required' do
      address.zipcode = nil
      address.save
      expect(address).to_not be_valid
    end

    it 'is not required if the same_as_office flag is true' do
      address.same_as_office = true
      address.zipcode = nil
      address.save
      expect(address).to be_valid
    end
  end
end

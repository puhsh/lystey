require 'rails_helper'

RSpec.describe Certification, type: :model do
  it { is_expected.to belong_to(:agent) }

  context "when creating and updating" do
    subject(:certification) { FactoryGirl.build(:certification) }
    subject(:certification2) { FactoryGirl.build(:certification) }
    subject(:invalid_certification) { FactoryGirl.build(:certification) }

    describe '.certification_type' do
      it 'is required' do
        certification.save
        expect(certification).to_not be_valid
      end

      it 'is unique' do
        certification.certification_type = :green
        certification.save
        invalid_certification.certification_type = :green
        invalid_certification.save
        expect(invalid_certification).to_not be_valid
      end

      it 'is not unique between two different agents' do
        agent = FactoryGirl.create(:agent)
        agent2 = FactoryGirl.create(:agent)
        certification.certification_type = :green
        certification.agent = agent
        certification.save
        certification2.certification_type = :green
        certification2.agent = agent2
        certification2.save
        expect(certification).to be_valid
        expect(certification2).to be_valid
      end
    end
  end
end

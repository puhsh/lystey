require 'rails_helper'

RSpec.describe Biography, type: :model do
  it { is_expected.to belong_to(:agent) }

  context 'when creation' do
    subject(:bio) { FactoryGirl.build(:biography, :with_title, :with_bios) }
    subject(:bio_with_bios) { FactoryGirl.build(:biography, :with_bios) }

    describe '.title' do
      it 'is required' do
        bio_with_bios.save
        expect(bio_with_bios).to_not be_valid
      end
    end

    describe '.short_bio' do
      it { is_expected.to validate_length_of(:short_bio).is_at_most(250) }

      it 'is required' do
        bio.short_bio = nil
        bio.save
        expect(bio).to_not be_valid
      end
    end

    describe '.long_bio' do
      it { is_expected.to validate_length_of(:long_bio).is_at_most(10000) }

      it 'is required' do
        bio.long_bio = nil
        bio.save
        expect(bio).to_not be_valid
      end
    end
  end

  context 'when updating' do
    subject(:agent) { FactoryGirl.create(:agent) }
    subject(:bio) { FactoryGirl.create(:biography, :with_title, :with_bios, agent: agent) }

    describe '.title' do
      it 'is required' do
        bio.title = nil
        bio.save
        expect(bio).to_not be_valid
      end
    end

    describe '.short_bio' do
      it 'is required' do
        bio.short_bio = nil
        bio.save
        expect(bio).to_not be_valid
      end
    end

    describe '.long_bio' do
      it 'is required' do
        bio.long_bio = nil
        bio.save
        expect(bio).to_not be_valid
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Team, type: :model do
  it { is_expected.to belong_to(:agent) }
  it { is_expected.to have_many(:job_openings).dependent(:destroy) }
  it { is_expected.to have_many(:team_members).dependent(:destroy) }

  context 'when creating' do
    subject(:team) { FactoryGirl.build(:team, title: "My Team", about: "This is a team") }

    describe '.title' do
      it { is_expected.to validate_length_of(:title).is_at_most(100) }

      it 'is required' do
        team.title = nil
        team.save
        expect(team).to_not be_valid
      end
    end

    describe '.about' do
      it { is_expected.to validate_length_of(:about).is_at_most(10000) }

      it 'is required' do
        team.about = nil
        team.save
        expect(team).to_not be_valid
      end
    end
  end

  context 'when updating' do
    subject(:team) { FactoryGirl.create(:team, title: "My Team", about: "This is a team") }

    describe '.title' do
      it 'is required' do
        team.title = nil
        team.save
        expect(team).to_not be_valid
      end
    end

    describe '.about' do
      it 'is required' do
        team.about = nil
        team.save
        expect(team).to_not be_valid
      end
    end
  end
end

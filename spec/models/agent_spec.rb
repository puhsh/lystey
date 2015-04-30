require 'rails_helper'

RSpec.describe Agent, :type => :model do
  it { is_expected.to have_many(:addresses).dependent(:destroy) }
  it { is_expected.to have_many(:social_links).dependent(:destroy) }
  it { is_expected.to have_many(:certifications).dependent(:destroy) }
  it { is_expected.to have_one(:broker).dependent(:destroy) }
  it { is_expected.to have_one(:biography).dependent(:destroy) }


  context 'when unregistered' do
    let(:agent) { FactoryGirl.create(:agent, first_name: 'John', last_name: 'Smith')}

    describe '.full_name' do
      let(:agent_with_suffix) { FactoryGirl.create(:agent, first_name: 'John', last_name: 'Smith', suffix: 'Jr.')}

      it 'returns a combination of first and last name if there is no suffix' do
        expect(agent.full_name).to eql('John Smith')
      end

      it 'returns a combination of first, last and suffix if there is a suffix' do
        expect(agent_with_suffix.full_name).to eql('John Smith, Jr.')
      end
    end

    describe '.phone_number' do
      it 'returns a placeholder number' do
        expect(agent.phone_number).to eql('(972) 555-XXXX')
      end

      it 'returns a placeholder number even if a phone number exists in the DB' do
        agent.phone_number = '(972) 555-5555'
        agent.save
        expect(agent.reload.read_attribute(:phone_number)).to eql('(972) 555-5555')
        expect(agent.reload.phone_number).to eql('(972) 555-XXXX')
      end
    end

    describe '.email' do
      it 'returns a placeholder email' do
        expect(agent.email).to eql('john@XXXXXX.XXX')
      end

      it 'returns a placeholder email even if an email exists in the DB' do
        agent.email = 'john@gmail.com'
        agent.save
        expect(agent.reload.read_attribute(:email)).to eql('john@gmail.com')
        expect(agent.reload.email).to eql('john@XXXXXX.XXX')
      end
    end
  end

  context 'when registered' do
    let(:agent) { FactoryGirl.create(:agent, :registered, first_name: 'John', last_name: 'Smith')}

    describe '.full_name' do
      let(:agent_with_suffix) { FactoryGirl.create(:agent, :registered, first_name: 'John', last_name: 'Smith', suffix: 'Jr.')}

      it 'returns a combination of first and last name if there is no suffix' do
        expect(agent.full_name).to eql('John Smith')
      end

      it 'returns a combination of first, last and suffix if there is a suffix' do
        expect(agent_with_suffix.full_name).to eql('John Smith, Jr.')
      end
    end

    describe '.phone_number' do
      it 'returns their phone number' do
        agent.phone_number = '(972) 555-5555'
        agent.save
        expect(agent.reload.read_attribute(:phone_number)).to eql('(972) 555-5555')
      end

      it 'does not return the placeholder number' do
        agent.phone_number = '(972) 555-5555'
        agent.save
        expect(agent.reload.phone_number).to_not eql('(972) 555-XXXX')
      end
    end

    describe '.email' do
      it 'returns their email' do
        agent.email = 'john@gmail.com'
        agent.save
        expect(agent.reload.read_attribute(:email)).to eql('john@gmail.com')
      end

      it 'does not return the placeholder email' do
        agent.email = 'john@gmail.com'
        agent.save
        expect(agent.reload.email).to_not eql('john@XXXXXX.XXX')
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Broker, type: :model do
  it { is_expected.to belong_to(:agent) }

  context 'when agent is unregistered' do
    subject(:agent) { FactoryGirl.create(:agent) }
    subject(:broker) { FactoryGirl.create(:broker, agent: agent) }

    describe ".name" do
      it 'returns a placeholder if the agent is unregistered' do
        expect(broker.name).to eql("Unknown. Register to complete")
      end

      it 'returns a placeholder if the agent is unregistered and somehow a name already exists in the db' do
        broker.name = "Test Brokerage"
        broker.save
        expect(broker.reload.name).to eql("Unknown. Register to complete")
      end
    end
  end

  context 'when agent is registered' do
    subject(:agent) { FactoryGirl.create(:agent, :registered) }
    subject(:broker) { FactoryGirl.create(:broker, agent: agent, name: "Test Brokerage") }

    describe ".name" do
      it 'returns a the name if the agent is registered' do
        expect(broker.name).to eql("Test Brokerage")
      end
    end
  end
end

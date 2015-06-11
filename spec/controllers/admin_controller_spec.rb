require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  context 'html' do
    describe '#show' do
      let(:agent) { FactoryGirl.create(:agent, :registered, first_name: 'John', last_name: 'Smith') }

      it 'finds the agent from the slug' do
        get :index, {agent_id: agent.slug }
        expect(assigns[:agent]).to eql(agent)
      end

      it 'finds the agent from the regular id' do
        get :index, {agent_id: agent.id }
        expect(assigns[:agent]).to eql(agent)
      end

      it 'will build a new certification if none exist' do
        get :index, {agent_id: agent.id }
        expect(assigns[:agent].certifications).to_not be_empty
        expect(assigns[:agent].certifications.any? { |x| x.new_record? }).to eql(true)
      end

      it 'will not build a new ceritification if there is one that exists' do
        FactoryGirl.create(:certification, certification_type: :green, agent: agent)
        get :index, {agent_id: agent.id }
        expect(assigns[:agent].certifications.count).to eql(agent.certifications.count)
        expect(assigns[:agent].certifications.any? { |x| x.new_record? }).to eql(false)
      end

      it 'will find the office address' do
        FactoryGirl.create(:address, address_type: :office, agent: agent)
        get :index, {agent_id: agent.id }
        expect(assigns[:office_address]).to eql(agent.addresses.first)
      end

      it 'will create a new record if it can\'t find a office address' do
        get :index, {agent_id: agent.id }
        expect(assigns[:office_address]).to be_new_record
      end

      it 'will find the mailing address' do
        FactoryGirl.create(:address, address_type: :mailing, agent: agent)
        get :index, {agent_id: agent.id }
        expect(assigns[:mailing_address]).to eql(agent.addresses.first)
      end

      it 'will create a new record if it can\'t find a mailing address' do
        get :index, {agent_id: agent.id }
        expect(assigns[:mailing_address]).to be_new_record
      end
    end
  end
end

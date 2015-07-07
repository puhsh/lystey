require 'rails_helper'

RSpec.describe BrokersController, type: :controller do
  context 'html' do
    let(:agent) { FactoryGirl.create(:agent, registered: true) }

    describe '#new' do
      it 'finds the agent' do
        get :new, agent_id: agent.id
        expect(assigns[:agent]).to eq(agent)
      end

      it 'renders to new page and builds a new broker if no broker exists' do
        get :new, agent_id: agent.id
        expect(response).to be_success
        expect(assigns[:broker]).to be_new_record
        expect(assigns[:broker].agent).to eq(agent)
      end
    end

    describe '#create' do
      it 'creates a new broker' do
        post :create, agent_id: agent.id, broker: { name: 'Test' }
        expect(assigns[:broker]).to eq(agent.reload.broker)
      end

      it 'redirects to the edit page for the broker after creating' do
        post :create, agent_id: agent.id, broker: { name: 'Test' }
        expect(response).to redirect_to(agent_edit_brokers_path)
      end

      it 'redirects to the new page if it is not created' do
        post :create, agent_id: agent.id, broker: { name: nil }
        expect(response).to render_template(:new)
        expect(assigns[:broker]).to_not be_valid
        expect(flash[:alert]).to_not be_nil
      end
    end

    describe '#edit' do
      let(:broker) { FactoryGirl.create(:broker, agent: agent) }
      it 'finds the broker' do
        get :edit, agent_id: agent.id, id: broker.id
        expect(assigns[:broker]).to eq(broker)
      end
    end

    describe '#update' do
      let(:broker) { FactoryGirl.create(:broker, agent: agent) }

      it 'updates a  broker' do
        put :update, agent_id: agent.id, id: broker.id, broker: { name: 'Test Update' }
        expect(agent.reload.broker.name).to eql('Test Update')
      end

      it 'redirects to the edit page for the broker after update' do
        put :update, agent_id: agent.id, id: broker.id, broker: { name: 'Test Update' }
        expect(response).to redirect_to(agent_edit_brokers_path)
      end

      it 'redirects to the edit page if it is not update' do
        put :update, agent_id: agent.id, id: broker.id, broker: { name: nil }
        expect(response).to render_template(:edit)
        expect(assigns[:broker]).to_not be_valid
        expect(flash[:alert]).to_not be_nil
      end
    end
  end
end

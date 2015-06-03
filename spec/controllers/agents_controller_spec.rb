require 'rails_helper'

RSpec.describe AgentsController, :type => :controller do
  context 'html' do
    describe '#show' do
      let(:agent) { FactoryGirl.create(:agent, :registered, first_name: 'John', last_name: 'Smith') }

      it 'finds the agent from the slug' do
        get :show, {id: agent.slug }
        expect(assigns[:agent]).to eql(agent)
      end

      it 'finds the agent from the regular id' do
        get :show, {id: agent.id }
        expect(assigns[:agent]).to eql(agent)
      end

      it 'redirects a request with an id param to the same action with the friendly id' do
        get :show, {id: agent.id }
        expect(assigns[:agent]).to eql(agent)
        expect(response).to redirect_to(agent_path(assigns[:agent].friendly_id))
      end
    end
  end

  context 'json' do
    describe '#show' do
      let(:agent) { FactoryGirl.create(:agent, :registered, first_name: 'John', last_name: 'Smith') }

      it 'finds the agent from the regular id' do
        get :show, {id: agent.id, format: :json }
        expect(response.body).to eql(agent.to_json)
      end

      it 'should not attempt any redirects' do
        get :show, {id: agent.id, format: :json }
        expect(response).to_not be_redirect
      end
    end
  end
end

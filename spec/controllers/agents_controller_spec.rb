require 'rails_helper'

RSpec.describe AgentsController, :type => :controller do
  context 'html' do
    describe '#show' do
      let(:agent) { FactoryGirl.create(:agent, :registered, first_name: 'John', last_name: 'Smith') }

      it 'finds the agent from the slug' do
        get :show, {id: agent.friendly_id }
        expect(assigns[:agent]).to eql(agent)
      end

      it 'redirects a non-friendly id to the controller using the friendly id' do
        get :show, {id: agent.id }
        expect(assigns[:agent]).to eql(agent)
        expect(response).to redirect_to(agent_path(agent.friendly_id))
      end

      it 'renders the show template' do
        get :show, {id: agent.friendly_id }
        expect(response).to render_template(:show)
      end
    end
  end
end

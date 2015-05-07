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

      it 'finds the agent from the subdomain' do
        @request.host = "#{agent.slug}.example.com"
        get :show
        expect(assigns[:agent]).to eql(agent)
      end

      it 'redirects a request with a non-friendly id param to controller with the subdomain set to the friendly id' do
        get :show, {id: agent.id }
        expect(assigns[:agent]).to eql(agent)
        expect(response).to redirect_to(agent_root_url(subdomain: assigns[:agent].slug))
      end

      it 'redirects a request with a friendly id param to the controller with the subdomain set to the friendly id' do
        get :show, {id: agent.id }
        expect(assigns[:agent]).to eql(agent)
        expect(response).to redirect_to(agent_root_url(subdomain: assigns[:agent].slug))
      end
      
      it 'renders the show template for a request with the agent slug in the subdomain' do
        @request.host = "#{agent.slug}.example.com"
        get :show
        expect(response).to render_template(:show)
      end
    end
  end
end

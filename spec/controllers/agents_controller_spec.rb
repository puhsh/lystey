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

    describe '#edit' do
      let(:agent) { FactoryGirl.create(:agent, :registered, first_name: 'John', last_name: 'Smith') }

      it 'finds the agent from the slug' do
        get :edit, {id: agent.slug }
        expect(assigns[:agent]).to eql(agent)
      end

      it 'finds the agent from the regular id' do
        get :edit, {id: agent.id }
        expect(assigns[:agent]).to eql(agent)
      end

      it 'will build a new certification if none exist' do
        get :edit, {id: agent.id }
        expect(assigns[:agent].certifications).to_not be_empty
        expect(assigns[:agent].certifications.any? { |x| x.new_record? }).to eql(true)
      end

      it 'will not build a new ceritification if there is one that exists' do
        FactoryGirl.create(:certification, certification_type: :green, agent: agent)
        get :edit, {id: agent.id }
        expect(assigns[:agent].certifications.count).to eql(agent.certifications.count)
        expect(assigns[:agent].certifications.any? { |x| x.new_record? }).to eql(false)
      end

      it 'will find the office address' do
        FactoryGirl.create(:address, address_type: :office, agent: agent)
        get :edit, {id: agent.id }
        expect(assigns[:office_address]).to eql(agent.addresses.first)
      end

      it 'will create a new record if it can\'t find a office address' do
        get :edit, {id: agent.id }
        expect(assigns[:office_address]).to be_new_record
      end

      it 'will find the mailing address' do
        FactoryGirl.create(:address, address_type: :mailing, agent: agent)
        get :edit, {id: agent.id }
        expect(assigns[:mailing_address]).to eql(agent.addresses.first)
      end

      it 'will create a new record if it can\'t find a mailing address' do
        get :edit, {id: agent.id }
        expect(assigns[:mailing_address]).to be_new_record
      end
    end

    describe '#update' do
      let(:agent) { FactoryGirl.create(:agent, :registered, first_name: 'John', last_name: 'Smith') }

      it 'updates basic information' do
        put :update, id: agent.id, agent: { first_name: 'Bill', last_name: 'Jones' }
        expect(agent.reload.first_name).to eql('Bill')
        expect(agent.reload.last_name).to eql('Jones')
      end

      it 'redirects to the edit page after a successful update' do
        put :update, id: agent.id, agent: { first_name: 'Bill', last_name: 'Jones' }
        expect(response).to redirect_to(edit_agent_path(agent))
      end

      it 'redirects to the edit path with an error if there is not a successful update' do
        put :update, id: agent.id, agent: { first_name: nil, last_name: 'Jones' }
        expect(response).to redirect_to(edit_agent_path(agent))
        expect(flash[:alert]).to be_present
      end

      it 'redirects to the edit guides path if the from_section param is sent with the value of guides' do
        put :update, id: agent.id, agent: { first_name: 'Bill', last_name: 'Jones' }, from_section: 'guides'
        expect(response).to redirect_to(agent_edit_guides_path(agent))
      end
    end

    describe '#guides' do
      let(:agent) { FactoryGirl.create(:agent, :registered, first_name: 'John', last_name: 'Smith') }

      it 'finds an existing buyer guide' do
        buyers_guide = FactoryGirl.create(:guide, guide_type: :buyers, agent: agent)
        get :guides, agent_id: agent.id

        expect(assigns[:buyers_guide]).to eq(buyers_guide)
      end

      it 'builds a new buyer guide if one does not exist' do
        get :guides, agent_id: agent.id
        expect(assigns[:buyers_guide]).to be_new_record
      end

      it 'finds an existing seller guide' do
        sellers_guide = FactoryGirl.create(:guide, guide_type: :sellers, agent: agent)
        get :guides, agent_id: agent.id
        expect(assigns[:sellers_guide]).to eq(sellers_guide)
      end

      it 'builds a new seller guide if one does not exist' do
        get :guides, agent_id: agent.id
        expect(assigns[:sellers_guide]).to be_new_record
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

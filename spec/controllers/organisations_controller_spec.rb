require "rails_helper"
require_relative "../support/helper_methods"

RSpec.describe OrganisationsController, type: :controller do
  describe 'GET organisations#index ' do
    it "displays exising organisations" do
      organisation = add_new_org
      get :index
      expect(assigns(:organisations)).to eq([organisation])
    end
  end
  
  describe 'GET organisations#show ' do
    it "finds and joins an organisation" do
      expect(get: "/organisations/1").to route_to(
        controller: "organisations",
        action: "show",
        id: "1"
      )
    end

    it "finds and joins an organisation" do
      add_new_org
      get :show, xhr: true, params: { id: 2 }
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST organisations#create' do
    it "creates and joins an organisation" do
      post :create, params: post_create_organisation_params
      expect(response).to redirect_to(organisations_url + "/#{Organisation.last.id}")
    end

    it "doesn\'t create organisation with invalid input" do
      post :create,
      params: {
        organisation: {
          name: nil,
          hourly_rate: nil
        }
      }
      expect{ get :create }.to raise_error(ActionController::ParameterMissing)
    end

    it "informs user organisation is created successfully" do
      post :create, params: post_create_organisation_params
      expect(flash[:notice]).to match('Organisation created successfully!')
    end
  end

  describe 'PATCH organisations#update' do
    let(:updated_org) { patch :update, :params => { id: Organisation.last.id,
        :organisation => { name: 'Treehouse', hourly_rate: 18.00 }
      }
    }

    before :each do
      add_new_org
      updated_org
    end

    it "updates organisation and redirects its overview" do
      expect(response).to redirect_to(organisations_url + "/#{Organisation.last.id}")
    end

    it "informs user organisation updated successfully" do
      expect(flash[:notice]).to match('Organisation updated successfully!')
    end

    it "updates organisation and responds with status 302" do
      expect(response).to have_http_status(302)
    end
  end

  describe 'DELETE organisations#destroy ' do
    let(:delete_org) { delete :destroy, :params => { id: Organisation.last.id } }
    
    before :each do
      add_new_org
      delete_org
    end

    it "deletes an organisation and redirects to all organisations" do
      expect(response).to redirect_to(organisations_path)
    end

    it "informs user organisation deleted successfully" do
      expect(flash[:notice]).to match('Shift successfully deleted!')
    end

    it "deletes organisation and responds with status 302" do
      expect(response).to have_http_status(302)
    end
  end
end

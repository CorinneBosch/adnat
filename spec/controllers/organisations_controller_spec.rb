require "rails_helper"

RSpec.describe OrganisationsController, type: :controller do
  login_user

  before :each do
    @sample_org = add_new_organisation
  end

  describe 'GET organisations#index ' do
    it "displays exising organisations" do
      get :index
      expect(assigns(:organisations)).to eq([@sample_org])
    end
  end
  
  describe 'GET organisations#show ' do
    it "finds and joins an organisation" do
      expect(get: "/organisations/#{@sample_org.id}").to route_to(
        controller: "organisations",
        action: "show",
        id: "#{@sample_org.id}"
      )
    end

    it "finds and joins an organisation" do
      get :show, xhr: true, params: { id: @sample_org.id }
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
      }, xhr: true
      expect{ get :create }.to raise_error(ActionController::ParameterMissing)
    end

    it "informs user organisation is created successfully" do
      post :create, params: post_create_organisation_params
      expect(flash[:notice]).to match('Organisation created successfully!')
    end
  end

  describe 'PATCH organisations#update' do
    let(:updated_org) { patch :update, :params => { id: @sample_org.id,
        :organisation => { name: 'Treehouse', hourly_rate: 18.00 }
      }, xhr: true
    }

    before :each do
      updated_org
    end

    it "updates organisation and redirects its overview" do
      expect(response).to redirect_to(organisations_url)
    end

    it "informs user organisation updated successfully" do
      expect(flash[:notice]).to match("Treehouse updated successfully!")
    end

    it "updates organisation and responds with status 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE organisations#destroy ' do
    let(:delete_org) { delete :destroy, :params => { id: Organisation.last.id } }
    
    before :each do
      delete_org
    end

    it "deletes an organisation and redirects to all organisations" do
      expect(response).to redirect_to(organisations_path)
    end

    it "informs user organisation deleted successfully" do
      expect(flash[:notice]).to match('Organisation successfully deleted!')
    end

    it "deletes organisation and responds with status 302" do
      expect(response).to have_http_status(302)
    end
  end
end

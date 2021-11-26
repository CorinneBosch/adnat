class OrganisationsController < ApplicationController
  def index
    @organisations = Organisation.all.order(created_at: :desc)
  end
end

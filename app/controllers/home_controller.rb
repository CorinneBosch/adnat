class HomeController < ApplicationController
  def index
      redirect_to organisations_path if user_signed_in?
  end
end

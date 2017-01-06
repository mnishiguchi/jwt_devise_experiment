class ReactController < ApplicationController
  before_action :authenticate_request!, except: :home

  def index
    respond_to do |format|
      format.html
      format.json { render json: { 'logged_in' => true } }
    end
  end
end

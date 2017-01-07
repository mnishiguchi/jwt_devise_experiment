class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session

  # For Devise to work with Knock.
  include Knock::Authenticable
  undef_method :current_identity
end

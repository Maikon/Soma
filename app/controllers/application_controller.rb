require 'digest/hmac'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def auth
    begin
      challenge = Digest::HMAC.hexdigest("asoidfhlaiorluvhtniur2", params[:key], Digest::SHA1)
      app = App.find_by_key(params[:key])
      app.token = Digest::HMAC.hexdigest(challenge, app.secret, Digest::SHA1)
      app.save
      render json: {challenge: challenge}
    rescue Exception => e
      render json: {message: "Please make sure to register your application"}, :status => :unauthorized
    end
    
  end
end

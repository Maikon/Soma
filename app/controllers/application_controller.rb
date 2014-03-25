require 'digest/hmac'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def auth
    puts '&' * 80
    puts params[:key]
    puts '&' * 80

    challenge = Digest::HMAC.hexdigest("asoidfhlaiorluvhtniur2", params[:key], Digest::SHA1)
    # session[:app]= the app
    session[:token] = Digest::HMAC.hexdigest(challenge, App.find_by_key(params[:key]).secret, Digest::SHA1)
    puts '*' * 80
    puts '*' * 80
    puts session[:token]
    puts '*' * 80
    puts '*' * 80
    render json: {challenge: challenge}
  end
end

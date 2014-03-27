class UsersController < ApplicationController
  def create
    app = App.find_by_token(params[:token])
    user = User.create(app_user_id: params[:user_id], app: app)
  end
end

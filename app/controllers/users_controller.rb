class UsersController < ApplicationController
  # GET /users or /users.json
  def index
    @users = User.all
    render 'index'
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
    render 'show'
  end
end

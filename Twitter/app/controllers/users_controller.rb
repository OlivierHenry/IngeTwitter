class UsersController < ApplicationController
  def new
  @title = "Inscription"
  end
  def show
	@user = User.find(params[:id])
  end
end

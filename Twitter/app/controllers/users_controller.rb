class UsersController < ApplicationController
  def new
  @title = "Inscription"
  end
  def show
	@user = User.find(params[:id])
	@title = @user.nom
  end
  
end

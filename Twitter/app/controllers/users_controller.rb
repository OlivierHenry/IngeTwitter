class UsersController < ApplicationController
	before_filter :authenticate, :only => [:index, :edit, :update]
	before_filter :correct_user, :only => [:edit, :update]
	
  def new
	@user = User.new
	@title = "Inscription"
  end
  
  def index
	@title = "Tous les utilisateurs"
	@users = User.all
  end
  
  def show
	@user = User.find(params[:id])
	@title = @user.nom
  end
  
  def create
	@user = User.new(params[:user])
	if @user.save
		#succes d'enregistrement
		flash[:success] = "Bienvenue dans Twitter Like ;)"
		redirect_to @user
	else
		@titre = "Inscription"
		render 'new'
	end
  end
  
  def edit
	@user = User.find(params[:id])
	@title = "Edition du profil"
  end
  
  def update
	@user = User.find(params[:id])
	if @user.update_attributes(params[:user])
		flash[:success] = "Profil actualise."
		redirect_to @user
	else
		@title = "Edition du profil"
		render 'edit'
	end
  end
  
  def edit
	@title = "Edition du profil"
  end
  
  private
	def authenticate
		deny_access unless signed_in?
	end
	
	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_path) unless current_user?(@user)
	end
end

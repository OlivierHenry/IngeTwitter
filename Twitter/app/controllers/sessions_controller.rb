class SessionsController < ApplicationController
  def new
	@title = "S'identifier"
  end
  
  def create
	if User.nil?
		echo 'USER NUL'
	else
		user = User.authenticate(	params[:session][:email],
									params[:session][:password])
		if user.nil?
			#Créé un message d'erreur et rend le formulaire d'identification
			flash.now[:error] = "Mauvaise combinaison eMail/Mot de passe."
			@titre = "S'identifier"
			render 'new'
		else
			#Authentifie l'utilisateur
			sign_in user
			redirect_to user
		end
	end
  end
  
  def destroy
	sign_out
	redirect_to root_path
  end

end

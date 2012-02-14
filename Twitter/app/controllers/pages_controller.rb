class PagesController < ApplicationController
  def home
  @title = "Accueil"
  end

  def contact
  @title = "Contact"
  end

end

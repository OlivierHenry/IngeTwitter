class PagesController < ApplicationController
  def home
  @title = "Accueil"
  @micropost = Micropost.new if signed_in?
  @feed_items = current_user.feed.paginate(:page => params[:page])
  end

  def contact
  @title = "Contact"
  end

end

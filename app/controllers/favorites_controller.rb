class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.create(blog_id: params[:blog_id])
    @blog = Blog.find(params[:blog_id])

    respond_to do |format|
      format.js { render :favorite, locals: { favorite: @favorite, blog: @blog } }
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id])
    @blog = Blog.find_by(favorites: @favorite)
    @favorite.destroy
    
    respond_to do |format|
      format.js { render :favorite, locals: { favorite: @favorite, blog: @blog } }
    end
  end

end

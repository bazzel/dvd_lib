class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end
  
  def show
    @genre = Genre.find(params[:id])
  end
  
  def new
    @genre = Genre.new
  end
  
  def create
    @genre = Genre.new(params[:genre])
    if @genre.save
      flash[:notice] = "Successfully created genre."
      redirect_to @genre
    else
      render :action => 'new'
    end
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    if @genre.update_attributes(params[:genre])
      flash[:notice] = "Successfully updated genre."
      redirect_to @genre
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    flash[:notice] = "Successfully destroyed genre."
    redirect_to genres_url
  end
end

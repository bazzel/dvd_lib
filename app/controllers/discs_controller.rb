class DiscsController < ApplicationController
  def index
    @discs = Disc.all
  end
  
  def show
    @disc = Disc.find(params[:id])
  end
  
  def new
    @disc = Disc.new
  end
  
  def create
    @disc = Disc.new(params[:disc])
    if @disc.save
      flash[:notice] = "Successfully created disc."
      redirect_to @disc
    else
      render :action => 'new'
    end
  end
  
  def edit
    @disc = Disc.find(params[:id])
  end
  
  def update
    @disc = Disc.find(params[:id])
    if @disc.update_attributes(params[:disc])
      flash[:notice] = "Successfully updated disc."
      redirect_to @disc
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @disc = Disc.find(params[:id])
    @disc.destroy
    flash[:notice] = "Successfully destroyed disc."
    redirect_to discs_url
  end
end

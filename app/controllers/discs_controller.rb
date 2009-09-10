class DiscsController < ApplicationController
  def index
    # @discs = Disc.all(:order => 'position', :include => [:recordings, :latest_recording]).paginate(:per_page => 17, :page => params[:page])
    # a = Genre.find_by_name('Sci-Fi')
    @discs = Disc.for_genre(params[:genre_id]).
                  paginate(:per_page => 17, :page => params[:page])
    @disc = Disc.new
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
      redirect_to discs_url
    else
      flash[:error] = @disc.errors.full_messages
      @discs = Disc.all(:order => 'position')
      render :action => 'index'
    end
  end
  
  def edit
    @disc = Disc.find(params[:id])
  end
  
  def update
    @disc = Disc.find(params[:id])
    if @disc.update_attributes(params[:disc])
      flash[:notice] = "Successfully updated disc."
      redirect_to discs_url
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

  def sort
    # Handle calls made by offer dragging...
    params[:disc].each_with_index do |id, index|
      Disc.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end

end

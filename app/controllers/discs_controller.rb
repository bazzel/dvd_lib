class DiscsController < ApplicationController
  def index

    @search = Disc.for_genre(params[:genre_id]).
                  search(params[:search])
    @discs = @search.paginate(:per_page => 17, :page => params[:page])
    @genres = Genre.all
    @disc = Disc.new
    
    respond_to do |format|
        format.html
        format.iphone do  # action.iphone.erb
          if params[:page].to_i > 1
            render :layout => false, :partial => "discs"
          else
            render :layout => true
          end
        end
        format.xml { render :xml => @discs.to_xml(:include => :latest_recording) }
    end
    
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

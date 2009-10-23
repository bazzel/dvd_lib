class RecordingsController < ApplicationController
  def index
    @recordings = Recording.seen.paginate(:per_page => 25, :page => params[:page])
  end
  
  def show
    @recording = Recording.find(params[:id])
  end
  
  def new
    @recording = Recording.new
  end
  
  def create
    @recording = Recording.new(params[:recording])
    if @recording.save
      flash[:notice] = "Successfully created recording."
      redirect_to @recording
    else
      render :action => 'new'
    end
  end
  
  def edit
    @recording = Recording.find(params[:id])

    respond_to do |format|
        format.html
        format.iphone { render :layout => false }
    end
  end
  
  def update
    @recording = Recording.find(params[:id])
    if @recording.update_attributes(params[:recording])
      respond_to do |format|
        format.iphone do  # action.iphone.erb
          render :text => params[:id]
        end
          format.html do
            flash[:notice] = "Successfully updated recording."
            redirect_to @recording
          end
      end
      
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @recording = Recording.find(params[:id])
    @recording.destroy
    flash[:notice] = "Successfully destroyed recording."
    redirect_to recordings_url
  end
end

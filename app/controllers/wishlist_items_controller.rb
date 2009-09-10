class WishlistItemsController < ApplicationController
  def index
    
    @search = WishlistItem.search(params[:search])
    @wishlist_items = @search.paginate(:per_page => 10, :page => params[:page])
    
    
    # @wishlist_items = WishlistItem.all.paginate(:per_page => 10, :page => params[:page])
  end
  
  def show
    @wishlist_item = WishlistItem.find(params[:id])
  end
  
  def new
    @wishlist_item = WishlistItem.new
  end
  
  def create
    @wishlist_item = WishlistItem.new(params[:wishlist_item])
    if @wishlist_item.save
      flash[:notice] = "Successfully created wishlist item."
      redirect_to wishlist_items_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @wishlist_item = WishlistItem.find(params[:id])
  end
  
  def update
    @wishlist_item = WishlistItem.find(params[:id])
    if @wishlist_item.update_attributes(params[:wishlist_item])
      flash[:notice] = "Successfully updated wishlist item."
      redirect_to wishlist_items_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @wishlist_item = WishlistItem.find(params[:id])
    @wishlist_item.destroy
    flash[:notice] = "Successfully destroyed wishlist item."
    redirect_to wishlist_items_url
  end
end

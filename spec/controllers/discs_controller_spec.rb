require File.dirname(__FILE__) + '/../spec_helper'
 
describe DiscsController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Disc.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Disc.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Disc.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(disc_url(assigns[:disc]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Disc.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Disc.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Disc.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Disc.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Disc.first
    response.should redirect_to(disc_url(assigns[:disc]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    disc = Disc.first
    delete :destroy, :id => disc
    response.should redirect_to(discs_url)
    Disc.exists?(disc.id).should be_false
  end
end

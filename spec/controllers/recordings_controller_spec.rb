require File.dirname(__FILE__) + '/../spec_helper'
 
describe RecordingsController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Recording.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Recording.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Recording.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(recording_url(assigns[:recording]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Recording.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Recording.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Recording.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Recording.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Recording.first
    response.should redirect_to(recording_url(assigns[:recording]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    recording = Recording.first
    delete :destroy, :id => recording
    response.should redirect_to(recordings_url)
    Recording.exists?(recording.id).should be_false
  end
end

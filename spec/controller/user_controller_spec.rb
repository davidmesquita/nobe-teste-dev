require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  context "GET #index" do
    it "should success and render to index page" do
      get :index
      expect(response).to have_http_status(200)  
      expect(response).to render_template(:index) 
      
    end
    describe "POST /create" do
      it 'Create session' do
  
        post :create, params: { email: 'teste@teste2', password: 'teste1'}
          expect(response).to have_http_status(200)
      end
    end
    
    
  end
  

end
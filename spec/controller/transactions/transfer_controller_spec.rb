require 'rails_helper'

RSpec.describe Transactions::DepositController, :type => :controller do
  context "GET #index" do
    it "should success and render to index page" do
      get :index
      expect(response.status).to eq(200) 
      
    end
    
    
  end
  

end
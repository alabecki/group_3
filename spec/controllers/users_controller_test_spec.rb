require "rails_helper"

RSpec.describe UsersController, :type => :controller do
    describe "user controller methods" do
        before(:each) do
            user = FactoryGirl.create(:user)
            admin = FactoryGirl.create(:admin) 
            jan = FactoryGirl.create(:jan)
            pam = FactoryGirl.create(:pam)
        end
        
        it "check game count instance variables" do
            get :graphics
            assigns(:lolcount).should == 2
            assigns(:dotacount).should == 2
            assigns(:hotscount).should == 1
            assigns(:smitecount).should == 1
            assigns(:usercount).should == 4
        end
    end
end

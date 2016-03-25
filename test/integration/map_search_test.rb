require 'test_helper'

class MapSearchTest < ActionDispatch::IntegrationTest
   
   def setup
    @user = users(:Tim)
   end
   
   test "search reset" do
       get map_path
       
   end
   
    
end
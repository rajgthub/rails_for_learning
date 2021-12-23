require 'rails_helper'

feature "Todos", type: :feature do
 context "create todos" do
   scenario "valid todo" do 
    # binding.pry
    visit todos_home_path
    
   end
 end
 
end

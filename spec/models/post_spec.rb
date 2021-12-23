require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validation" do 
    let(:post){FactoryBot.build(:post)}
    it "should be valid" do
      post.title = nil
      expect(post).not_to be_valid 
    end
  end
end

require 'rails_helper'

RSpec.describe Comment, type: :model do
  fixtures :users, :posts

  describe "relationships" do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  it "is not valid blank" do
    expect(Comment.new).not_to be_valid
  end

  it "is valid with proper attributes" do
    expect(Comment.new(body: 'wat', user: User.first, post: Post.first)).to be_valid
  end

  it "is not valid without user" do
    expect(Comment.new(body: 'wat', post: Post.first)).not_to be_valid
  end

  it "is not valid with without post" do
    expect(Comment.new(body: 'wat', user: User.first)).not_to be_valid
  end


end

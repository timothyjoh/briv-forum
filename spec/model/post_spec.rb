require 'rails_helper'

RSpec.describe Post, type: :model do
  fixtures :users

  describe "relationships" do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
  end

  it "is not valid blank" do
    expect(Post.new).not_to be_valid
  end
  it "is valid with valid attributes" do
    hello = Post.new(title: 'Hello World', body: 'This is my story', user: User.first)
    expect(hello).to be_valid
  end

  it "is not valid without a user" do
    hello = Post.new(title: 'Hello World', body: 'This is my story')
    expect(hello).not_to be_valid
  end

end

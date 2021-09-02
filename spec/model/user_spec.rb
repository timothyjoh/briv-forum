require 'rails_helper'

RSpec.describe User, type: :model do

  describe "relationships" do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
  end

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should_not validate_presence_of(:username) }
  end

  it "is not valid blank" do
    expect(User.new).not_to be_valid
  end
  it "is valid with valid attributes" do
    erlich = User.new(email: 'erlich.b@aviato.com', password: 'bachmanity', password_confirmation: 'bachmanity')
    expect(erlich).to be_valid
  end

  it "is not valid with mismatch password" do
    richard = User.new(email: 'richard@piedpiper.com', password: 'insideout', password_confirmation: 'outsidein')
    expect(richard).not_to be_valid
  end

  it "is not valid with short password" do
    jianyang = User.new(email: 'jianyang@newpiedpiper.com', password: 'ugh', password_confirmation: 'ugh')
    expect(jianyang).not_to be_valid
  end

  it "creates a username seed" do
    jianyang = User.new(email: 'jianyang@newpiedpiper.com', password: 'erlichisafatpig', password_confirmation: 'erlichisafatpig')
    expect(jianyang.username_seed).to be_nil
    jianyang.save
    expect(jianyang.errors).to be_empty
    jianyang.reload
    expect(jianyang.username_seed).not_to be_nil
  end
end

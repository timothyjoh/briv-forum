require 'securerandom'

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates_uniqueness_of :username_seed, scope: :username

  before_create :generate_username_seed

  def generate_username_seed
    self.username_seed = (SecureRandom.random_number(9e4) + 1e4).to_i.to_s
  end
end

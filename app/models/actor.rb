class Actor < ActiveRecord::Base
  validates :name, presence: true
  has_many :actor_movies
  has_many :movies, through: :actor_movies
  has_many :comments, as: :commentable, dependent: :destroy
end

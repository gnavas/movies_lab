class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :year, presence: true, numericality: true 
  has_many :actor_movies
  has_many :actors, through: :actor_movies
  has_many :comments, as: :commentable, dependent: :destroy
end

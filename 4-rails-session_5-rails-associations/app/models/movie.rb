class Movie < ActiveRecord::Base
  has_many :reviews

  def self.all_ratings
    pluck(:rating).uniq
  end
end

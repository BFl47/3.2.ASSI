class Movie < ActiveRecord::Base
    def self.cancella(title)
        Movie.where(title: title).delete_all
    end
end

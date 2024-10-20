class Moviegoer < ApplicationRecord
    has_many :reviews

    def self.from_omniauth(auth)
        where(uid: auth.uid).first_or_create do |moviegoer|
            moviegoer.uid = auth.uid
            moviegoer.name = auth.info.name
        end
    end
end

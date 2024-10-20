class ApplicationController < ActionController::Base
	before_action :set_current_user

	protected

	def set_current_user
		@current_user ||= Moviegoer.where(uid: session[:user_id]).first # assegna solo se @current_user è null

		path = Rails.application.routes.recognize_path(request.url)
		controller = path[:controller]
		if controller == "reviews"
			# Se l'utente non è autenticato, reindirizzalo solo se il controller è quello per le recensioni
			unless @current_user
				redirect_to movies_path, flash: { notice: "You must be logged in to write a review." }
			end
		end
	end
end
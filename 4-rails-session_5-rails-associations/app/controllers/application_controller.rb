class ApplicationController < ActionController::Base
	before_action :set_current_user

	protected

	def set_current_user
		# we exploit the fact that the below query may return nil
		session[:user_id] = 27
		@current_user ||= Moviegoer.where(:uid => session[:user_id]).first
		redirect_to movies_path and return unless @current_user
	end
end
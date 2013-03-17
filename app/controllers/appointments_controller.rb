class AppointmentsController < ApplicationController
	def new
		@appointment = Appointment.new
	end
	
	def create
		@appointment = Appointment.create(params[:appointment])
		if @appointment.save
			redirect_to root_path
		else
			render 'new'
		end
	end


end

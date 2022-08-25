class BookingsController < ApplicationController


	before_action:set_booking, only:[:show,:edit,:destroy,:update]



	def index
		@bookings=current_user.bookings
	end

	def show
	end


	def new
		@booking=Booking.new
		
	end

	def edit
		
	end

	def create
		# @booking=Booking.new(booking_params)
		@booking=current_user.bookings.build(booking_params)
		# @booking.user =current_user
		# @booking.property_id = 4
		if @booking.save
			flash[:notice]="booking successfully created."
			redirect_to @booking			
		else
			render 'new'
		end
	end

	def destroy		
		@booking.destroy		
		redirect_to bookings_path,status: :see_other
		
	end

	def update		
		if @booking.update(booking_params)
			flash[:notice]="Booking Updated successfully"
			
			redirect_to @booking
		else
			render 'edit'
		end

	end
	def past_booking
		@bookings=current_user.bookings
	end

	def future_booking
		@bookings=current_user.bookings
	end

	private
		def set_booking
			@booking =Booking.find(params[:id])
		end

		def booking_params
			params.require(:booking).permit(:startDate,:endDate,:status,:price,:property_id)
		end

end
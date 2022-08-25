class PropertiesController < ApplicationController
	
	
	before_action :set_property, only:[:show,:edit,:destroy,:update, :bookings]



	def index
		@properties=current_user.properties
	end

	def show
	end


	def new
		@property=Property.new
		
	end

	def edit
		
	end

	def create
		@property=Property.new(property_params)
		@property.user =current_user
		if @property.save
			flash[:notice]="property successfully created."
			redirect_to @property
			
		else
			render 'new'
		end
	end

	def destroy		
		@property.destroy		
		redirect_to properties_path,status: :see_other
		
	end

	def update		
		if @property.update(property_params)
			flash[:notice]="property Updated successfully"
			
			redirect_to @property
		else
			render 'edit'
		end

	end
	def bookings
		
		@booking = @property.bookings
	end
	private
		def set_property
			@property =Property.find(params[:id])
		end

		def property_params
			params.require(:property).permit(:name,:address,:latitude,:longitude)
		end

end


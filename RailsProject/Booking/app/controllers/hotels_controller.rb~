class HotelsController < ApplicationController


  # GET /hotels
  # GET /hotels.json
  def index
    @hotels = Hotel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hotels }
    end
  end

  # GET /hotels/1
  # GET /hotels/1.json
  def show
    @hotel = Hotel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hotel }
    end
  end

  # GET /hotels/new
  # GET /hotels/new.json
  def new
    @hotel = Hotel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hotel }
    end
  end

  # GET /hotels/1/edit
  def edit
    @hotel = Hotel.find(params[:id])
  end

  # POST /hotels
  # POST /hotels.json
  def create
    @hotel = Hotel.new(params[:hotel])

    respond_to do |format|
      if @hotel.save
        format.html { redirect_to @hotel, notice: 'Hotel was successfully created.' }
        format.json { render json: @hotel, status: :created, location: @hotel }
      else
        format.html { render action: "new" }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hotels/1
  # PUT /hotels/1.json
  def update
    @hotel = Hotel.find(params[:id])

    respond_to do |format|
      if @hotel.update_attributes(params[:hotel])
        format.html { redirect_to @hotel, notice: 'Hotel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels/1
  # DELETE /hotels/1.json
  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy

    respond_to do |format|
      format.html { redirect_to hotels_url }
      format.json { head :no_content }
    end
  end
	
	def search
		
		cookies.delete(:country1)
		cookies.delete(:checkIn1)
		cookies.delete(:checkOut1)
		cookies.delete(:hotel_id1)
		@country=params[:country]
		@checkIn=params[:checkIn]
		@checkOut=params[:checkOut]
		
	
		#@hotel=Hotel.find_by_country("cairo")
		#@users = Hotel.find_by_sql(["SELECT * FROM hotels where country = ? ",@country])
			if @country
				#for user in @users
				#		@new=user.id
				#end
				#session[:country] = @country
				#session[:checkIn] = @checkIn
				#session[:checkOut] = @checkOut
				

				if Date.parse(params[:checkIn]) < Date.today
					cookies[:error1] = { value: "the check in date is in past", expires: 1.hour.from_now }
					redirect_to url_for(:controller => 'hotels',:action => 'search')
				else				
					if Date.parse(params[:checkOut]) > Date.parse(params[:checkIn]) 
						cookies.delete(:error1)
						cookies[:checkIn1] = { value: params[:checkIn], expires: 1.hour.from_now }
						cookies[:checkOut1] = { value: params[:checkOut], expires: 1.hour.from_now }
						cookies[:country1] = { value: params[:country], expires: 1.hour.from_now }

				   redirect_to url_for(:controller => 'hotels',:action => 'found')
					else
						cookies[:error1] = { value: "the check out must be > check in", expires: 1.hour.from_now }

						redirect_to url_for(:controller => 'hotels',:action => 'search')
					end
				end
			end 
	end 
	
	def found
			if cookies[:country1].blank?
				redirect_to url_for(:controller => 'hotels',:action => 'search')
			else
				@hotels = Hotel.find_by_sql(["SELECT * FROM hotels where country = ? ",cookies[:country1]])
				for hotel in @hotels
					@city=hotel.city
					@address=hotel.address
					@name=hotel.name
				end
			end
	end

#------------------------------------------------------------
	def searchComment
		@hotelName = params[:hotel]
		@region = params[:region]
			if @hotelName
		
				#cookies[:hotelName2] = { value: params[:hotel], expires: 1.hour.from_now }
				#cookies[:region2] = { value: params[:region], expires: 1.hour.from_now }
				@hotels = Hotel.find_by_sql(["SELECT * FROM hotels where name = ? and region = ?",@hotelName,@region])
				if @hotels.size>0
					for hotel in @hotels 
						cookies[:hotel_id1] = hotel.id
					end 

		  		redirect_to url_for(:controller => 'hotels',:action => 'roomComment')	

				else
					cookies[:error1] = { value: "no available hotel", expires: 1.hour.from_now }
					redirect_to url_for(:controller => 'hotels',:action => 'searchComment')
				end			
			end
	end
#-------------------------------------------------------------
	def roomComment
			@rooms = Room.find_by_sql(["SELECT * FROM rooms where hotel_id = ?",cookies[:hotelid2]])	

	end
#-----------------------------------------------------------------
end

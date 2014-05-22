require 'digest/md5'

class SignupsController < ApplicationController
  # GET /signups
  # GET /signups.json
  def index
    @signups = Signup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @signups }
    end
  end

  # GET /signups/1
  # GET /signups/1.json
  def show
    @signup = Signup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @signup }
    end
  end

  # GET /signups/new
  # GET /signups/new.json
  def new
    @signup = Signup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @signup }
    end
  end

  # GET /signups/1/edit
  def edit
    @signup = Signup.find(params[:id])
  end

  # POST /signups
  # POST /signups.json
  def create
    	hashPassword= Digest::MD5.hexdigest(params[:signup][:password])
		newParams={"name" => params[:signup][:name], "email" => params[:signup][:email], "password" => hashPassword, "phone" => params[:signup][:phone] }
		@signup = Signup.new(newParams)
    respond_to do |format|
      if @signup.save
				@first = "first"
				format.html { render action: "login" }
        #format.html { redirect_to @signup, notice: hashPassword }
        format.json { render json: @signup, status: :created, location: @signup }
      else
        format.html { render action: "new" }
        format.json { render json: @signup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /signups/1
  # PUT /signups/1.json
  def update
   @signup = Signup.find(params[:id])

    respond_to do |format|
      if @signup.update_attributes(params[:signup])
        format.html { redirect_to @signup, notice: 'Signup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @signup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signups/1
  # DELETE /signups/1.json
  def destroy
    @signup = Signup.find(params[:id])
    @signup.destroy

    respond_to do |format|
      format.html { redirect_to signups_url }
      format.json { head :no_content }
    end
  end

	def login
		@email = params[:email]
		@password = params[:password]
		
		
		if @email
				hashPassword= Digest::MD5.hexdigest(params[:password])
				@user = Signup.find_by_sql(["select * from signups where email=? and password=?",params[:email],hashPassword])
				if @user.size > 0
					for user in @user
						cookies[:login] = { value: user.id, expires: 1.hour.from_now }
						#cookies.delete(:login)
						redirect_to url_for(:controller => 'hotels',:action => 'search')
					end
				else
					@notfound="the user u enter not found please try again"
				end
		end
	end
#---------------------------------------------
	def loginBook
		@email = params[:email]
		@password = params[:password]
		
		
		if @email
				hashPassword= Digest::MD5.hexdigest(params[:password])
				@user = Signup.find_by_sql(["select * from signups where email=? and password=?",params[:email],hashPassword])
				if @user.size > 0
					for user in @user
						cookies[:login] = { value: user.id, expires: 1.hour.from_now }
						j=0
						while j < cookies[:count].to_i
						#cookies.delete(:login)
							newParams={"user_id" => cookies[:login] , "hotel_id" => cookies[:hotel_id1], "room_id" => cookies[j], "check_in" => cookies[:checkIn1], "check_out" => cookies[:checkOut1]  }
							@reserve = Reserve.new(newParams)
							@reserve.save
							j+=1
						end
						redirect_to url_for(:controller => 'hotels',:action => 'search')						
					end
					
				else
					@notfound="the user u enter not found please try again"
				end
		end
	end
#--------------------------------------
	def logOut
			cookies.delete(:login)
			redirect_to url_for(:controller => 'hotels',:action => 'search')	
	end
#----------------------------------------
	def loginComment

	@email = params[:email]
	@password = params[:password]
		
	if @email
			hashPassword= Digest::MD5.hexdigest(params[:password])
			@user = Signup.find_by_sql(["select * from signups where email=? and password=?",params[:email],hashPassword])
			if @user.size > 0
				for user in @user
					cookies[:login] = { value: user.id, expires: 1.hour.from_now }
					#cookies.delete(:login)
						newParams={"user_id" => cookies[:login] , "hotel_id" => cookies[:hotel_id1], "room_id" => cookies[:room_id1], "comment" =>cookies[:comment1] }
						@reserve = Comment.new(newParams)
						@reserve.save
					redirect_to url_for(:controller => 'hotels',:action => 'search')						
				end
				
			else
				@notfound="the user u enter not found please try again"
			end
	end

	end
#----------------------------------------
end

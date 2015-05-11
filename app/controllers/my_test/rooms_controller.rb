class MyTest::RoomsController < ApplicationController
  # GET /my_test/rooms
  # GET /my_test/rooms.json
  # layout 'application'
  # include_kindeditor
  skip_before_filter :verify_authenticity_token
  def index
    @my_test_rooms = MyTest::Room.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @my_test_rooms }
    end
  end

  # GET /my_test/rooms/1
  # GET /my_test/rooms/1.json
  def show
    @my_test_room = MyTest::Room.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @my_test_room }
    end
  end

  # GET /my_test/rooms/new
  # GET /my_test/rooms/new.json
  def new
    @my_test_room = MyTest::Room.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @my_test_room }
    end
  end

  # GET /my_test/rooms/1/edit
  def edit
    @my_test_room = MyTest::Room.find(params[:id])
  end

  # POST /my_test/rooms
  # POST /my_test/rooms.json
  def create
    # @my_test_room = MyTest::Room.new(params[:my_test_room])
    #Image.mount_uploader params["image[attachment]"]
    image = Image.new
    image.attachment = params["attachment"]
    puts  params["attachment"].read
    puts "1111111111111111111111111111111111111111111111111111111"
    redirect_to "/my_test/rooms"
    # image.save!
    # respond_to do |format|
    #   if @my_test_room.save
    #     format.html { redirect_to @my_test_room, :notice => 'Room was successfully created.' }
    #     format.json { render :json => @my_test_room, :status => :created, :location => @my_test_room }
    #   else
    #     format.html { render :action => "new" }
    #     format.json { render :json => @my_test_room.errors, :status => :unprocessable_entity }
    #   end
    # end
  end

  # PUT /my_test/rooms/1
  # PUT /my_test/rooms/1.json
  def update
    @my_test_room = MyTest::Room.find(params[:id])

    respond_to do |format|
      if @my_test_room.update_attributes(params[:my_test_room])
        format.html { redirect_to @my_test_room, :notice => 'Room was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @my_test_room.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /my_test/rooms/1
  # DELETE /my_test/rooms/1.json
  def destroy
    @my_test_room = MyTest::Room.find(params[:id])
    @my_test_room.destroy

    respond_to do |format|
      format.html { redirect_to my_test_rooms_url }
      format.json { head :ok }
    end
  end
end

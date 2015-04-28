class HomeController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]
  #skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  # GET /home
  # GET /home.json
  def index
    @homes = Home.all
  end

  def get_json
    name = params[:name]
    mdn = params[:mdn]
    emsi = params[:emsi]
    subscriber = Subscriber.new
    subscriber.add_name(name,mdn,emsi)
    render :text=>"ok"
  end

  def add_geo
    mdn = params[:mdn]
    lat = params[:lat]
    lng = params[:lng]
    time = Time.now
    sub = Subscriber.where(:mdn=>mdn)[0]
    postion = sub.postions.new
    postion.geo = {lat:lat,lng:lng}
    postion.time = time
    postion.save
    render :text=>"ok"
  end

  # GET /home/1
  # GET /home/1.json
  def show
  end

  # GET /home/new
  def new
    @home = Home.new
  end

  # GET /home/1/edit
  def edit
  end

  # POST /home
  # POST /home.json
  def create
    @home = Home.new(home_params)

    respond_to do |format|
      if @home.save
        format.html { redirect_to @home, notice: 'Home was successfully created.' }
        format.json { render :show, status: :created, location: @home }
      else
        format.html { render :new }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /home/1
  # PATCH/PUT /home/1.json
  def update
    respond_to do |format|
      if @home.update(home_params)
        format.html { redirect_to @home, notice: 'Home was successfully updated.' }
        format.json { render :show, status: :ok, location: @home }
      else
        format.html { render :edit }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /home/1
  # DELETE /home/1.json
  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to homes_url, notice: 'Home was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
      @home = Home.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_params
      params[:home]
    end
end

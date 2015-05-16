class Admin::HomeController < ApplicationController
  layout "back/admin"
  before_action :set_admin_home, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  # GET /admin/products
  # GET /admin/products.json
  def index

  end

  def single_person
    if request.post?
      puts "11111111222222222222222222222222222"
      redirect_to "/home"
    end
   puts "11111111111111111111111111111111111"

  end


  def add_geo
    mdn = params[:mdn]
    lat = params[:lat]
    lng = params[:lng]
    elec = params[:elec]
    time = Time.now
    customer = Customer.where(:mdn=>mdn)[0]
    postion = customer.postions.new
    postion.geo = {lat:lat,lng:lng}
    postion.elec = elec
    postion.time = time
    postion.save
    render :text=>"ok"
  end


  # GET /admin/products/1
  # GET /admin/products/1.json
  def show
  end

  # GET /admin/products/new
  def new
    @admin_home = Admin::Home.new
  end

  # GET /admin/products/1/edit
  def edit
  end

  # POST /admin/products
  # POST /admin/products.json
  def create
    # @admin_home = Admin::Home.new(admin_home_params)
    #
    # respond_to do |format|
    #   if @admin_home.save
    #     format.html { redirect_to @admin_home, notice: 'Home was successfully created.' }
    #     format.json { render :show, status: :created, location: @admin_home }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @admin_home.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /admin/products/1
  # PATCH/PUT /admin/products/1.json
  def update
    respond_to do |format|
      if @admin_home.update(admin_home_params)
        format.html { redirect_to @admin_home, notice: 'Home was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_home }
      else
        format.html { render :edit }
        format.json { render json: @admin_home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/products/1
  # DELETE /admin/products/1.json
  def destroy
    @admin_home.destroy
    respond_to do |format|
      format.html { redirect_to admin_homes_url, notice: 'Home was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_home
      @admin_home = Admin::Home.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_home_params
      params[:admin_home]
    end
end

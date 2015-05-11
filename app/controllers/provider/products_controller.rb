class Provider::ProductsController < ApplicationController
  layout "back/admin"
  before_action :set_admin_home, only: [:show, :edit, :update, :destroy]

  # GET /admin/products
  # GET /admin/products.json
  def index

  end

  # GET /admin/products/1
  # GET /admin/products/1.json
  def show
  end

  # GET /admin/products/new
  def new
    # @provider_product = Provider::Product.new
  end

  # GET /admin/products/1/edit
  def edit
  end

  # POST /admin/products
  # POST /admin/products.json
  def create
    name = params[:name]
    file = params[:img]

    f1 = file.read if file != nil
    f1.split("\r\n").each{|line|
      if line.split(",").size == 4
        arr = line.split(",")
        subscriber = Subscriber.new
        subscriber.add_name(arr[0],arr[1],arr[2],arr[3])
      end
    }
    name.split("\r\n").each{|line|
      if line.split(",").size == 4
        arr = line.split(",")
        subscriber = Subscriber.new
        subscriber.add_name(arr[0],arr[1],arr[2],arr[3])
      end
    }

   redirect_to "/admin/home"
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

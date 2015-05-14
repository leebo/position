class Admin::CustomersController < Admin::BaseController
  layout "back/admin"
  #layout "application"
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /admin/customers
  # GET /admin/customers.json


  def index
    @customers = Customer.all
  end

  #地图方式列出人员的位置
  def index_map
    #render layout: "back/map"
    #@positions = Position.all
  end

  # GET /admin/customers/1
  # GET /admin/customers/1.json
  def show
  end

  # GET /admin/customers/new
  #新增单个用户
  def new
    @customer = Customer.new
  end

  #批量导入用户
  def new_bulk
    #@customers = Customer.new
  end

  # 单个用户修改
  def edit
  end

  # POST /admin/customers
  # POST /admin/customers.json
  #单个用户创建
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  #批量导入用户，与bulk_new配对使用
  def create_bulk

    Customer.import params[:file]

    # f1 = file.read if file != nil
    # f1.split("\r\n").each{|line|
    #   if line.split(",").size == 4
    #     arr = line.split(",")
    #     customer = Customer.new
    #     customer.add_name(arr[0],arr[1],arr[2],arr[3])
    #   end
    # }
    # name.split("\r\n").each{|line|
    #   if line.split(",").size == 4
    #     arr = line.split(",")
    #     customer = Customer.new
    #     customer.add_name(arr[0],arr[1],arr[2],arr[3])
    #   end
    # }

    redirect_to "/admin/home"
  end

  # PATCH/PUT /admin/customers/1
  # PATCH/PUT /admin/customers/1.json
  #单个用户的更新
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/customers/1
  # DELETE /admin/customers/1.json
  #删除用户
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_params
    params.require(:customer).permit(:name, :mdn, :emsi, :imei)
  end
end

class Admin::SubscribersController < ApplicationController
  layout "back/admin"
  before_action :set_subscriber, only: [:show, :edit, :update, :destroy]

  # GET /admin/subscribers
  # GET /admin/subscribers.json


  def index
    @subscribers = Admin::Subscriber.all
  end

  #地图方式列出人员的位置
  def index_map
    @subscribers = Admin::Subscriber.all
  end

  # GET /admin/subscribers/1
  # GET /admin/subscribers/1.json
  def show
  end

  # GET /admin/subscribers/new
  #新增单个用户
  def new
    @subscriber = Admin::Subscriber.new
  end

  #批量导入用户
  def new_bulk
    #@subscribers = Admin::Subscriber.new
  end

  # 单个用户修改
  def edit
  end

  # POST /admin/subscribers
  # POST /admin/subscribers.json
  #单个用户创建
  def create
    @subscriber = Admin::Subscriber.new(subscriber_params)

    respond_to do |format|
      if @subscriber.save
        format.html { redirect_to @subscriber, notice: 'Subscriber was successfully created.' }
        format.json { render :show, status: :created, location: @subscriber }
      else
        format.html { render :new }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  #批量导入用户，与bulk_new配对使用
  def create_bulk

    Subscriber.import params[:file]

    # f1 = file.read if file != nil
    # f1.split("\r\n").each{|line|
    #   if line.split(",").size == 4
    #     arr = line.split(",")
    #     subscriber = Subscriber.new
    #     subscriber.add_name(arr[0],arr[1],arr[2],arr[3])
    #   end
    # }
    # name.split("\r\n").each{|line|
    #   if line.split(",").size == 4
    #     arr = line.split(",")
    #     subscriber = Subscriber.new
    #     subscriber.add_name(arr[0],arr[1],arr[2],arr[3])
    #   end
    # }

    redirect_to "/admin/home"
  end

  # PATCH/PUT /admin/subscribers/1
  # PATCH/PUT /admin/subscribers/1.json
  #单个用户的更新
  def update
    respond_to do |format|
      if @subscriber.update(subscriber_params)
        format.html { redirect_to @subscriber, notice: 'Subscriber was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscriber }
      else
        format.html { render :edit }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/subscribers/1
  # DELETE /admin/subscribers/1.json
  #删除用户
  def destroy
    @subscriber.destroy
    respond_to do |format|
      format.html { redirect_to subscribers_url, notice: 'Subscriber was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_subscriber
    @subscriber = Admin::Subscriber.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def subscriber_params
    params.require(:subscriber).permit(:name, :mdn, :emsi, :imei)
  end
end

class Admin::SubscribersController < ApplicationController
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
  def bulk_new

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
  def bulk_create
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

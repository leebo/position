class Admin::MonitorController < ApplicationController
  before_action :set_admin_subscriber, only: [:show, :edit, :update, :destroy]

  # GET /admin/subscribers
  # GET /admin/subscribers.json
  def index
    @admin_subscribers = Admin::Subscriber.all
  end
  def index_map
    @admin_subscribers = Admin::Subscriber.all
  end
  # GET /admin/subscribers/1
  # GET /admin/subscribers/1.json
  def show
  end

  # GET /admin/subscribers/new
  def new
    @admin_subscriber = Admin::Subscriber.new
  end
#批量导入
  def bulk_new

  end

  # GET /admin/subscribers/1/edit
  def edit
  end

  # POST /admin/subscribers
  # POST /admin/subscribers.json
  def create
    @admin_subscriber = Admin::Subscriber.new(admin_subscriber_params)

    respond_to do |format|
      if @admin_subscriber.save
        format.html { redirect_to @admin_subscriber, notice: 'Subscriber was successfully created.' }
        format.json { render :show, status: :created, location: @admin_subscriber }
      else
        format.html { render :new }
        format.json { render json: @admin_subscriber.errors, status: :unprocessable_entity }
      end
    end
  end
  #批量导入
  def bulk_create
    @admin_subscriber = Admin::Subscriber.new(admin_subscriber_params)

    respond_to do |format|
      if @admin_subscriber.save
        format.html { redirect_to @admin_subscriber, notice: 'Subscriber was successfully created.' }
        format.json { render :show, status: :created, location: @admin_subscriber }
      else
        format.html { render :new }
        format.json { render json: @admin_subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/subscribers/1
  # PATCH/PUT /admin/subscribers/1.json
  def update
    respond_to do |format|
      if @admin_subscriber.update(admin_subscriber_params)
        format.html { redirect_to @admin_subscriber, notice: 'Subscriber was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_subscriber }
      else
        format.html { render :edit }
        format.json { render json: @admin_subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/subscribers/1
  # DELETE /admin/subscribers/1.json
  def destroy
    @admin_subscriber.destroy
    respond_to do |format|
      format.html { redirect_to admin_subscribers_url, notice: 'Subscriber was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_subscriber
      @admin_subscriber = Admin::Subscriber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_subscriber_params
      params.require(:admin_subscriber).permit(:name, :mdn, :emsi, :imei)
    end
end

class Admin::MonitorController < Admin::BaseController
  before_action :set_admin_subscriber, only: [:show, :edit, :update, :destroy]

  # GET /admin/subscribers
  # GET /admin/subscribers.json

  #动态显示当前时间点的customers的位置图
  def customers
    #render layout: "back/map"
  end
  #显示当前时间点的告警
  def events
    @positions = Position.where(:time=>{"$gt"=>"#{15.seconds.ago}"})
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

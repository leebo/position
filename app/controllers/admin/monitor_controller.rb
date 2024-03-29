class Admin::MonitorController < Admin::BaseController
  before_action :set_admin_subscriber, only: [:show, :edit, :update, :destroy]

  # GET /admin/subscribers
  # GET /admin/subscribers.json

  #动态显示当前时间点的customers的位置图
  def customers
    customer = Customer.where(:mdn => params[:mdn])[0]
    @single_customer_position = []
    positions = customer.positions.all
    positions.each { |position|
      @single_customer_position << [position.lat, position.lng]
    }
  end

  #显示当前时间点的告警
  def positions
    @positions = Position.where(:time => {"$gt" => "#{150.seconds.ago}"})
    target = Target.first.point.values
    sysconf = SysConf.first.value
    sysconf = '3000'
    @arrs = []
    @positions.each { |position|
      @arrs << [position.lat, position.lng] if (SysConf.distance(target, [position.lat, position.lng]).to_i < sysconf.to_i)
      break if @arrs.size > 100
    }

    render json: @arrs
  end

  #
  def events

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

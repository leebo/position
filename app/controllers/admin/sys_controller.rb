class Admin::SysController < Admin::BaseController
  before_action :set_admin_subscriber, only: [:show, :edit, :update, :destroy]

  # GET /admin/subscribers
  # GET /admin/subscribers.json
  #配置关键位置：点+半径
  def config_location
    @sysconfes = SysConf.new
    @sys_confes = SysConf.all
  end
  #存取配置关键位置：点+半径
  def save_config_location
    target = Target.new
    target.name = params[:name]
    target.point = {"lat"=>params[:lat],"lng"=>params[:lng]}
    target.save
    redirect_to  '/admin/sys/config_location'
  end
  def complete_config_location

  end

  #配置报警距离
  def config_distance

  end
  def complete_config_distance
     params[:file].read.split("\r\n").each{|line|
         sysconf = SysConf.new
         sysconf.name = line.split(",")[0]
         sysconf.value = line.split(",")[1]
         sysconf.save
         }
    redirect_to "/admin/home"
  end
  def config_measure

  end
  def complete_config_measure

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

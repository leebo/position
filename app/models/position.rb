class Position
  include Mongoid::Document
  include Mongoid::Timestamps
  field :emsi,type: String #卡物理号，可以找到对应的customer
  field :lat,type: Float #纬度
  field :lng,type: Float #经度
  field :power,type: Float #手机电量
  field :time,type:DateTime #上传时间，终端上传的时间。
  belongs_to :customer


  def sum_data(time)
    arr = []
    Customer.all.each{|cus|
      sub_postions = cus.postions.where("time"=>{"$lt"=>"#{time}"})
      sub_postions.each{|postion|
        arr << postion.geo
      }
      past_postion = cus.past_postions.new
      past_postion.day = time
      past_postion.geos = arr
      past_postion.save
      sub_postions.delete
    }
  end


end

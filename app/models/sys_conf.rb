class SysConf
  include Mongoid::Document

  field :name,type: String
  field :value,type: String


     #计算距离，用于告警
  class << self
  def distance(arr1,arr2)
    lat1 = arr1[0].to_f
    lng1 = arr1[1].to_f
    lat2 = arr2[0].to_f
    lng2 = arr2[1].to_f
    include Math
    lat_diff = (lat1 - lat2)*PI/180.0
    lng_diff = (lng1 - lng2)*PI/180.0
    lat_sin = Math.sin(lat_diff/2.0) ** 2
    lng_sin = Math.sin(lng_diff/2.0) ** 2
    first = Math.sqrt(lat_sin + Math.cos(lat1*PI/180.0) * Math.cos(lat2*PI/180.0) * lng_sin)
    result = Math.asin(first) * 2 * 6378137.0
      return result
  end
    end


end

class PastPosition
  include Mongoid::Document
  field :day,type: Date
  field :geos,type: Array #[[lat1,lng1,time1],[lat2,lng2,time2],...],子元素仍然是array。
  belongs_to :customer
end

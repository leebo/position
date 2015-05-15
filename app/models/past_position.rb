class PastPosition
  include Mongoid::Document
  field :day,type: Date
  field :geos,type: Array #[{lat:lat,lng:lng,time:time}]
  belongs_to :customer
end

class PastPostion
  include Mongoid::Document
  field :day,type: Date
  field :geos,type: Array #[{lat:lat,lng:lng}]
  belongs_to :user
end

class Position
  include Mongoid::Document
  include Mongoid::Timestamps
  field :geo,type: Hash #{lat:lat,lng:lng}
  field :time,type:DateTime
  belongs_to :subscriber


end

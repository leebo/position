class Target
  include Mongoid::Document
  field :name,type: String
  field :point,type: Hash
  field :polygon,type: Array #[{lat:lat,lng:lng}]
  belongs_to :event_type
end

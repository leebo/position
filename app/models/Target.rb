class Target
  include Mongoid::Document
  field :name,type: String
  field :point,type: Hash
  field :radius,type: Float
  belongs_to :event_type
end

class Measure
  include Mongoid::Document
  field :desc,type: String
  belongs_to :event_type
end

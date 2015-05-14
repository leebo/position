class Plan
  include Mongoid::Document
  field :desc,type: String
  belongs_to :incident_type
end

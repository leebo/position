class Incident
  include Mongoid::Document
  field :customer_ids,type: Array
  field :occurrence_time,type: DateTime
  belongs_to :incident_type
end

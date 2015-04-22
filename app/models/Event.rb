class Event
  include Mongoid::Document
  field :user_ids,type: Array
  field :occurrence_time,type: DateTime
  belongs_to :event_type
end

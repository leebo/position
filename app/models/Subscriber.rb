class Subscriber
  include Mongoid::Document
  field :name,type: String
  field :mdn,type: String
  field :emsi,type:String

end

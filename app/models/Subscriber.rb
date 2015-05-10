class Subscriber
  include Mongoid::Document
  field :name,type: String
  field :mdn,type: String
  field :emsi,type:String
  field :imei,type:String

  has_many :postions

  def add_name(name,mdn,emsi,imei)
    subscriber = Subscriber.new
    subscriber.name = name
    subscriber.mdn = mdn
    subscriber.emsi = emsi
    subscriber.imei = imei
    subscriber.save
  end
end

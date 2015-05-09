class Subscriber
  include Mongoid::Document
  field :name,type: String
  field :mdn,type: String
  field :emsi,type:String

  has_many :postions

  def add_name(name,mdn,emsi)
    subscriber = Subscriber.new
    subscriber.name = name
    subscriber.mdn = mdn
    subscriber.emsi = emsi
    subscriber.save
  end
end

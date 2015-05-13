require 'csv'
class Customer
  include Mongoid::Document
  field :name,type: String
  field :mdn,type: String
  field :emsi,type:String
  field :imei,type:String

  has_many :positions

  class << self
    def import file
      CSV.foreach(file.path,headers:true) do |row|
        create! row.to_hash
      end
    end
  end

  def add_name(name,mdn,emsi,imei)
    subscriber = Subscriber.new
    subscriber.name = name
    subscriber.mdn = mdn
    subscriber.emsi = emsi
    subscriber.imei = imei
    subscriber.save
  end


end

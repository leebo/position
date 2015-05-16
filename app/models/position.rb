class Position
  include Mongoid::Document
  include Mongoid::Timestamps
  field :geo,type: Hash #{lat:lat,lng:lng}
  field :elec,type: Float
  field :time,type:DateTime
  belongs_to :customer


  def sum_data(time)
    arr = []
    Subscriber.all.each{|sub|
      sub_postions = sub.postions.where("time"=>{"$lt"=>"#{time}"})
      sub_postions.each{|postion|
        arr << postion.geo
      }
      past_postion = sub.past_postions.new
      past_postion.day = time
      past_postion.geos = arr
      past_postion.save
      sub_postions.delete
    }
  end


end

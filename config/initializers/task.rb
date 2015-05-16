require "rubygems"
require "rufus/scheduler"

scheduler = Rufus::Scheduler.new

scheduler.cron '0 1 * * *' do
   # every day of the week at 1:00
  time = DateTime.parse(Time.new().strftime('%a %b %d +0800 %Y'))
  Position.sum_data(time)
end



# scheduler.every '5s' do
#    puts 'check blood pressure'
# end


require "rest-client"
Thread.new{
while 1
customers = Customer.all
customers.each{|customer|
RestClient.post 'http://localhost:3000/admin/home/add_geo',{params: {lat: rand(89.000..89.999),mdn: customer.mdn,lng: rand(42.000..42.999)}}
}
end
}
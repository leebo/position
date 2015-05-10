require "rubygems"
require "rufus/scheduler"

scheduler = Rufus::Scheduler.new

scheduler.cron '0 1 * * *' do
   # every day of the week at 1:00
  time = DateTime.parse(Time.new().strftime('%a %b %d +0800 %Y'))
  Postion.sum_data(time)
end



# scheduler.every '5s' do
#    puts 'check blood pressure'
# end
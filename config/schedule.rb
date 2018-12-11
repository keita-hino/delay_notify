# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

require File.expand_path(File.dirname(__FILE__) + "/environment")

set :output, 'log/cron.log'

# 毎週月曜日 AM 4:30 と PM 6:00 に rake タスクを実行する
every 1.day, at: ['8:00 am'],:roles => [:hinokeita] do
  rake "delay_notify:notify"
end

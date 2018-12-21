namespace :delay_notify do
  desc "しきい値を超えていれば通知する"
  task :notify => :environment do
    noti = Notifycation.new
    noti.line_notify('ishinomaki')
    noti.slack_notify('ishinomaki')
  end
end

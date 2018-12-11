namespace :delay_notify do
  desc "しきい値を超えていれば通知する"
  task :notify => :environment do
    a = GmailController.new
    a.notify
  end
end

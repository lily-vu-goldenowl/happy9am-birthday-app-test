namespace :sidekiq do
  desc "Run BirthdaySchedulerJob immediately"
  task schedule_birthdays: :environment do
    BirthdaySchedulerJob.perform_async
    puts "✅ BirthdaySchedulerJob enqueued!"
  end

  desc "Run RecoverMissedMessagesJob immediately"
  task recover_missed: :environment do
    RecoverMissedMessagesJob.perform_async
    puts "✅ RecoverMissedMessagesJob enqueued!"
  end

  desc "Run BirthdayMessageJob for all users with birthdays today"
  task send_birthday_messages: :environment do
    User.where("strftime('%m-%d', birthday) = ?", Date.today.strftime('%m-%d')).find_each do |user|
      BirthdayMessageJob.perform_async(user.id)
      puts "🎉 Sent birthday message to #{user.full_name}"
    end
  end
end

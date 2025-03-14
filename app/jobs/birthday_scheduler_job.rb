class BirthdaySchedulerJob
  include Sidekiq::Job
  sidekiq_options queue: :scheduler

  # Runs daily at midnight to schedule messages for all users
  def perform
    User.find_each { |user| BirthdayMessageService.schedule(user) }
  end
end

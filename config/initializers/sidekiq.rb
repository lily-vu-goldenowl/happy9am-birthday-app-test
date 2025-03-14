require 'sidekiq-scheduler'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch('REDIS_URL') }
  config.on(:startup) do
    Sidekiq.schedule = {
      # 'health_check_job' => {
      #   'every' => ['5s'],
      #   'class' => 'HealthCheckJob'
      # },
      'birthday_scheduler' => {
        'cron' => '0 0 * * *', # Runs at 12 AM UTC daily
        'class' => 'BirthdaySchedulerJob'
      },
      'recover_missed_birthday_messages' => {
        'cron' => '0 * * * *', # Run every hour
        'class' => 'RecoverMissedMessagesJob'
      }
    }
    SidekiqScheduler::Scheduler.instance.reload_schedule!
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch('REDIS_URL') }
end
class RecoverMissedMessagesJob
  include Sidekiq::Job
  sidekiq_options queue: :recovery

  def perform
    User.find_each do |user|
      next unless birthday_today?(user)

      last_sent = last_message_sent_time(user)
      next if last_sent&.to_date == today_in_timezone(user)

      schedule_or_send_message(user)
    end
  end

  private

  def birthday_today?(user)
    today = today_in_timezone(user)
    today.month == user.birthday.month && today.day == user.birthday.day
  end

  def last_message_sent_time(user)
    MessageLog.where(user_id: user.id, message_type: 'birthday', status: 'sent')
              .pluck(:sent_at).first&.in_time_zone(user.timezone)
  end

  def today_in_timezone(user)
    Time.now.in_time_zone(user.timezone).to_date
  end

  def schedule_or_send_message(user)
    current_time = Time.now.in_time_zone(user.timezone)

    if current_time.hour >= 9
      BirthdayMessageJob.perform_async(user.id)
    else
      send_time = Time.new(current_time.year, current_time.month, current_time.day, 9, 0, 0, ActiveSupport::TimeZone[user.timezone].formatted_offset)
      BirthdayMessageJob.perform_at(send_time, user.id)
    end
  end
end

class BirthdayMessageJob
  include Sidekiq::Worker
  sidekiq_options queue: :birthday_messages, retry: 3

  def perform(user_id)
    user = User.find_by(id: user_id)
    return unless user
    return if message_already_sent_today?(user)

    send_birthday_message(user)
    schedule_next_year_message(user)
  end

  private

  def message_already_sent_today?(user)
    last_sent = last_message_sent_time(user)
    last_sent&.to_date == user.next_birthday.to_date
  end

  def last_message_sent_time(user)
    MessageLog.where(user_id: user.id, message_type: 'birthday', status: 'sent')
              .pluck(:sent_at).first&.in_time_zone(user.timezone)
  end

  def send_birthday_message(user)
    BirthdayMessageService.send_message(user)
  end

  def schedule_next_year_message(user)
    BirthdayMessageService.schedule(user)
  end
end

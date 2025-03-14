require 'sidekiq/api'
class BirthdayMessageService
  def self.send_message(user)
    response = HTTParty.post(ENV.fetch("HOOKBIN_URL"), body: { message: "Hey, #{user.full_name} it’s your birthday" }.to_json)

    if response.success?
      MessageLog.create!(user_id: user.id, message_type: 'birthday', status: 'sent', sent_at: Time.current)
      true
    else
      MessageLog.create!(user_id: user.id, message_type: 'birthday', status: 'failed', error_message: response.body)
      false
    end
  end

  def self.schedule(user)
    BirthdayMessageJob.perform_at(user.next_birthday, user.id)
  end

  def self.reschedule(user)
    cancel(user)
    schedule(user)
  end

  # Cancel any existing scheduled messages for a user
  def self.cancel(user)
    Sidekiq::ScheduledSet.new.each do |job|
      job.delete if job.klass == "BirthdayMessageJob" && job.args[0] == user.id
    end
  end
end

class User < ApplicationRecord
  validates :first_name, :last_name, :birthday, :timezone, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  # Calculates the next birthday occurrence at 9 AM in the user's timezone
  def next_birthday
    today = Time.now.in_time_zone(timezone).to_date
    birthday_this_year = Date.new(today.year, birthday.month, birthday.day)

    # If birthday has passed, schedule for next year
    if birthday_this_year < today
      birthday_this_year = Date.new(today.year + 1, birthday.month, birthday.day)
    end

    # Set to 9 AM on the next birthday
    Time.new(birthday_this_year.year, birthday_this_year.month, birthday_this_year.day, 9, 0, 0, ActiveSupport::TimeZone[timezone].formatted_offset)
  end
end

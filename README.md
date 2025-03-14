# Happy9AM Birthday Wisher
A Ruby on Rails application that automatically sends delightful birthday messages to users at 9:00 AM in their local timezone. With reliable scheduling, missed message recovery, and user-friendly APIs, Happy9AM ensures no birthday goes uncelebrated!


A Rails application that automatically sends birthday messages to users at 9 AM in their local timezone. The system ensures reliability by handling timezone differences and includes recovery mechanisms for service interruptions.
### 🚀 Execution Flow Summary

**`BirthdaySchedulerJob`** (Runs at **12 AM UTC**)  
➡ Schedules `BirthdayMessageJob` for each user at **9 AM local time**

**`BirthdayMessageJob`** (Runs exactly at **9 AM local time**)  
➡ Sends the birthday message

**`RecoverMissedMessagesJob`** (Runs **hourly**)  
➡ Checks & resends missed birthday messages (if any)

### Flow chart
[![](https://mermaid.ink/img/pako:eNqlVMt22jAQ_ZU53nRDEggPA6dNDzEhkISEQLJoDQthD9iNLaWSnMYF_r2yZBvaJKtqAZ7R3DuaOyNtLI_5aHWtNSfPATz05xTU6rkzSbhcwNHR2bZ22q1WoTeGxwdnC-fuechl4JN05gXoJxHyK7ZcGNy5BgwYByReAIlAvgXHLSKhgI5RCLJGBYTPS34GREInTxIxj0QgwxhzTifjhL47C318Cn_CfYJJtmd2-zpj7z38Fi7ctwlz1gvNOtg4AXpPEK4gNhH5eSKOxE9BIJUgmSL4ujO4gc73DcUWLt0L6i8O3bdsC0N3htQv6V5CAkPGnpYhzUOHOvNoL8pfmVdKO4qvElIkPEeMNOKyKPnKHbKERyk4nFHdIrh2p-ixF-TjUAj082rFvtzr9xpzsxkJU512fBKwzOXKVTiogzKp1Sh0uCkLHh_IcLNX53bjJJxr_VQvDOHZl3faVDDe7rF3RsOPpiWMY_RDIjFKF4fY7DST_xu2OzNsxpgUhjFFsjS3pDcZwaMSDMaEKuJYFWkisnXvZlvCYVRyFqnbYS6RowZK4snjs6_-tjAtj3kyRVGc-EfZL82kgX2MMEPMXIdQDyMoov1_wqeHR8_W7NCh9HxTRz4zKYzRCwgNRbwH64Ex_TTqwt1-0zgmHzPnkkPWxpCuYRCxX3t4fvf0b34bPqbKdXrLot-a4nUo8VbFipHHJPTVo7bJ3HNLBqpHc6urPn1ckSSSc2tOdyqUJJLNUupZ3RWJBFYszpJ1UFqJ7lY_JOoocel9JvQ7Y8qWPDGm1d1Yr1b3yG4dNxunjXanWbXtdrVpV6xUuevt6nHHrrU67XqrVm21O7uK9Vsz1I7rTbvRajRsu3XaqTcb9u4PO8q1Mw?type=png)](https://mermaid.live/edit#pako:eNqlVMt22jAQ_ZU53nRDEggPA6dNDzEhkISEQLJoDQthD9iNLaWSnMYF_r2yZBvaJKtqAZ7R3DuaOyNtLI_5aHWtNSfPATz05xTU6rkzSbhcwNHR2bZ22q1WoTeGxwdnC-fuechl4JN05gXoJxHyK7ZcGNy5BgwYByReAIlAvgXHLSKhgI5RCLJGBYTPS34GREInTxIxj0QgwxhzTifjhL47C318Cn_CfYJJtmd2-zpj7z38Fi7ctwlz1gvNOtg4AXpPEK4gNhH5eSKOxE9BIJUgmSL4ujO4gc73DcUWLt0L6i8O3bdsC0N3htQv6V5CAkPGnpYhzUOHOvNoL8pfmVdKO4qvElIkPEeMNOKyKPnKHbKERyk4nFHdIrh2p-ixF-TjUAj082rFvtzr9xpzsxkJU512fBKwzOXKVTiogzKp1Sh0uCkLHh_IcLNX53bjJJxr_VQvDOHZl3faVDDe7rF3RsOPpiWMY_RDIjFKF4fY7DST_xu2OzNsxpgUhjFFsjS3pDcZwaMSDMaEKuJYFWkisnXvZlvCYVRyFqnbYS6RowZK4snjs6_-tjAtj3kyRVGc-EfZL82kgX2MMEPMXIdQDyMoov1_wqeHR8_W7NCh9HxTRz4zKYzRCwgNRbwH64Ex_TTqwt1-0zgmHzPnkkPWxpCuYRCxX3t4fvf0b34bPqbKdXrLot-a4nUo8VbFipHHJPTVo7bJ3HNLBqpHc6urPn1ckSSSc2tOdyqUJJLNUupZ3RWJBFYszpJ1UFqJ7lY_JOoocel9JvQ7Y8qWPDGm1d1Yr1b3yG4dNxunjXanWbXtdrVpV6xUuevt6nHHrrU67XqrVm21O7uK9Vsz1I7rTbvRajRsu3XaqTcb9u4PO8q1Mw)

## Done

- [x] User management API (create, update, delete)
- [x] Scheduled birthday messages at 9 AM in user's local timezone
- [x] Message delivery via Hookbin endpoint
- [x] Timezone-aware scheduling
- [x] Recovery system for missed messages during downtime
- [x] Prevention of duplicate messages through logging
- [x] Scalable job processing with Sidekiq
## Future Improvements
- [ ] Comprehensive test coverage
- [ ] Add support for different types of messages (anniversary, promotion notifications)
- [ ] Implement message templates and customization options
- [ ] Add metrics and monitoring for message delivery rates
- [ ] Add pagination and filtering to the API endpoints
- [ ] Implement rate limiting to prevent API abuse
- [ ] Implement user preferences for delivery times and opt-out options
- [ ] Add internationalization support for messages in multiple languages

## Setup Instructions

### Prerequisites

- Ruby 3.2.2
- Rails 7.0.8
- PostgreSQL
- Redis (for Sidekiq)

### Installation

1. Clone the repository:
   ```bash
   https://github.com/lily-vu-goldenowl/happy9am-birthday-app-test.git
   cd happy9am-birthday-app-test.git
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Database setup:
   ```bash
   rails db:create db:migrate db:seed
   ```

4. Environment configuration:
   ```bash
   # Create a .env file or set in your environment
   # cp sample.env .env
   HOOKBIN_URL=your_hookbin_endpoint_url
   REDIS_URL=redis://localhost:6379/0
   ```

5. Start the services:
   ```bash
   # Start Rails server
   rails server

   # In a separate terminal, start Sidekiq
   bundle exec sidekiq -c 5
   ```
## Run Tests Immediately Without Waiting for Cron Jobs

To run tasks related to sending birthday messages immediately without waiting for the cron job, you can use the following Rake commands:

### 1. Schedule Birthdays
This command will schedule birthday messages for users without waiting for the cron job.

```bash
rake sidekiq:schedule_birthdays
```
sample output:
```log
2025-03-14T07:23:48.394Z pid=80273 tid=1qtd INFO: Sidekiq 7.3.9 connecting to Redis with options {size: 10, pool_name: "internal", url: "redis://localhost:6379/0"}
✅ BirthdaySchedulerJob enqueued!
```
### 2. Send Birthday Messages
```log
rake sidekiq:send_birthday_messages
```

sample output:
```
🎉 Sent birthday message to Johnny Price
🎉 Sent birthday message to Loyce Satterfield
🎉 Sent birthday message to Jannette Gutmann
🎉 Sent birthday message to Tammy Ullrich
🎉 Sent birthday message to Lettie Volkman
```



## API Documentation

### Create User
```shell
curl --location 'http://localhost:3000/users' \
--header 'Content-Type: application/json' \
--data '{
           "user": {
             "first_name": "John",
             "last_name": "Doe",
             "birthday": "1990-03-14",
             "timezone": "America/New_York"
           }
         }'
```

### Update User
```shell
curl --location --request PUT 'http://localhost:3000/users/51' \
--header 'Content-Type: application/json' \
--data '{
           "user": {
             "first_name": "Johnny",
             "timezone": "America/Chicago"
           }
         }'
```

### Delete User
```shell
curl -X DELETE "http://your-api.com/users/123" -H "Content-Type: application/json"
```



### Running Tests

```bash
# Run all tests
bundle exec rspec

# Run specific tests
bundle exec rspec spec/models
bundle exec rspec spec/controllers
bundle exec rspec spec/jobs
```
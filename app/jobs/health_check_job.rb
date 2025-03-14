class HealthCheckJob
  include Sidekiq::Job

  def perform
    Rails.logger.info "Health check at #{Time.current}"
  end
end

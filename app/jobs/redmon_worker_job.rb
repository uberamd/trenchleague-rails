class RedmonWorkerJob < ApplicationJob

  queue_as :default

  def perform
    worker = Redmon::Worker.new
    worker.record_stats
    worker.cleanup_old_stats

    self.class.set(wait: Redmon.config.pool_interval.seconds).perform_later
  end
end

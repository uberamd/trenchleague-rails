# this will run the MMR refresh on startup then keep it in queue (see job)
if ENV['RAILS_ENV'] == 'production'
  RefreshAllMmrJob.perform_later # enqueue the refresh job
end

# this will run the MMR refresh on startup then keep it in queue (see job)
if ENV['RAILS_ENV'] == 'production'
  RefreshAllMmrJob.perform_later # enqueue the refresh job
end

unless ( File.basename($0) == 'rake')
  # this ensures that we dont run these tasks when doing rake
  OpendotaAllHeroesRefreshJob.perform_later
end

# this will run the MMR refresh on startup then keep it in queue (see job)
if ENV['RAILS_ENV'] == 'production'
  RefreshAllMmrJob.perform_later # enqueue the refresh job
  unless ( File.basename($0) == 'rake')
    # this ensures that we dont run these tasks when doing rake
    # specifically this job will import all known heroes, wait 5 minutes after app start to give time for db
    # migrations to run
    OpendotaAllHeroesRefreshJob.set(wait: 5.minutes).perform_later
    # once this task is done refresh the hero mappings for each player
    RefreshAllHeroesJob.set(wait: 10.minutes).perform_later
    # next we will refresh "totals", KDA etc.
    RefreshAllTotalsJob.set(wait: 20.minutes).perform_later
    # next we will update win/losses for each role
    RefreshAllRoleWinLossJob.set(wait: 30.minutes).perform_later
  end
end

if ENV['RAILS_ENV'] == 'staging'
  unless ( File.basename($0) == 'rake')
    RedmonWorkerJob.perform_later
  end
end


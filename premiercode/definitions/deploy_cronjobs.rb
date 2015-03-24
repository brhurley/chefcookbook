define :deploy_cronjobs do
  cronjobs = params[:cronjobs]
  usr = params[:user]
  
  cronjobs.each do |name,details|
    cron_action=:create
	if details['action'] && details['action'].eql?('delete')
	  cron_action=:delete
	end
    times=details['time']
	cmd=details['command']
    cron "#{name}" do
      user usr
      minute "#{times[0]}"
      hour "#{times[1]}"
	  weekday "#{times[2]}"
      command "#{cmd}"
	  action cron_action
    end
  end 
end
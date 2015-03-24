define :deploy_files do
  files = params[:files]
  usr = params[:user]
  app_dir = params[:app_dir]
  
  files.each do |source,target|
    
    targetdir=target
    if target.rindex("\/")
  	  targetdir = target.slice(0, target.rindex("\/"))
  	end

  	if !targetdir.empty?
        directory "#{targetdir}" do
          owner usr
          group usr
  	    recursive true
        end
  	end

    execute "copy-#{source}" do
      user usr
      group usr
      command "cp -r #{app_dir}/#{source} #{targetdir}/."
    end

  end
end
define :deploy_templates do
  templates = params[:templates]
  usr = params[:user]
  
	
  templates.each do |template_name,file_name|
	targetdir = file_name.slice(0, file_name.rindex("\/"))

	if !targetdir.empty?
      directory "#{targetdir}" do
        owner usr
        group usr
	    recursive true
      end
	end
	
    template "#{file_name}" do
      user usr
      group usr
      source "#{template_name}"
    end
  end
end
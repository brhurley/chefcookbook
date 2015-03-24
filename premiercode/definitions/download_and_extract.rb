define :download_and_extract do
  data_type = params[:data_type]
  aws_location = params[:aws_location]
  target_dir = params[:target_dir]
  usr = params[:user]
  
  directory "#{target_dir}" do
    owner usr
	group usr
	recursive true
  end 
  
  node["#{data_type}"]['data'].each do |name,version|

	  file_name = "#{name}.#{version}.tar.gz"
	  extract_dir = "#{name}.#{version}"
	  link_path = "#{target_dir}/#{name}"

	  directory "#{target_dir}" do
		owner usr
		group usr
		not_if do Dir.exist?("#{target_dir}") end
	  end

	  execute "download-#{aws_location}/#{file_name}" do
		command "aws s3 cp s3://#{aws_location}/#{name}/#{file_name} /tmp/. "
	  end

	  execute "remove-old-#{target_dir}/#{extract_dir}" do
		command "rm -rf #{target_dir}/#{extract_dir}"
		only_if do FileTest.directory?("#{target_dir}/#{extract_dir}") end
	  end

	  execute "extract-#{file_name}" do
		command "tar -xf /tmp/#{file_name} -C #{target_dir}/. "
	  end

	  execute "change-owner-#{target_dir}/#{extract_dir}" do
		command "sudo chown #{usr}:#{usr} #{target_dir}/#{extract_dir}"
	  end

	  execute "remove-link-#{link_path}" do
		command "rm #{link_path}"
		only_if do FileTest.directory?("#{link_path}") end
	  end

	  execute "link-#{link_path}" do
		user usr
		group usr
		command "ln -s #{target_dir}/#{extract_dir} #{link_path}"
	  end
  end
end

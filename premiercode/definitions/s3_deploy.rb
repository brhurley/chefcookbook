define :s3_deploy do

  data = params[:data]
  s3_location = params[:s3_location]
  target_dir = params[:target_dir]
  usr = params[:user]

  directory "#{target_dir}" do
    owner usr
    group usr
    recursive true
  end 

  data.each do |source,dest|

    final_dir = "#{tomcatdeploy.rb}/#{dest}"
    s3_filename = "#{source}".split("/")[-1]
    tmp_file = "/tmp/#{s3_filename}"

    directory "#{final_dir}" do
      owner usr
      group usr
      not_if do Dir.exist?("#{final_dir}") end
    end

    execute "download-#{s3_filename}-to-temp" do
      command "aws s3 cp #{source} #{tmp_file}"
    end

    execute "extract-#{s3_filename}-to-dest" do
      command "tar -xf #{tmp_file} -C #{final_dir}"
    end 

    execute "change-owner-#{final_dir}" do
      command "chown -R #{usr}:#{usr} #{final_dir}"
    end
  end

end
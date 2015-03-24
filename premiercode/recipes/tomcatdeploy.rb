



s3_deploy "deploy-warfile" do
  application "tomcatwar"
  data node[:tomcatwar][:data]
  s3_location "#{node[:tomcatwar]['s3.path']}"
  target_dir "/prod"
  user usr
end



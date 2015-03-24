usr = node['username']

s3_deploy "deploy-tomcat_app" do
  application "tomcat-app"
  data node[:tomcatwar][:data]
  s3_location "#{node[:tomcatwar]['s3.url']}"
  target_dir "/opt/webapps"
  user usr
end


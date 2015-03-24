usr = node['username']

s3_deploy "deploy-tomcat_app" do
  application "tomcat-app"
  data node[:tomcat-app-war][:data]
  s3_location "#{node[:tomcat-app-war]['s3.url']}"
  target_dir "/opt/webapps"
  user usr
end


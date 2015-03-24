default['username'] = 'ec2_user'

default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'oracle'
default['java']['jdk']['8']['x86_64']['url'] = 'https://s3.amazonaws.com/ck-common-data/artifacts/jdk-8u40-linux-x64.tar.gz'
default['java']['oracle']['accept_oracle_download_terms'] = true


default['tomcat-all']['user'] = 'root'
default['tomcat-all']['group'] = 'root'
default['tomcat-all']['install_directory'] = '/opt'
default['tomcat-all']['version'] = '7.0.59'
default['tomcat-all']['port'] = '80'
default['tomcat-all']['java_opts'] - "-server -Djava.awt.headless=true -Xms1024m -Xmx4096m -XX:MaxPermSize=512m"


default['tomcat-app-war']['s3.path'] = 'https://s3.amazonaws.com/ck-common-data/artifacts/topicpages-config-1.0.3.war'



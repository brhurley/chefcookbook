default['java']['jdk_version'] = '8'
default['java']['install_flavor'] = 'oracle'
default['java']['jdk']['8']['x86_64']['url'] = 'https://s3.amazonaws.com/ck-common-data/artifacts/jdk-8u25-linux-x64.tar.gz'
default['java']['oracle']['accept_oracle_download_terms'] = true

include_recipe 'java'
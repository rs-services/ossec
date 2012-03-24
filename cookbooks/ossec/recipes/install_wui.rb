# Cookbook Name:: ossec
# Recipe:: install_wui
#
# Copyright 2010, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

script "install_ossec-wui" do
  cwd "/tmp"
  code <<-EOH
wget http://www.ossec.net/files/ui/ossec-wui-0.3.tar.gz

# Verify the checksum and signature of the package, you can find the GPG key at http://www.ossec.net/main/pgp/ : 
#wget http://www.ossec.net/files/ui/ossec-wui-0.3-checksum.txt
#wget http://www.ossec.net/files/ui/ossec-wui-0.3.tar.gz.sig
#md5 ossec-wui-0.3.tar.gz
#MD5 (ossec-wui-0.3.tar.gz) = c79fa486e9a20fb06a517541033af304
#sha1 ossec-wui-0.3.tar.gz
#SHA1 (ossec-wui-0.3.tar.gz) = e00bff680721982ee55295a5292eb4e2a638b820
#gpg --verify ossec-wui-0.3.tar.gz.sig ossec-wui-0.3.tar.gz
#gpg: Signature made Tue Mar 04 14:27:59 2008 AST using RSA key ID 6B30327E
#gpg: Good signature from "Daniel B. Cid (Ossec development) <dcid@ossec.net>"
#Primary key fingerprint: 86C6 D33B C52E 19BF DDAE  57EB 4E57 14E2 6B30 327E

#Decompress/untar and move the files to somewhere accessible by your web server: 
tar zxvf ossec-wui-0.3.tar.gz
mv -v ossec-wui-0.3 /var/www/html/ossec-wui
  EOH
end










  




#Run the setup script 
cd /var/www/htdocs/ossec-wui
./setup.sh

# Add your web server user (apache, www or nobody) to the ossec group: 
# vi /etc/group
#   ..
#   From:
#       ossec:x:1002:
#   To (if your web server user is www):
#       ossec:x:1002:www


# Fix the permissions for the tmp directory of your OSSEC installation (for example: /var/ossec/tmp) and restart Apache (for the new permissions to work) 
   # chmod 770 tmp/
   # chgrp www tmp/
   # apachectl restart


 #If you have a large ossec install, you may want to re-configure PHP to support longer lasting scripts and higher memory utilization. The following entries on php.ini can be increased: 
#    max_execution_time = 180
#    max_input_time = 180
#    memory_limit = 30M


#You should now be able to access the UI: 
#http ://anyhost/ossec-wui/
#BE CAREFUL, FOR CENTOS SYSTEM, CONFIGURE OR DISABLE SELINUX BEFORE TO ACCESS THE INTERFACE. 
# Report any problems or suggestions to our mailing list: 
 # http://www.ossec.net/en/mailing_lists.html
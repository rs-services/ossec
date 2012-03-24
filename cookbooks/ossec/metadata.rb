maintainer       "Opscode, Inc."
maintainer_email "cookbooks@opscode.com"
license          "Apache 2.0"
description      "Installs/Configures ossec"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.1"

depends "build-essential"

%w{ debian ubuntu arch redhat centos fedora }.each do |os|
  supports os
end

recipe "ossec::default", "Installs and configures OSSEC."
recipe "ossec::agent", "OSSEC agent install."
recipe "ossec::client", "OSSEC client install."
recipe "ossec::server", "OSSEC server install."
recipe "ossec::install", "Installs OSSEC HIDS."
recipe "ossec::install_from_source", "Installs OSSEC from source."
recipe "ossec::install_from_atomic", "Installs OSSEC HIDS from the Atomic YUM repository."
recipe "ossec::install_atomic_archive", "Installs the YUM Atomic repository."
recipe "ossec::service_status", "Shows OSSEC services status."
recipe "ossec::start_service", "Starts the ossec system service."
recipe "ossec::stop_service", "Stops the ossec system service."

attribute "ossec/server/maxagents",
  :display_name => "Server Max Agents",
  :description => "Max number of agents a server will alllow to connect to itself",
  :default => "256",
  :required => "optional",
  :recipes => [ "ossec::default" ]

attribute "ossec/server_role",
  :display_name => "Ossec Server",
  :description => "When using server/agent setup, this role is used to search for the OSSEC server",
  :default => "osec_server",
  :required => "optional",
  :recipes => [ "ossec::default" ]

attribute "ossec/checksum",
  :display_name => "",
  :description => "",
  :default => "",
  :required => "optional",
  :recipes => [ "ossec::default" ]

attribute "ossec/version",
  :display_name => "",
  :description => "",
  :default => "2.6",
  :required => "optional",
  :recipes => [ "ossec::default" ]

attribute "ossec/url",
  :display_name => "",
  :description => "",
  :default => "http://www.ossec.net/files/ossec-hids-2.6.tar.gz",
  :required => "optional",
  :recipes => [ "ossec::default" ]

attribute "ossec/logs",
:display_name => "",
:description => "",
:default => "",
:required => "optional",
:recipes => [ "ossec::default" ]

attribute "ossec/syscheck_freq",
:display_name => "",
:description => "",
:default => "79200",
:required => "optional",
:recipes => [ "ossec::default" ]

attribute "ossec/user/language",
:display_name => "",
:description => "",
:default => "en",
:required => "optional",
:recipes => [ "ossec::default" ]

attribute "ossec/user/install_type",
:display_name => "",
:description => "",
:default => "local",
:required => "optional",
:recipes => [ "ossec::default" ]

attribute "ossec/user/dir",
:display_name => "",
:description => "",
:default => "/var/ossec",
:required => "optional",
:recipes => [ "ossec::default" ]

attribute "ossec/user/delete_dir",
:display_name => "",
:description => "",
:default => "true",
:required => "optional",
:recipes => [ "ossec::default" ]

attribute "ossec/user/active_response",
:display_name => "",
:description => "",
:default => "false",
:required => "optional",
:recipes => [ "ossec::default" ]

attribute "ossec/user/syscheck",
:display_name => "",
:description => "",
:default => "true",
:required => "optional",
:recipes => [ "ossec::default" ]

attribute "ossec/user/rootcheck",
:display_name => "",
:description => "",
:default => "true",
:required => "optional",
:recipes => [ "ossec::default" ]

attribute "ossec/user/update",
:display_name => "",
:description => "",
:default => "false",
:required => "optional",
:recipes => [ "ossec::default" ]

attribute "ossec/user/update_rules",
:display_name => "",
:description => "",
:default => "true",
:required => "optional",
:recipes => [ "ossec::default" ]

attribute "ossec/user/binary_install",
:display_name => "",
:description => "",
:default => "false",
:required => "optional",
:recipes => [ "ossec::default" ]

attribute "ossec/user/agent_server_ip",
:display_name => "",
:description => "",
:default => "",
:required => "optional",
:recipes => [ "ossec::default" ]

attribute "ossec/user/enable_email",
:display_name => "",
:description => "",
:default => "true",
:required => "optional",
:recipes => [ "ossec::default" ]

attribute "ossec/user/email",
:display_name => "",
:description => "",
:default => "ossec@rightscale.com",
:required => "optional",
:recipes => [ "ossec::default" ]

attribute "ossec/user/smtp",
:display_name => "",
:description => "",
:default => "127.0.0.1",
:required => "optional",
:recipes => [ "ossec::default" ]

attribute "ossec/user/remote_syslog",
:display_name => "",
:description => "",
:default => "false",
:required => "optional",
:recipes => [ "ossec::default" ]

attribute "ossec/user/firewall_response",
  :display_name => "",
  :description => "",
  :default => "true",
  :required => "optional",
  :recipes => [ "ossec::default" ]

attribute "ossec/user/pf",
  :display_name => "",
  :description => "",
  :default => "false",
  :required => "optional",
  :recipes => [ "ossec::default" ]

attribute "ossec/user/pf_table",
  :display_name => "",
  :description => "",
  :default => "false",
  :required => "optional",
  :recipes => [ "ossec::default" ]

attribute "ossec/user/white_list",
:display_name => "",
:description => "",
:default => "",
:required => "optional",
:recipes => [ "ossec::default" ]

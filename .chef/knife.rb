# See http://docs.opscode.com/config_rb_knife.html for more information on knife configuration options

organization = ENV['CHEF_ORG'] || begin
        organization_base_name = "cinnexops"
        require 'grit'
        repository = Grit::Repo.new(Dir.pwd)
        current_branch = Grit::Head.current(repository).name
        organization = organization_base_name
        organization << "-#{current_branch}" unless current_branch == 'master'
        organization
end

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "marcinfab"
client_key               "#{current_dir}/marcinfab.pem"
validation_client_name   "cinnexops-validator"
validation_key           "#{current_dir}/cinnexops-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/#{organization}"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
cookbook_copyright "Cinnex OPS"
cookbook_license "apachev2"
cookbook_email "email@wp.pl"

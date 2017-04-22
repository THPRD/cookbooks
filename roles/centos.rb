  name "centos"
  description "base centos configuration"
    "default_attributes": {
    "chef_client": {
      "interval": 1800,
      "splay": 60
    }
  },
  "override_attributes": {
  },
  "chef_type": "role",
  "run_list": ["recipe[chef-client::default]",
               "recipe[chef-client::delete_validation]",
               "recipe[thprd_linux_ntp]"
               "recipe[thprd_resolv_conf]"
               "recipe[thprd_sshd]"
  ],
  "env_run_lists": {
  }

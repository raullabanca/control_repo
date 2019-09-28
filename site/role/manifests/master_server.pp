class role::master_server {
  include profile::r10k
  include profile::base
  include profile::agent_nodes
}

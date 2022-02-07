kubernetes_version = "1.22.5"
container_manager  = "containerd"
node_hosts = {
  arc = {
    "control1" = {
      name          = "z-ca-arc-control1"
      compute_node  = false
      etcd_instance = "etcd1"
      ipv4_address  = "10.225.115.84"
    },
    "control2" =  {
      name          = "z-ca-arc-control2"
      compute_node  = false
      etcd_instance = "etcd2"
      ipv4_address  = "10.225.115.85"
    },
    "compute1" = {
      name          = "z-ca-arc-compute1"
      compute_node  = true
      etcd_instance = "etcd3"
      ipv4_address  = "10.225.115.86"
    },
    "compute2" = {
      name          = "z-ca-arc-compute2"
      compute_node  = true
      etcd_instance = ""
      ipv4_address  = "10.225.115.87"
    },
    "compute3" = {
      name          = "z-ca-arc-compute3"
      compute_node  = true
      etcd_instance = ""
      ipv4_address  = "10.225.115.88"
    }
  },
  bdc = {
    "control1" = {
      name          = "z-ca-bdc-control1"
      compute_node  = false
      etcd_instance = "etcd1"
      ipv4_address  = "10.225.113.80"
    },
    "control2" =  {
      name          = "z-ca-bdc-control2"
      compute_node  = false
      etcd_instance = "etcd2"
      ipv4_address  = "10.225.113.81"
    },
    "compute1" = {
      name          = "z-ca-bdc-compute1"
      compute_node  = true
      etcd_instance = "etcd3"
      ipv4_address  = "10.225.113.82"
    },
    "compute2" = {
      name          = "z-ca-bdc-compute2"
      compute_node  = true
      etcd_instance = ""
      ipv4_address  = "10.225.113.83"
    },
    "compute3" = {
      name          = "z-ca-bdc-compute3"
      compute_node  = true
      etcd_instance = ""
      ipv4_address  = "10.225.113.84"
    }
  }
}

# Overview

This module deploys a kubernetes cluster, installs kubectl and creates a context with which users can connect to the cluster with

# Usage

## Apply

Execute the following command from the `Arc-PX-VMware-Faststart/kubernetes` directory
```
terraform apply -auto-approve 
```
### Example: Applying the configuration

If for example we want to create a Kubernetes cluster for Azure Arc enabled data services, the kuberneres workspace might be called arc.

1. First, create a workspace:
```
terraform workspace new arc
```

2. If the workspace already exists and the and has been created in a different session, select it:
```
terraform workspace select arc
```

3. Create a `terraform.tfvars` with the value of the `node_hosts` variable specified per the example provided in the variables section of the document below.

4. Apply the configuration:
```
terraform apply -auto-approve
```

The example node_hosts variable provide below contains a block of hosts for an **arc** cluster and a block of hosts for a **bdc** cluster, creating
a Kubernetes cluster for arc would be achieved by:
```
terraform workspace new arc
```
or if the arc workspace alreay exists:
```
terraform workspace select arc
```
followed by:
```
terraform apply -auto-approve
```

Create a **bdc** cluster, per the block of hosts labelled with bdc, would be achieved via:
```
terraform workspace new bdc
```
or if the bdc workspace alreay exists:
```
terraform workspace select bdc
```
followed by:
```
terraform apply -auto-approve
```

**Note**

If the current workspace does not correspond to a label in the `node_hosts` variable that encapsulates the objects representing the hosts themselves,
`Error: Invalid index` errors will be encountered for the node_hosts variable and the configuration will fail to be applied.

## Destroy

```
terraform destroy -auto-approve 
```

### Example: Destroying the configuration

1. Select the workspace for the cluster you wish to destroy, for example if this is arc, you would issue:
```
terraform workspace select arc
```
2. Destroy the configuration:
```
terraform destroy -auto-approve
```

# Dependencies

- The user that terraform apply is executed under should be able to ssh onto each machine that will host a cluster node without being prompted for a password
- The user that terraform apply is executed under should be able a member of the sudoers groups
- The ip address/hostname pair for each cluster node host should be present in the `/etc/hosts` file on the machine that `terraform apply` is executed from

# Variables

The minimum set of variables that need to be configured consists of those with no default values.

| Name                        | Data type | Description / Notes                                                 | Mandatory (Y/N) | Default Value                   |
|-----------------------------|-----------|---------------------------------------------------------------------|-----------------|---------------------------------|
| kubernetes_version          | string    | Set to true if the Portworx spec has been created with              |        Y        | 1.22.5                          |


Specify the node host configuration information as follows in a terraform.vars file:
```
node_hosts = {
  arc = {
    control1 = {
      name          = "z-ca-arc-control1"
      compute_node  = false
      etcd_instance = "etcd1"
      ipv4_address  = "10.123.456.01"
    },
    control2 =  {
      name          = "z-ca-arc-control2"
      compute_node  = false
      etcd_instance = "etcd2"
      ipv4_address  = "10.123.456.02"
    },
    compute1 = {
      name          = "z-ca-arc-compute1"
      compute_node  = true
      etcd_instance = "etcd3"
      ipv4_address  = "10.123.456.03"
    },
    compute2 = {
      name          = "z-ca-arc-compute2"
      compute_node  = true
      etcd_instance = ""
      ipv4_address  = "10.123.456.04"
    },
    compute3 = {
      name          = "z-ca-arc-compute3"
      compute_node  = true
      etcd_instance = ""
      ipv4_address  = "10.123.456.05"
    }
  },
  bdc = {
    control1 = {
      name          = "z-ca-bdc-control1"
      compute_node  = false
      etcd_instance = "etcd1"
      ipv4_address  = "10.123.456.06"
    },
    control2 =  {
      name          = "z-ca-bdc-control2"
      compute_node  = false
      etcd_instance = "etcd2"
      ipv4_address  = "10.123.456.07"
    },
    compute1 = {
      name          = "z-ca-bdc-compute1"
      compute_node  = true
      etcd_instance = "etcd3"
      ipv4_address  = "10.123.456.08"
    },
    compute2 = {
      name          = "z-ca-bdc-compute2"
      compute_node  = true
      etcd_instance = ""
      ipv4_address  = "10.123.456.09"
    },
    compute3 = {
      name          = "z-ca-bdc-compute3"
      compute_node  = true
      etcd_instance = ""
      ipv4_address  = "10.123.456.10"
    }
  }
}
```
**Note**
- Specify true for the `compute_node` attribute if the host is a worker node, otherwise set this to false
- Specify a name for the `etcd_instance` attribute is the node host hosts an etcd instance
- The example provided will lead to the creation of a kubernetes cluster with three etcd instance, two control plane nodes and three worker (or compute) nodes, to reuse
  this simply provide the actual IP addresses for your servers in place of the 192.168.123.x addresses used in the example

[Back to root module](https://github.com/chrisadkin/arc-px-vmware-faststart/blob/main/README.md)

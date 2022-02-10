resource "kubectl_manifest" "data_controller_crd" {
  wait = true
  yaml_body = <<YAML
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: datacontrollers.arcdata.microsoft.com
spec:
  group: arcdata.microsoft.com
  versions:
  - name: v1beta1
    served: true
    storage: false
    schema:
      openAPIV3Schema:
        type: object
        x-kubernetes-preserve-unknown-fields: true
    subresources:
      status: {}
    additionalPrinterColumns:
    - name: State
      type: string
      jsonPath: .status.state
  - name: v1
    served: true
    storage: false
    schema:
      openAPIV3Schema:
        type: object
        x-kubernetes-preserve-unknown-fields: true
    subresources:
      status: {}
    additionalPrinterColumns:
    - name: State
      type: string
      jsonPath: .status.state
  - name: v2
    served: true
    storage: true
    schema:
      openAPIV3Schema:
        type: object
        x-kubernetes-preserve-unknown-fields: true
    subresources:
      status: {}
    additionalPrinterColumns:
    - name: State
      type: string
      jsonPath: .status.state
  conversion:
    strategy: None
  names:
    kind: DataController
    plural: datacontrollers
  scope: Namespaced
YAML
}

resource "kubectl_manifest" "postgres_crd" {
  wait = true
  yaml_body = <<YAML
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: postgresqls.arcdata.microsoft.com
spec:
  group: arcdata.microsoft.com
  versions:
  - name: v1beta1
    served: true
    storage: false
    schema:
      openAPIV3Schema:
        type: object
        x-kubernetes-preserve-unknown-fields: true
    subresources:
      status: {}
    additionalPrinterColumns:
    - name: State
      type: string
      jsonPath: ".status.state"
    - name: Ready-Pods
      type: string
      jsonPath: ".status.readyPods"
    - name: Primary-Endpoint
      type: string
      jsonPath: ".status.primaryEndpoint"
    - name: Age
      type: date
      jsonPath: ".metadata.creationTimestamp"
  - name: v1beta2
    served: true
    storage: true
    schema:
      openAPIV3Schema:
        type: object
        x-kubernetes-preserve-unknown-fields: true
    subresources:
      status: {}
    additionalPrinterColumns:
    - name: State
      type: string
      jsonPath: ".status.state"
    - name: Ready-Pods
      type: string
      jsonPath: ".status.readyPods"
    - name: Primary-Endpoint
      type: string
      jsonPath: ".status.primaryEndpoint"
    - name: Age
      type: date
      jsonPath: ".metadata.creationTimestamp"
  conversion:
    strategy: None
  names:
    kind: PostgreSql
    plural: postgresqls
    shortNames:
    - postgres
  scope: Namespaced
YAML
}

resource "kubectl_manifest" "sqlmi_crd" {
  wait = true
  yaml_body = <<YAML
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: sqlmanagedinstances.sql.arcdata.microsoft.com
spec:
  group: sql.arcdata.microsoft.com
  versions:
  - name: v1beta1
    served: true
    storage: false
    schema:
      openAPIV3Schema:
        type: object
        x-kubernetes-preserve-unknown-fields: true
    subresources:
      status: {}
    additionalPrinterColumns:
    - name: Status
      type: string
      jsonPath: ".status.state"
    - name: Replicas
      type: string
      jsonPath: ".status.readyReplicas"
    - name: Primary-Endpoint
      type: string
      jsonPath: ".status.primaryEndpoint"
    - name: Age
      type: date
      jsonPath: ".metadata.creationTimestamp"
  - name: v1
    served: true
    storage: false
    schema:
      openAPIV3Schema:
        type: object
        x-kubernetes-preserve-unknown-fields: true
    subresources:
      status: {}
    additionalPrinterColumns:
    - name: Status
      type: string
      jsonPath: ".status.state"
    - name: Replicas
      type: string
      jsonPath: ".status.readyReplicas"
    - name: Primary-Endpoint
      type: string
      jsonPath: ".status.primaryEndpoint"
    - name: Age
      type: date
      jsonPath: ".metadata.creationTimestamp"
  - name: v2
    served: true
    storage: true
    schema:
      openAPIV3Schema:
        type: object
        x-kubernetes-preserve-unknown-fields: true
    subresources:
      status: {}
    additionalPrinterColumns:
    - name: Status
      type: string
      jsonPath: ".status.state"
    - name: Replicas
      type: string
      jsonPath: ".status.readyReplicas"
    - name: Primary-Endpoint
      type: string
      jsonPath: ".status.primaryEndpoint"
    - name: Age
      type: date
      jsonPath: ".metadata.creationTimestamp"
  conversion:
    strategy: None
  names:
    kind: SqlManagedInstance
    plural: sqlmanagedinstances
    shortNames:
    - sqlmi
  scope: Namespaced
YAML
}

resource "kubectl_manifest" "sql_restore_crd" {
  wait = true
  yaml_body = <<YAML
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: sqlmanagedinstancerestoretasks.tasks.sql.arcdata.microsoft.com
spec:
  group: tasks.sql.arcdata.microsoft.com
  versions:
  - name: v1beta1
    served: true
    storage: false
    schema:
      openAPIV3Schema:
        type: object
        x-kubernetes-preserve-unknown-fields: true
    subresources:
      status: {}
    additionalPrinterColumns:
    - jsonPath: .status.state
      name: Status
      type: string
    - jsonPath: .metadata.creationTimestamp
      name: Age
      type: date
  - name: v1
    served: true
    storage: true
    schema:
      openAPIV3Schema:
        type: object
        x-kubernetes-preserve-unknown-fields: true
    subresources:
      status: {}
    additionalPrinterColumns:
    - jsonPath: .status.state
      name: Status
      type: string
    - jsonPath: .metadata.creationTimestamp
      name: Age
      type: date
  conversion:
    strategy: None
  names:
    kind: SqlManagedInstanceRestoreTask
    singular: sqlmanagedinstancerestoretask
    plural: sqlmanagedinstancerestoretasks
    shortNames:
      - sqlmirestoretask
  scope: Namespaced
YAML
}

resource "kubectl_manifest" "export_tasks_crd" {
  wait = true
  yaml_body = <<YAML
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: exporttasks.tasks.arcdata.microsoft.com
spec:
  group: tasks.arcdata.microsoft.com
  versions:
  - name: v1beta1
    served: true
    storage: false
    schema:
      openAPIV3Schema:
        type: object
        x-kubernetes-preserve-unknown-fields: true
    subresources:
      status: {}
    additionalPrinterColumns:
    - jsonPath: .status.state
      name: Status
      type: string
    - jsonPath: .metadata.creationTimestamp
      name: Age
      type: date
  - name: v1
    served: true
    storage: false
    schema:
      openAPIV3Schema:
        type: object
        x-kubernetes-preserve-unknown-fields: true
    subresources:
      status: {}
    additionalPrinterColumns:
    - jsonPath: .status.state
      name: Status
      type: string
    - jsonPath: .metadata.creationTimestamp
      name: Age
      type: date
  - name: v2
    served: true
    storage: true
    schema:
      openAPIV3Schema:
        type: object
        x-kubernetes-preserve-unknown-fields: true
    subresources:
      status: {}
    additionalPrinterColumns:
    - jsonPath: .status.state
      name: Status
      type: string
    - jsonPath: .metadata.creationTimestamp
      name: Age
      type: date
  conversion:
    strategy: None
  names:
    kind: ExportTask
    singular: exporttask
    plural: exporttasks
    shortNames:
    - export
  scope: Namespaced
YAML
}

resource "kubectl_manifest" "monitors_crd" {
  wait = true
  yaml_body = <<YAML
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: monitors.arcdata.microsoft.com
spec:
  group: arcdata.microsoft.com
  versions:
  - name: v1beta1
    served: true
    storage: false
    schema:
      openAPIV3Schema:
        type: object
        x-kubernetes-preserve-unknown-fields: true
    subresources:
      status: {}
    additionalPrinterColumns:
    - name: Status
      type: string
      jsonPath: ".status.state"
    - name: Age
      type: date
      jsonPath: ".metadata.creationTimestamp"
  - name: v1
    served: true
    storage: false
    schema:
      openAPIV3Schema:
        type: object
        x-kubernetes-preserve-unknown-fields: true
    subresources:
      status: {}
    additionalPrinterColumns:
    - name: Status
      type: string
      jsonPath: ".status.state"
    - name: Age
      type: date
      jsonPath: ".metadata.creationTimestamp"
  - name: v2
    served: true
    storage: true
    schema:
      openAPIV3Schema:
        type: object
        x-kubernetes-preserve-unknown-fields: true
    subresources:
      status: {}
    additionalPrinterColumns:
    - name: Status
      type: string
      jsonPath: ".status.state"
    - name: Age
      type: date
      jsonPath: ".metadata.creationTimestamp"
  conversion:
    strategy: None
  names:
    kind: Monitor
    plural: monitors
    shortNames:
    - monitor
  scope: Namespaced
YAML
}

resource "kubectl_manifest" "dags_crd" {
  wait = true
  yaml_body = <<YAML
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: dags.sql.arcdata.microsoft.com
spec:
  group: sql.arcdata.microsoft.com
  versions:
  - name: v1beta1
    served: true
    storage: false
    schema:
      openAPIV3Schema:
        type: object
        x-kubernetes-preserve-unknown-fields: true
    subresources:
      status: {}
    additionalPrinterColumns:
    - jsonPath: .status.state
      name: Status
      type: string
    - jsonPath: .status.results
      name: Results
      type: string
    - jsonPath: .metadata.creationTimestamp
      name: Age
      type: date
  - name: v1beta2
    served: true
    storage: true
    schema:
      openAPIV3Schema:
        type: object
        x-kubernetes-preserve-unknown-fields: true
    subresources:
      status: {}
    additionalPrinterColumns:
    - jsonPath: .status.state
      name: Status
      type: string
    - jsonPath: .status.results
      name: Results
      type: string
    - jsonPath: .metadata.creationTimestamp
      name: Age
      type: date
  conversion:
    strategy: None
  names:
    kind: Dag
    singular: dag
    plural: dags
    shortNames:
    - dag
  scope: Namespaced
YAML
}

resource "kubectl_manifest" "adc_crd" {
  wait = true
  yaml_body = <<YAML
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: activedirectoryconnectors.arcdata.microsoft.com
spec:
  group: arcdata.microsoft.com
  versions:
  - name: v1beta1
    served: true
    storage: true
    schema:
      openAPIV3Schema:
        type: object
        x-kubernetes-preserve-unknown-fields: true
    subresources:
      status: {}
    additionalPrinterColumns:
    - name: Status
      type: string
      jsonPath: ".status.state"
    - name: Age
      type: date
      jsonPath: ".metadata.creationTimestamp"
  names:
    kind: ActiveDirectoryConnector
    plural: activedirectoryconnectors
    shortNames:
    - adc
    - adcon
    - adconnector
  scope: Namespaced
YAML
}

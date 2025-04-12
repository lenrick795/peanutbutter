variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "endpoint_public_access" {
  description = "Should the API endpoint be public?"
  type        = bool
  default     = false
}

variable "endpoint_private_access" {
  description = "Should the API endpoint be private?"
  type        = bool
  default     = true
}

variable "public_access_cidrs" {
  description = "List of CIDRs allowed to access the public endpoint"
  type        = list(string)
  default     = []
}

variable "node_pools" {
  description = "List of node pool names for auto mode"
  type        = list(string)
  default     = ["general-purpose", "system"]
}

variable "k8s_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.32"
}

variable "enabled_cluster_log_types" {
  description = "List of log types to enable for the cluster"
  type        = list(string)
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "kms_key_arn" {
  description = "KMS Key ARN for encrypting Kubernetes secrets"
  type        = string
}

variable "tags" {
  description = "Tags to attach to the EKS cluster"
  type        = map(string)
  default     = {}
}
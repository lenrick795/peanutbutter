variable "name" {
  description = "Name of the app and Kubernetes resources"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace to deploy into"
  type        = string
  default     = "default"
}

variable "replicas" {
  description = "Number of app replicas"
  type        = number
  default     = 2
}

variable "image" {
  description = "Docker image to deploy"
  type        = string
}

variable "container_name" {
  description = "Name of the container in the pod"
  type        = string
  default     = "app-container"
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
  default     = 3000
}
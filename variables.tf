variable "namespace" {
  description = "The namespace to install into."
  default     = "jupyter"
  type        = string
}

variable "name_prefix" {
  description = "Prefix to be used when naming the different components."
  default     = "combinator"
  type        = string
}

variable "image" {
  description = "Docker image to use"
  default     = "jupyter/scipy-notebook:python-3.9.2"
  type        = string
}

variable "command" {
  description = "Container command"
  default     = ["start-notebook.sh", "--NotebookApp.token=''"]
  type        = list(string)
}

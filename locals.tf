locals {
  name            = "jupyter"
  deployment_name = "${var.name_prefix}-${local.name}-deployment"
  app_label       = "${var.name_prefix}-${local.name}"
}

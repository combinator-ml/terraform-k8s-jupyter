locals {
  name            = "jupyter"
  deployment_name = "${var.prefix}-${local.name}-deployment"
  app_label       = "${var.prefix}-${local.name}"
}

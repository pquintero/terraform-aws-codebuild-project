variable "name" {
  description = "The name of the codebuild project"
  type        = string
}

variable "description" {
  description = "The description of the codebuild project"
  type        = string
  default     = null
}

variable "build_timeout" {
  description = "The timeout of the codebuild project"
  type        = string
  default     = "15"
}

variable "service_role" {
  description = "the arn of the role of the codebuild project"
  type        = string
}

variable "artifacts_type" {
  description = "the artifacts type of the codebuild project"
  type        = string
  default     = "NO_ARTIFACTS"
}

variable "source_type" {
  description = "the source type of the codebuild project"
  type        = string
  default     = "NO_SOURCE"
}

variable "source_buildspec" {
  description = "The buildspec of the codebuild project"
  type        = string
  default     = null
}

variable "environment_type" {
  description = "The environment type of the codebuild project"
  type        = string
  default     = "LINUX_CONTAINER"
}

variable "environment_compute_type" {
  description = "The environment compute type of the codebuild project"
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
}

variable "environment_image" {
  description = "The environment image of the codebuild project"
  type        = string
  default     = "aws/codebuild/amazonlinux2-x86_64-standard:3.0"
}

variable "privileged_mode" {
  description = "The privileged mode of the codebuild project"
  type        = string
  default     = false
}

variable "environment_variable" {
  description = "Environment variable"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "The vpc id of the codebuild project"
  type        = string
  default     = null
}

variable "subnets" {
  description = "The subnets id of the codebuild project"
  type        = list(string)
  default     = null
}

variable "security_group_ids" {
  description = "The security group ids of the codebuild project"
  type        = list(string)
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to the role."
  type        = map(string)
  default     = {}
}
variable "cloudwatch_log_data_protection_policy_document_lookup" {
  description = <<EOT
Map of cloudwatch_log_data_protection_policy_document_lookup, attributes below
Required:
    - name
    - statement (block):
        - data_identifiers (required)
        - operation (required, block):
            - audit (optional, block):
                - findings_destination (required, block):
                    - cloudwatch_logs (optional, block):
                        - log_group (required)
                    - firehose (optional, block):
                        - delivery_stream (required)
                    - s3 (optional, block):
                        - bucket (required)
            - deidentify (optional, block):
                - mask_config (required, block):
        - sid (optional)
Optional:
    - description
    - version
    - configuration (block):
        - custom_data_identifier (optional, block):
            - name (required)
            - regex (required)
EOT

  type = map(object({
    name        = string
    description = optional(string)
    version     = optional(string)
    statement = list(object({
      data_identifiers = set(string)
      operation = object({
        audit = optional(object({
          findings_destination = object({
            cloudwatch_logs = optional(object({
              log_group = string
            }))
            firehose = optional(object({
              delivery_stream = string
            }))
            s3 = optional(object({
              bucket = string
            }))
          })
        }))
        deidentify = optional(object({
          mask_config = object({
          })
        }))
      })
      sid = optional(string)
    }))
    configuration = optional(object({
      custom_data_identifier = optional(list(object({
        name  = string
        regex = string
      })))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_log_data_protection_policy_document_lookup : (
        length(v.statement) >= 2 && length(v.statement) <= 2
      )
    ])
    error_message = "Each statement list must contain between 2 and 2 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_log_data_protection_policy_document_lookup : (
        v.configuration == null || (v.configuration.custom_data_identifier == null || (length(v.configuration.custom_data_identifier) <= 10))
      )
    ])
    error_message = "Each custom_data_identifier list must contain at most 10 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.cloudwatch_log_data_protection_policy_document_lookup : (
        alltrue([for item in v.statement : (item.operation.audit == null || (item.operation.audit.findings_destination.firehose == null || (length(item.operation.audit.findings_destination.firehose.delivery_stream) > 0)))])
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}


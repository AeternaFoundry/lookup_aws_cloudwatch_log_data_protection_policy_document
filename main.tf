data "aws_cloudwatch_log_data_protection_policy_document" "cloudwatch_log_data_protection_policy_document_lookup" {
  for_each = var.cloudwatch_log_data_protection_policy_document_lookup

  name        = each.value.name
  description = each.value.description
  version     = each.value.version

  dynamic "statement" {
    for_each = each.value.statement
    content {
      data_identifiers = statement.value.data_identifiers
      operation {
        dynamic "audit" {
          for_each = statement.value.operation.audit != null ? [statement.value.operation.audit] : []
          content {
            findings_destination {
              dynamic "cloudwatch_logs" {
                for_each = audit.value.findings_destination.cloudwatch_logs != null ? [audit.value.findings_destination.cloudwatch_logs] : []
                content {
                  log_group = cloudwatch_logs.value.log_group
                }
              }
              dynamic "firehose" {
                for_each = audit.value.findings_destination.firehose != null ? [audit.value.findings_destination.firehose] : []
                content {
                  delivery_stream = firehose.value.delivery_stream
                }
              }
              dynamic "s3" {
                for_each = audit.value.findings_destination.s3 != null ? [audit.value.findings_destination.s3] : []
                content {
                  bucket = s3.value.bucket
                }
              }
            }
          }
        }
        dynamic "deidentify" {
          for_each = statement.value.operation.deidentify != null ? [statement.value.operation.deidentify] : []
          content {
            mask_config {
            }
          }
        }
      }
      sid = statement.value.sid
    }
  }

  dynamic "configuration" {
    for_each = each.value.configuration != null ? [each.value.configuration] : []
    content {
      dynamic "custom_data_identifier" {
        for_each = configuration.value.custom_data_identifier != null ? configuration.value.custom_data_identifier : []
        content {
          name  = custom_data_identifier.value.name
          regex = custom_data_identifier.value.regex
        }
      }
    }
  }
}


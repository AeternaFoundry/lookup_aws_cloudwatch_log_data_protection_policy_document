output "cloudwatch_log_data_protection_policy_document_lookup_id" {
  description = "Map of id values across all cloudwatch_log_data_protection_policy_document_lookup, keyed the same as var.cloudwatch_log_data_protection_policy_document_lookup"
  value       = { for k, v in data.aws_cloudwatch_log_data_protection_policy_document.cloudwatch_log_data_protection_policy_document_lookup : k => v.id if v.id != null && length(v.id) > 0 }
}
output "cloudwatch_log_data_protection_policy_document_lookup_configuration" {
  description = "Map of configuration values across all cloudwatch_log_data_protection_policy_document_lookup, keyed the same as var.cloudwatch_log_data_protection_policy_document_lookup"
  value       = { for k, v in data.aws_cloudwatch_log_data_protection_policy_document.cloudwatch_log_data_protection_policy_document_lookup : k => one(v.configuration) if v.configuration != null && length(v.configuration) > 0 }
}
output "cloudwatch_log_data_protection_policy_document_lookup_description" {
  description = "Map of description values across all cloudwatch_log_data_protection_policy_document_lookup, keyed the same as var.cloudwatch_log_data_protection_policy_document_lookup"
  value       = { for k, v in data.aws_cloudwatch_log_data_protection_policy_document.cloudwatch_log_data_protection_policy_document_lookup : k => v.description if v.description != null && length(v.description) > 0 }
}
output "cloudwatch_log_data_protection_policy_document_lookup_json" {
  description = "Map of json values across all cloudwatch_log_data_protection_policy_document_lookup, keyed the same as var.cloudwatch_log_data_protection_policy_document_lookup"
  value       = { for k, v in data.aws_cloudwatch_log_data_protection_policy_document.cloudwatch_log_data_protection_policy_document_lookup : k => v.json if v.json != null && length(v.json) > 0 }
}
output "cloudwatch_log_data_protection_policy_document_lookup_name" {
  description = "Map of name values across all cloudwatch_log_data_protection_policy_document_lookup, keyed the same as var.cloudwatch_log_data_protection_policy_document_lookup"
  value       = { for k, v in data.aws_cloudwatch_log_data_protection_policy_document.cloudwatch_log_data_protection_policy_document_lookup : k => v.name if v.name != null && length(v.name) > 0 }
}
output "cloudwatch_log_data_protection_policy_document_lookup_statement" {
  description = "Map of statement values across all cloudwatch_log_data_protection_policy_document_lookup, keyed the same as var.cloudwatch_log_data_protection_policy_document_lookup"
  value       = { for k, v in data.aws_cloudwatch_log_data_protection_policy_document.cloudwatch_log_data_protection_policy_document_lookup : k => v.statement if v.statement != null && length(v.statement) > 0 }
}
output "cloudwatch_log_data_protection_policy_document_lookup_version" {
  description = "Map of version values across all cloudwatch_log_data_protection_policy_document_lookup, keyed the same as var.cloudwatch_log_data_protection_policy_document_lookup"
  value       = { for k, v in data.aws_cloudwatch_log_data_protection_policy_document.cloudwatch_log_data_protection_policy_document_lookup : k => v.version if v.version != null && length(v.version) > 0 }
}


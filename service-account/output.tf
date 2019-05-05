# ==================================================================
# service account: email, name. unique_id
# ==================================================================

output "email" {
    value       = "${google_service_account.fuchicorp.email}"
    description = "The e-mail address of the service account."
}
output "name" {
    value       = "${google_service_account.fuchicorp.name}"
    description = "The fully-qualified name of the service account."
}
output "unique_id" {
    value       = "${google_service_account.fuchicorp.unique_id}"
    description = "The unique id of the service account."
}

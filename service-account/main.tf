provider "google" {
  credentials = "${file("${var.cpath}")}"
  project     = "${var.project_id}"
  region      = "${var.region}"
}
resource "google_service_account" "fuchicorp" {
    account_id          = "${var.account_id}"
    display_name        = "${var.display_name}"
}

# resource "google_project_iam_member" "fuchicorp" {
#     depends_on  = ["google_service_account.fuchicorp"]
#     count       =  "${length(var.roles)}"      #not sure why we need "legth" part
#     role        =  "${element(var.roles, count.index)}"   #not sure why we need "element" and "count.index" part
#     member      =  "serviceAccount:${google_service_account.fuchicorp.email}"
# }

resource "google_service_account_key" "fuchicorp" {
    depends_on          = ["google_service_account.fuchicorp"]
    service_account_id  = "${google_service_account.fuchicorp.name}"
    public_key_type     = "TYPE_X509_PEM_FILE"
#   valid_after         = "2014-10-02T15:01:23.045123456Z"  (The key can be used after this timestamp. A timestamp in RFC3339 UTC "Zulu" format, accurate to nanoseconds.)
#   valid_before        = "2014-10-02T15:01:23.045123456Z"  (The key can be used before this timestamp. A timestamp in RFC3339 UTC "Zulu" format, accurate to nanoseconds.) 
}

resource "local_file" "serviceAccountKey" {
    content     = "${base64decode(google_service_account_key.fuchicorp.private_key)}"
    filename    = "tmp/service_account_key.json"
}
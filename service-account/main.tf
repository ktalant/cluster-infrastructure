resource "google_service_account" "default" {
    account_id          = "${var.account_id}"
    display_name        = "${var.display_name}"
}

resource "google_project_iam_member" "default" {
    depends_on  = ["google_service_account.default"]
    count       =  "${length(var.roles)}"      #not sure why we need "legth" part
    role        =  "${element(var.roles, count.index)}"   #not sure why we need "element" and "count.index" part
    member      =  "serviceAccount:${google_service_account.default.email}"
}

resource "google_service_account_key" "default" {
    depends_on          = ["google_service_account.default"]
    service_account_id  = "${google_service_account.default.name}"
    public_key_type     = "TYPE_X509_PEM_FILE"
#   valid_after         = "2014-10-02T15:01:23.045123456Z"  (The key can be used after this timestamp. A timestamp in RFC3339 UTC "Zulu" format, accurate to nanoseconds.)
#   valid_before        = "2014-10-02T15:01:23.045123456Z"  (The key can be used before this timestamp. A timestamp in RFC3339 UTC "Zulu" format, accurate to nanoseconds.) 
}

resource "local_file" "privateKey" {
    content     = "${base64decode(google_service_account_key.default.private_key)}"
    filename    = "tmp/private_key.json"
}
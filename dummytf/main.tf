resource "null_resource" "example" {
  triggers = {
    // This will trigger the resource to be recreated on every apply
    timestamp = timestamp()
  }

  provisioner "local-exec" {
    command = "echo 'Hello, Great Dummy World!'"
  }
}

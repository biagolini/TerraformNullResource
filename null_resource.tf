locals {
  myLocal = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
}


resource "null_resource" "null" {
  triggers = { # Necessary to ensure provisioner to run after every Terraform apply
    time = timestamp() 
  }

  provisioner "local-exec" {
    command = "echo  'See my var:\nlocal-exec var1:' $FOO  '\nlocal-exec var2:' $BAR  '\nTerraform local: ' ${local.myLocal}"
    environment = {
      FOO  = "Hello, World!"
      BAR = timestamp()
    }
  }
}

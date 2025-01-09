# Import will find the existing resources from ID of ec2 instance and Import into your Terraform state at the give address

#---------------STEP 1-----------------------------

# Create manually Instance on aws
# copy the ec2 instance ID 

#-----------------STEP 2---------------------------

# create empty .tf file 
  resource "aws_instance" "importone"{
  
  }

#------------------STEP 3-------------------------
# command to run
# terraform import aws_instance.importone <instanceID>
# terraform state list
# cat terraform.tstate / terraform show

#-------------------STEP 4-------------------------
# copy the all import required attribute to import-ec2.tf like amiId, key_name, sg,availibity-zone,instance_tpye,more

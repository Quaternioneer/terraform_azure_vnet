### AZ Resource Group Configuration ###
resource_group_name="team9-A"
location="eastus"

### Virtual Network ###
#ToDo: consolidate subnet_tags and make a map (or object) with keys public, private
#would that obfuscate things?
subnet_public_tags={
    name = "web"
    terraform = "true"
    address_prefix= ["10.0.1.0/24"]
    security_group=""
}
subnet_private_tags={
    name = "business"
    terraform = "true"
    address_prefix= ["10.0.2.0/24"]
    security_group=""
}
vnet_address_space = ["10.0.0.0/16"]
vnet_dns_servers =["8.8.8.8"]
vnet_tags = {
    terraform = "true"
}

### Backend accounts ###
/*
storage_account_name = "statebox"
container_name       = "smallerbox"
key                  = "vnet.tfstate"  
*/

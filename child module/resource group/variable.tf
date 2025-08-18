variable "incedo-rg" {
    type = any  
    default = {
        "rg1" = {
            name     = "incedo-rg1"
            location = "East US"
        },
        "rg2" = {
            name     = "incedo-rg2"
            location = "West US"
        }
    }
  
}
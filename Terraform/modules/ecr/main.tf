resource "aws_ecr_repository" "markone_activiti_tracker" {
    
    name = "markone-activiti-tracker"
    
    image_scanning_configuration {
      scan_on_push = true
    }

   
    encryption_configuration {
        encryption_type = "AES256"
    }

    tags = {
        Name        = "markone-activiti-tracker-repo"
        Environment = "Dev"  
    }
}

/*resource "aws_ecr_repository" "markone_user_service" {
    name = "markone-user-service"

    tags = {
        Name        = "markone-user-service-repo"
        Environment = "Dev"  
    }
  
}*/
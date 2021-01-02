provider "aws" {
  access_key                  = "mock_access_key"
  region                      = "us-east-1"
  s3_force_path_style         = true
  secret_key                  = "mock_secret_key"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    dynamodb       = "http://localhost:4566"
  }
}


resource aws_dynamodb_table DomainEntry {
  name           = "DomainEntry"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "tenant_id"
  range_key      = "sk"

  attribute {
    name = "tenant_id"
    type = "S"
  }

  attribute {
    name = "sk"
    type = "S"
  }

}

resource aws_dynamodb_table Policy {
  name           = "Policy"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "tenant_id"
  range_key      = "policy_uuid"

  attribute {
    name = "tenant_id"
    type = "S"
  }

  attribute {
    name = "policy_uuid"
    type = "S"
  }
}

resource aws_dynamodb_table Distribution {
  name           = "Distribution"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "tenant_id"
  range_key      = "sk"

  attribute {
    name = "tenant_id"
    type = "S"
  }

  attribute {
    name = "sk"
    type = "S"
  }

  attribute {
    name = "pk2"
    type = "S"
  }

  attribute {
    name = "submit_time"
    type = "S"
  }

  global_secondary_index {
    name               = "SubmitTimeIndex"
    hash_key           = "pk2"
    range_key          = "submit_time"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["distribution_uuid", "job_state", "appliance_id"]
  }

  lifecycle {
    ignore_changes = [read_capacity, write_capacity]
  }

}

resource aws_dynamodb_table DistributionInventory {
  name           = "DistributionInventory"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "tenant_id"
  range_key      = "sk"

  attribute {
    name = "tenant_id"
    type = "S"
  }

  attribute {
    name = "sk"
    type = "S"
  }
}
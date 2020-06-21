resource "aws_iam_instance_profile" "gocloud_ec2_profile" {
  name = "gocloud_ec2_profile"
  role = aws_iam_role.gocloud_ec2_role.name
}

resource "aws_instance" "GoCloudAPI"{
    ami = "ami-0e34e7b9ca0ace12d"
    instance_type = "t2.micro"
    user_data = file("apache.sh")
      iam_instance_profile = aws_iam_instance_profile.gocloud_ec2_profile.name
    #key_name = "gocloud"
}

resource "aws_dynamodb_table" "subscriptions" {
  name             = "subscriptions"
  hash_key         = "subscriptionId"
  range_key         = "SK"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "subscriptionId"
    type = "S"
  }

   attribute {
    name = "SK"
    type = "S"
  }

}

resource "aws_iam_role_policy" "gocloud_ec2_policy" {
  name = "gocloud_ec2_policy"
  role = aws_iam_role.gocloud_ec2_role.id

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "dynamodb:UpdateItem",
          "dynamodb:PutItem"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  }
  EOF
}

resource "aws_iam_role" "gocloud_ec2_role" {
  name = "gocloud_ec2_role"

  assume_role_policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": "GoCloudRole"
      }
    ]
  }
  EOF
}

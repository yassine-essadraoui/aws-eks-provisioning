vpc_name     = "vpc-for-eks"
cluster_name = "eks"
iam_roles = [
  {
    iam_role_name          = "KubeAdmin"
    iam_assume_role_policy = <<-EOF
{
      "Version": "2012-10-17",
      "Statement": [{
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::<your-account-id-here>:root"
        },
        "Action": "sts:AssumeRole"
      }]
}
EOF
  },
  {
    iam_role_name          = "DevFront"
    iam_assume_role_policy = <<-EOF
{
      "Version": "2012-10-17",
      "Statement": [{
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::<your-account-id-here>:root"
        },
        "Action": "sts:AssumeRole"
      }]
}
EOF
  },
  {
    iam_role_name          = "DevBack"
    iam_assume_role_policy = <<-EOF
{
      "Version": "2012-10-17",
      "Statement": [{
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::<your-account-id-here>:root"
        },
        "Action": "sts:AssumeRole"
      }]
}
EOF
  },
  {
    iam_role_name          = "NodesReaderRole"
    iam_assume_role_policy = <<-EOF
{
      "Version": "2012-10-17",
      "Statement": [{
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::<your-account-id-here>:root"
        },
        "Action": "sts:AssumeRole"
      }]
}
EOF
  }
]
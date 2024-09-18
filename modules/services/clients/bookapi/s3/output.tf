
#  to define outputs that can be queried or used by other modules or configurations (this provides information about the aws_s3_bucket.i360 resource)
output "s3" {
  value = {
    public  = aws_s3_bucket.s3-public
    private = aws_s3_bucket.s3-private
  }
  description = "AWS S3 Storage"
}

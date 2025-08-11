output "expr_bucket" {
  value       = aws_s3_bucket.expr_bucket.bucket
  description = "Bucket from expressions example"
}

output "str_func_bucket" {
  value       = aws_s3_bucket.str_func_bucket.bucket
  description = "Bucket from string function example"
}

output "foreach_bucket_names" {
  value       = [for b in aws_s3_bucket.foreach_bucket : b.bucket]
  description = "Buckets from for_each example"
}
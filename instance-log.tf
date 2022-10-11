resource "aws_cloudwatch_log_group" "lbitc_Jenkins_instance_logs"{
  name = "${var.instance_name}-logs" 
  retention_in_days = 7  
}
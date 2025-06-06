output "target_group_arn" {
  value = aws_lb_target_group.tg.arn
}

output "dns_name" {
  value = aws_lb.alb.dns_name
}

output "sg_id" {
  value = aws_security_group.alb_sg.id
}

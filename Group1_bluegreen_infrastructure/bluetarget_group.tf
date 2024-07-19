resource  "aws_lb_target_group" "tg_blue" {
  name     = "alb-tg-blue"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.blue-green-deploy.id

  health_check {
   port = 80
   protocol = "HTTP"
 }
}

#resource "aws_alb_target_group_attachment" "tg_blue" {
  #count            = length(aws_instance.blue)
  #target_group_arn = aws_alb_target_group.tg_blue.arn
 # target_id        = aws_instance.blue[count.index].id
 # port             = 80
#}

resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.bar.id
  aws_lb_target_group_arn = aws_lb_target_group.tg_blue.arn
}


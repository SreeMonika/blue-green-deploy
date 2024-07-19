resource "aws_lb" "my-aws-alb" {
  name               = "my-aws-alb"
  security_groups    = [aws_security_group.custom-alb-sg.id]
  load_balancer_type = "application"
  subnets            = [aws_subnet.public.id]

  enable_deletion_protection = true

  tags = {
    Name = "my-aws-alb"
  }
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.my-aws-alb.arn
  port              = "80"
  protocol          = "HTTP"

  
  #default_action {
    #type             = "forward"
    #target_group_arn = aws_alb_target_group.tg_blue.arn
  #}
  #default_action {
    #type             = "forward"
   # target_group_arn = aws_alb_target_group.tg_green.arn
  #}

  default_action {
    type             = "forward"

    forward {
      target_group {
        arn = aws_lb_target_group.tg_blue.arn
        weight = 50
      }
    
    target_group {
      arn    = aws_lb_target_group.tg_green.arn
      weight = 50
      }
    }
  }
}
      

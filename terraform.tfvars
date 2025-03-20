aws_region          			=	"ap-south-2"
vpc_name          				=	"demo-vpc"
vpc_cidr           				= 	"10.0.0.0/24"
public_subnet_cidr_1  			=   "10.0.0.0/25"
public_subnet_cidr_2 			=	"10.0.0.128/26"
private_subnet_cidr 			=   "10.0.0.192/26"
availability_zone_1  			=	"ap-south-2b"
availability_zone_2 			=	"ap-south-2c"
project_tag       				=	"demo"

sg_name      					=	"demo_sg"
synergia_ip 					=	"182.71.180.130/32" 

key_name           				= 	"demo-key"
alb_name						=	"alb"
waf_name 						=	"waf"

public_instance_name 			=	"jump-public-instance"
pub_ami_id	 					=	"ami-0910dac3efe29f09d" 
pub_instance_type				= 	"t3.micro"
pub_ebs_size					=	 30
pub_ebs_type					= 	"gp3"


private_instance_name_1 		= 	"private-instance-1"
pvt_ami_id_1               		=	"ami-0e386fa0b67b8b12c"
pvt_instance_type_1        		=	"t3.micro"
pvt_ebs_size_1            		=	8
pvt_ebs_type_1            		=	"gp3"
user_data_path 					=	"/root/terraform-import/userdata.sh"


private_instance_name_2 		=	"private-instance-2"
pvt_ami_id_2					=	"ami-0e386fa0b67b8b12c"
pvt_instance_type_2	 			=   "t3.micro"
pvt_ebs_size_2           		=	8
pvt_ebs_type_2            		= 	"gp3"


private_instance_name_3 		=	"private-instance-3"
pvt_ami_id_3					=   "ami-0e386fa0b67b8b12c"
pvt_instance_type_3				=   "t3.micro"
pvt_ebs_size_3            		=	8
pvt_ebs_type_3           		=	"gp3"






# Convert-AWS-EBS-Volume-from-gp2-to-gp3
Using AWS CloudWatch and Lambda, we automate resource management by triggering Lambda functions upon Amazon EBS volume creation. Leveraging CloudWatch Events, we monitor GP2 EBS volumes, seamlessly converting them to GP3 for enhanced performance.

# Step-by-step implementation 
step 1:- Create an lambda function as ‘ebs_volume_check’ and runtime as ‘python 3.10’ also we Create a new role with basic Lambda permissions.

![1 xXybsYaFcpPaQf301waZag-1](https://github.com/jagati2/Convert-AWS-EBS-Volume-from-gp2-to-gp3/assets/105737471/55068ea3-70e6-45ed-a491-a39c2439d592)


after creating an lambda function just test it so we confirm that lamda fuction is work correctly.


![1 nC26nWkyUfrOqUZAB7KfYw](https://github.com/jagati2/Convert-AWS-EBS-Volume-from-gp2-to-gp3/assets/105737471/2d57a2e2-0138-4aca-9f13-8a212444af29)

![1 fSxINxPdSnQ7PsKXyFfBtw](https://github.com/jagati2/Convert-AWS-EBS-Volume-from-gp2-to-gp3/assets/105737471/76353031-0b39-4d27-93a3-620a4f1609fe)



step 2 :- Go to cloudwatch service then go to event section and create an role for the ebs volume creation. Select service name as ec2 , Event type is EBS Volume Notification ,specific event is createVolume. In target section we select existing lambda fuction and configure details.



![1 RQHwVid29ZbpwkFQpEEHmQ](https://github.com/jagati2/Convert-AWS-EBS-Volume-from-gp2-to-gp3/assets/105737471/1b626a74-3a70-494f-9cd0-2d496decf8ff)


give name as per your requirement and creating role.

![1 uwyW7w0ST8r4LdEsuVJLRg](https://github.com/jagati2/Convert-AWS-EBS-Volume-from-gp2-to-gp3/assets/105737471/cfdc18a0-e387-4b8d-8437-8bbc826c1bb9)


step 3 :- go to Ec2 service underneath we select as volume section and create an volume and create gp2 ebs volume).

![1 oel2tmYyNN_0mI_tq6ViCA](https://github.com/jagati2/Convert-AWS-EBS-Volume-from-gp2-to-gp3/assets/105737471/9cdbb6d9-2383-42ea-9587-568060769215)


step 4 :- go to log groups of cloudwatch service we see the lambda fuction is triggered.


![1 dQNdmQg4LlAyxR9kUxNrAA](https://github.com/jagati2/Convert-AWS-EBS-Volume-from-gp2-to-gp3/assets/105737471/57a6eba5-a21b-49c2-8684-4c1e15e2c643)



add following code to lambda function

![Screenshot 2024-04-09 215607](https://github.com/jagati2/Convert-AWS-EBS-Volume-from-gp2-to-gp3/assets/105737471/7d95af4e-247d-44b8-9a24-d0f0032680bd)

and remove the ebs volume that we created and again recreate the ebs volume so that lambda fuction is automatically triggered and we get an detailed logs about the ebs volume.

![1 7Ox39axVQDXEFWvbWxBwug](https://github.com/jagati2/Convert-AWS-EBS-Volume-from-gp2-to-gp3/assets/105737471/f19ac916-5587-4dcf-a925-a013500f619e)

step 5 :- Go to IAM service and create an inline policy for that role , select service as ec2 and for actions allowed we select ‘volume’ and for that we add ‘describe volume’ and ‘modify volume’ and create policy.

![1 z3ENqRtib6NKsrp0mvw_UQ](https://github.com/jagati2/Convert-AWS-EBS-Volume-from-gp2-to-gp3/assets/105737471/b6ee6848-99ed-47ee-b03b-32d143563db4)

step 6 :- so we can write an final lambda fuction as below ,


![Screenshot 2024-04-09 095804](https://github.com/jagati2/Convert-AWS-EBS-Volume-from-gp2-to-gp3/assets/105737471/06b45db1-faf2-43e4-be24-468de8ad06ad)

and remove the ebs volume that we created and again recreate the ebs volume so that lambda fuction is automatically triggered.so finally we see the output as ebs volume is converted to gp2 to gp3 type.

![1 TKq2hku2MTk-WuqPIX0DMw](https://github.com/jagati2/Convert-AWS-EBS-Volume-from-gp2-to-gp3/assets/105737471/dbe8293f-4042-4a17-ae84-fc417ed566b0)









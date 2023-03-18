## What is IAM

AWS Identity and Access Management (IAM) is a web service that helps you securely control access to AWS resources. You use IAM to control who is authenticated (signed in) and authorized (has permissions) to use resources.

![plot](Images/IAM.png)

### Implementation steps

**Creating a User**

1. Create an AWS account by following steps in this [tutorial](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/).
2. Log into AWS Console using root user (email and password used when creating the account in step 1).
3. Go to [AWS IAM home page](https://us-east-1.console.aws.amazon.com/iamv2/home#/home).
4. We now create an IAM user.
  *  Click on Users in the left navigation pane and then click on Add users.
  *  Give the user name 'admin'.
  *  Enable both Access key and Password access under access type for this user.
  *  Select Custom password under Console password and type a custom password.
  *  Disable Require password reset.
  *  Click Next.
  *  Under Set Permissions, go to Attach existing policies directly. Search Administrator Access, select the policy and click on Next.
  *  Keep clicking on Next with all default settings and Create User.
5. We have now created a User. Note the 12 digit account alias which will now be used for all further logins. 

**Creating Glue Role**

1. Sign out and login into AWS console using the newly created user admin.
2. In the left navigation pane, choose Roles.
3. Choose Create role.
5. For role type, choose AWS Service, find and choose Glue, and choose Next: Permissions.
6. On the Attach permissions policy page, choose the AWS managed policy AWSGlueServiceRole for general AWS Glue permissions, the AWS managed policy AmazonS3FullAccess for access to Amazon S3 resources, AmazonRedshiftFullAccess for Redshift access and AWSGlueConsoleFullAccess for glue console access. Then choose Next: Review.
7. For Role name, enter AWSGlueServiceRole-AWSGlueServiceRoleDefault. 
8. Choose Create Role.

**References**
1. https://aws.amazon.com/iam/?nc=sn&loc=1
2. https://docs.aws.amazon.com/glue/latest/dg/create-an-iam-role.html

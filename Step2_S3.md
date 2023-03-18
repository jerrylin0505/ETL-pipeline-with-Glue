## What is Amazon S3?

Amazon Simple Storage Service (Amazon S3) is an object storage service offering industry-leading scalability, data availability, security, and performance. Amazon S3 can store any type of object, which allows uses like storage for Internet applications, backups, disaster recovery, data archives, data lakes for analytics, and hybrid cloud storage. Amazon S3 has various features you can use to organize and manage your data in ways that support specific use cases, enable cost efficiencies, enforce security, and meet compliance requirements. 

Data is stored as objects within resources called “buckets”, and a single object can be up to 5 terabytes in size. S3 features include capabilities to append metadata tags to objects, move and store data across the S3 Storage Classes, configure and enforce data access controls, secure data against unauthorized users, run big data analytics, monitor data at the object and bucket levels, and view storage usage and activity trends across your organization. Objects can be accessed through S3 Access Points or directly through the bucket hostname.

### Implementation steps

We follow the following steps to upload data from S3 for this use case:

1. Login into your AWS account.
2. Open [S3 console](https://s3.console.aws.amazon.com/s3/buckets?region=us-east-1).
3. Go to Buckets in the left pane.
4. Click on the 'Create bucket' button on right.
5. Give a bucket name, this name should be unique across all AWS, we have used 'big-data-trends-mkt-team-10-2023'.
6. Keep all default settings and click on 'Create bucket'.
7. Click on Buckets in the navigation pane again. There is a bucket created with the name above. Click on the name for this bucket.
8. Now we create a folder in the bucket to store the data. Click on create folder, and give the name 'input'. Keep all settings default for the folder and proceed. In this folder, create a folder named 'parquet'.
9. There are multiple ways to upload data in this folder. For this project, we first manually downloaded a single parquet file for the category Apparel from the S3 bucket [amazon-reviws-pdf](https://s3.console.aws.amazon.com/s3/buckets/amazon-reviews-pds?region=us-east-1&tab=objects) on our local machine. Then we upload the same in our S3 folder using the Upload file button.
10. We now have our raw data on S3.

**References**
1. https://aws.amazon.com/s3/features/

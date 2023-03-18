## AWS GLUE

Preparing data to obtain quality results is the first step in an analytics or ML project. 
AWS Glue is a serverless data integration service that makes it easier to discover, prepare, move, 
and integrate data from multiple sources for analytics, machine learning (ML), and application development. 
Users can discover and connect to over 70 diverse data sources, manage your data in a centralized data catalog, 
and visually create, run, and monitor ETL pipelines to load data into your data lakes.

**Key components of GLUE:**
* GLUE Data Catalog
* GLUE Crawler
* GLUE Job

## AWS GLUE Data Catalog

Databases are used to organize metadata tables in the AWS Glue. When a table is defined in the AWS Glue Data Catalog, it is added to a database.
Databases can contain tables that define data from many different data stores. This data can include objects in Amazon Simple Storage Service (Amazon S3) and relational tables in Amazon Relational Database Service.

The AWS Glue Data Catalog contains references to data that is used as sources and targets of extract, transform, and load (ETL) jobs in AWS Glue. It is an index to the location, schema, and runtime metrics of user data, wherein the information in the Data Catalog is used to create and monitor ETL jobs. This information is stored as metadata tables, where each table specifies a single data store. 
Typically, a crawler is used to take inventory of the data in data stores, but there are other ways to add metadata tables into Data Catalog.

## AWS GLUE Crawler

Crawlers are needed to analyze data in specified s3 location and generate/update Glue Data Cataloga. In other words it persists information
about physical location of data, its schema, format and partitions which makes it possible to query actual data or to load it in Glue jobs.

Following architecture shows how GLUE Data catalog and crawler interact as part of the GLUE job.

## AWS GLUE Job

An AWS Glue job encapsulates a script that connects to source data, processes it, and then writes it out to data target. Typically, a job runs extract, transform, and load (ETL) scripts. Jobs can also run general-purpose Python scripts (Python shell jobs.) AWS Glue triggers can start jobs based on a schedule or event, or on demand. Users can monitor job runs to understand runtime metrics such as completion status, duration, and start time.

![plot](Images/PopulateCatalog-overview.png)

## Implementation Steps

1. Go to [AWS Glue Console](https://us-east-1.console.aws.amazon.com/glue/home?region=us-east-1#/v2/home).
2. We start by creating Connections to our data stores: S3 and Redshift.
    * Go to Connection in the left navigation pane. This will open up a new new window for Glue Studio.
    * Under Connections, click on Create connection.
    * We first create an S3 connection. Give a connection name. In Connection type, select Network. Under Network options select default VPC, a subnet associated with the VPC (can be viewed in AWS VPC) and the default security group. Click Create connection.
    * For Redshift Connection, again click on Create connections. Give a connection name, give type JDBC.
    * Go to redshift cluster and copy JDBC URL. Paste in the required input box.
    * In Username and Password, enter the credentials used when creating Redshift cluster.
    * Select the same settings as the S3 connector for Network options and click on Create connection.
    * Both these connections can be tested using the legacy connections pages under Legacy pages. Select the connection, click on Test Connection, select the Glue Service IAM role and click on Test.
3. We now create Glue crawlers for S3 and to update our Glue Data Catalog.
    * Go to crawlers in the left navigation pane.
    * Click on Create crawler.
    * We first create a crawler for S3. Give a name, and click on Next. In Data Sources, click on Add a data source.
    * Select Data source as S3, network connection as the one created above for S3, give S3 path as the S3 URI (can be copied from S3 console) to the parquet folder containing the input data. Click on create Data source. Click on Next.
    * Select the AWS Glue Service Role created earlier in IAM role. Click Next.
    * Click on Add Database and give a name for new database and click create in the new window. If you have a database, select the same instead of creating one.
    * Click on Next and Create crawler.
    * Select the crawler and run it. A table should be created in Glue Data Catalog. Go to tables to check.
    * Come back to crawler window and start creating another one for Redshift.
    * Give a name, click next, add data source. Select JDBC as data source. Select network connection as the one created above for Redshift, path for Redshift table created in previous steps (reviews/data/amazon_reviews_parquet) and click on Add data source. 
    * For IAM role, select AWS Glue Service Role. Click Next.
    * Select Target database (can be the one used above or create a new database).
    * Click on Next and Create crawler.
    * Select the crawler and run it. A table should be created in Glue Data Catalog. Go to tables to check.
4. Creation of Glue job
    * Click on Jobs on Glue home page.
    * In Create job select Visual with a source and target. In source both source and target select AWS Glue Data Catalog and click on Create.
    * An untitled job will be created. In Visual tab, click on Data Source node. On the right side, select the database and table created by the S3 crawler under Data source properties - Data Catalog.
    * Do the same for target node, but for Redshift table.
    * Now go to Job details tab. Give the job a name. Select the AWS Glue Service role under IAM role. In Advanced properties, under connections, check if there is Redshift connection created earlier.
    * Click on Save on right side of the page.
    * Click on Run. The runs can be monitored in Runs tab of the job.

*References:*  
https://docs.aws.amazon.com/glue/latest/dg/catalog-and-crawler.html  
https://stackoverflow.com/questions/53608650/what-does-an-aws-glue-crawler-do  
https://docs.aws.amazon.com/glue/latest/dg/add-job.html

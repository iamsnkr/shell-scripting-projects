**AWS Resource Tracker Script**

This script retrieves information about various AWS resources and logs it to a file named aws_resourceTracker.

**Requirements:**

Bash shell (tested on Ubuntu 22.04 LTS)
AWS CLI (version 2) configured with appropriate credentials
Installation:

Save the script as aws_resource_tracker.sh.
Make the script executable: chmod +x aws_resource_tracker.sh
Optionally, set up AWS CLI credentials (refer to AWS documentation for details).
**Usage:**

```Bash
./aws_resource_tracker.sh
```

**Output:**

The script will generate a file named aws_resourceTracker in the current directory, containing information about:

Date and time the script was run
List of S3 buckets
List of EC2 instance IDs in the ap-south-1 region (warning: region-specific)
List of IAM users
List of Lambda functions in the ap-south-1 region (warning: region-specific)

**Regular Updates:** AWS services and the AWS CLI evolve over time. It's recommended to periodically review and update the script to ensure compatibility with the latest versions.

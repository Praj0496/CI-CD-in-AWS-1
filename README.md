### Project Description: CI/CD Pipeline for Code Deployment Using AWS Services

#### Summary:
This project demonstrates the implementation of a CI/CD pipeline using AWS services to automate the deployment of HTML website to an EC2 instance. The process involves creating IAM roles, setting up an EC2 instance, configuring CodeDeploy and CodePipeline, and linking a Codecommit repository for seamless code deployment and updates.

#### Steps Involved:

1. **Create IAM Roles:**
   - Create two IAM roles:
     - **EC2 Role:** Grants the EC2 instance permissions to deploy code.              (`Policy name: AmazonEC2RoleforAWSCodeDeploy`)
     - **CodeDeploy Role:** Grants CodeDeploy permissions to access AWS resources for deployment. (`Policy name: AWSCodeDeployRole`)

2. **Set Up EC2 Instance:**
   - Launch an EC2 instance with Amazon Linux (`Ubuntu Server 22.04 LTS`).
   - Attach the EC2 IAM role created in step 1.
   - Configure security groups to allow HTTP and SSH access.

3. **Configure AWS CodeDeploy:**
   - Create a CodeDeploy application and a deployment group that includes the created EC2 instances.
   - Attach the CodeDeploy IAM role to the deployment group.
   - Set the deployment type to "All at once" for simplicity.

4. **Set Up AWS CodePipeline:**
   - Create a new pipeline in AWS CodePipeline.
   - Connect the pipeline to thr AWS CodeCommit repository.
   - Configure the pipeline to fetch the latest code from the specified branch (`master`).
   - Skip the build stage for simplicity, focusing on deployment.

5. **Source Code Management with AWS CodeCommit:**
   - Store the source code for the HTML website in an AWS CodeCommit repository.
   - Ensure the repository is linked to the CodePipeline for automated code fetching.

6. **Deployment Process:**
   - Upon any code commit to the specified branch in the AWS CodeCommit repository, the pipeline   triggers the deployment process.
   - CodePipeline fetches the latest code and triggers CodeDeploy to deploy it to the EC2 instance.

7. **Testing the Deployment:**
   - Modify the code in the AWS CodeCommit repository and commit the changes.
   - Observe the pipeline fetching the latest code and deploying it to the EC2 instance.
   - Verify the changes by accessing the public IP of the EC2 instance.

#### Key Configuration Files:

- **appspec.yml:**
  ```yaml
  version: 0.0
    os: linux
    files:
    - source: /
    destination: /var/www/html/
    hooks:
    BeforeInstall:
    - location: scripts/clean_old_files.sh
      timeout: 300
      runas: root
    - location: scripts/install_dependencies.sh
      timeout: 300
      runas: root
    ApplicationStart:
    - location: scripts/start_server.sh
      timeout: 300
      runas: root
    ApplicationStop:
    - location: scripts/stop_server.sh
      timeout: 300
      runas: root
  ```

- **Scripts:**
  - `install_dependencies.sh`: Installs necessary dependencies.
  - `change_permissions.sh`: Sets required permissions
  - `clean_old_files.sh`: Removes existing files from destination directory.
  - `start_server.sh`: Starts the web server.
  - `stop_server.sh`: Stops the web server.

#### Conclusion:
This project showcases the creation of a fully automated CI/CD pipeline using AWS services. By leveraging IAM roles, EC2 instances, CodeDeploy, and CodePipeline, we achieve seamless code deployment and updates, reducing manual intervention and enhancing deployment efficiency.

**Note:** The CodeDeploy agent has been tested on the following Amazon EC2 AMI operating systems:

+ Amazon Linux 2023 (ARM, x86)
+ Amazon Linux 2 (ARM, x86)
+ Microsoft Windows Server 2022, 2019
+ Red Hat Enterprise Linux (RHEL) 9.x, 8.x, 7.x
+ Ubuntu Server 22.04 LTS, 20.04 LTS, 18.04 LTS, 16.04 LTS
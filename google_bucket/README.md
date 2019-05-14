# Setup

Don't forget to place the file ```account.json``` inside the ```credentials``` dir in the root directory before running which would contain your service ```Account Key```  file.

This contains your authentication required for Terraform to talk to the Google API.

You can get it under
```
Google Cloud Platform -> API Manager -> Credentials -> Create Credentials -> Service account key.
```
For the Key type field chose JSON. Put the downloaded file right were your Terraform config file is and name it ```account.json```.

If you are using the gcs as the backend, you will need to give it the ```Storage Admin``` role for the ```storage.buckets.create``` permission.

# In order to do so we are going to create four files:

```main.tf``` -- contains the definition of what we want to achieve

```variables.tf``` -- contains the variables definition.

```config.tfvars``` -- contains the values for variables.



# Variables

```variables.tf``` holds the definition of the elements that can be configured in your
deployment script.


From now on every time you run a ```terraform``` commands ##{plan|apply|destroy|...}## you will need to provide the required variables. Without further information ```terraform``` will enter an interactive mode requesting each variables one by one at the prompt.

If you do not want to set these values on every run you can create a file called ```config.tfvars```

# Architecture

Now that we know what we want to build and also how we want to parametrize our script we are ready to build the ```main.tf```  The code snippets below are extracted from this file.




# Initialize working directory.

The first command that should be run after writing a new Terraform configuration is the terraform init command in order to initialize a working directory containing Terraform configuration files. It is safe to run this command multiple times.
```
terraform init
```
# Configure  storage bucket name.

You must modify the Google Cloud Storage bucket name, region,namespace and environment  which is defined as an input variable bucket_name in variables.tf file.


Run command:

```terraform plan -var-file=config.tfvars```   Displays what would be executed

# Deploy the changes.

Run command:

```terraform apply  -var-file=config.tfvars```    Applies the changes

Test the deploy.

When the ```terraform apply``` command completes, use the ```Google Cloud console```, you should see the new ```Google Storage bucket``` created in the ```Google Cloud Project```.

And folder

# Listing Bucket Details

If you want to see information about the bucket itself, use the ```-b``` option. For example:
```
gsutil ls -L -b gs://bucket
```


### One closing note 

Don't forget to tear down your cluster when you are done experimenting with ```terraform destroy``` to avoid a surprise bill at the end of the month :)

Clean up the resources created.

When you have finished, run command:

```terraform destroy -var-file=config.tfvars```     Wipes out what have been created

---
layout: post
title: Setting up continuous delivery with AWS EC2 Container Registry
category: Docker
---

[Amazon EC2 Container Registry](https://aws.amazon.com/ecr/) is a
container registry for the deployment, storage and management of Docker images.
It comes from the family of [Amazon Web Services (AWS)](https://aws.amazon.com/),
so you can access it with your Amazon account if you already have one.
If you don't have an account, you can sign up [here](https://portal.aws.amazon.com/gp/aws/developer/registration/index.html).

Integrating your **Semaphore account** with the **Amazon EC2 Container Registry
(ECR)** is quick and straightforward. It will only take a couple of minutes of
your time.

Container registry integrations are available as project add-ons for all
Semaphore projects that are set up to use **Docker**. For more information on
how to set up a Docker project on Semaphore, read our documentation page on
[setting up continuous integration for a Docker project on Semaphore](/docs/docker/setting-up-continuous-integration-for-docker-project.html).

Configuring the Amazon EC2 Container Registry (ECR) project add-on will enable
you to **push** and **pull** your images without having to log into ECR during
builds and deployments. This can be done by visiting your project on Semaphore
and clicking "Add-ons" in the upper right corner of your screen.

<img src="/docs/assets/img/docker/shared/click-add-ons.png" class="img-responsive img-bordered" alt="Click Project Add-ons">

Next, click "Docker Registry".

<img src="/docs/assets/img/docker/shared/select-docker-registry.png" class="img-responsive img-bordered" alt="Click Docker Registry">

Select the "Amazon EC2 Container Registry (ECR)" integration.

<img src="/docs/assets/img/docker/setting-up-amazon-container-registry-for-your-project/select-amazon-container-registry.png" class="img-responsive img-bordered" alt="Click Amazon Container Registry">

You will be prompted with three input fields, requiring your:

  - `AWS Access Key ID`,
  - `AWS Secret Access Key`, and
  - `AWS Region` - the region where your repository resides.

<img src="/docs/assets/img/docker/setting-up-amazon-container-registry-for-your-project/amazon-container-registry-form.png" class="img-responsive img-bordered" alt="Amazon Container Registry form">

You can find instructions for managing AWS credentials
[in the AWS documentation](http://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html).
It is a good practice to create a new [IAM user](http://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html),
whose purpose will be to interact with Semaphore.

Click "Test & Save". If your credentials are valid, the registry will be saved.
Semaphore encrypts your credentials and stores them securely.

You can now push or pull images from the Amazon Container Registry through
Semaphore.

```
docker push aws_account_id.dkr.ecr.region.amazonaws.com/my-web-app
```

__Note:__
To make a unique image tag, you can combine the [available environment variables](/docs/available-environment-variables.html)
(eg. `my-web-app:$REVISION`).

Happy building!

## Example AWS IAM policy

You can attach `AmazonEC2ContainerRegistryPowerUser` policy for the role that
is interacting with Semaphore. It provides full access to Amazon EC2 Container
Registry repositories, but does not allow repository deletion or policy changes.
`AmazonEC2ContainerRegistryPowerUser` is shown below, but you can also [attach it in AWS console](http://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-using.html#attach-managed-policy-console).

```javascript
{
	"Version": "2012-10-17",
	"Statement": [{
		"Effect": "Allow",
		"Action": [
			"ecr:GetAuthorizationToken",
			"ecr:BatchCheckLayerAvailability",
			"ecr:GetDownloadUrlForLayer",
			"ecr:GetRepositoryPolicy",
			"ecr:DescribeRepositories",
			"ecr:ListImages",
                        "ecr:DescribeImages",
			"ecr:BatchGetImage",
			"ecr:InitiateLayerUpload",
			"ecr:UploadLayerPart",
			"ecr:CompleteLayerUpload",
			"ecr:PutImage"
		],
		"Resource": "*"
	}]
}
```

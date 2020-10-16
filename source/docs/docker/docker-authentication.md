---
layout: post
title: Docker authentication
category: Docker
---

As announced in the [Docker blog post](https://www.docker.com/blog/scaling-docker-to-serve-millions-more-developers-network-egress/), on November 1<sup>st</sup> 2020, Docker Hub will introduce [rate limits](https://docs.docker.com/docker-hub/download-rate-limit/) for public image pulls.  

The rate limits of 100 pulls per 6 hours will apply to anonymous public image pulls, while the authenticated users on a free Docker Hub plan will be able to make up to 200 pulls per 6 hours. Authenticated users with Pro and Team Docker Hub accounts have an unlimited pull rate.  

Exceeding the explained rate limits will disrupt your Semaphore 2.0 workflows and below you can find the recommended steps to avoid it.  

## Will this affect you
Semaphore runs jobs from a shared pool of IPs and anonymous public image pulls are counted based on the IP address.  
This means that if you are pulling images from a public Docker Hub repository as an anonymous user, **your Semaphore jobs will be affected by the new DockerHub rate limit**.  

We want to support you through this transition and help you reduce the impact of the Docker Hub rate limit introduction.  
Feel free to reach out to our support team with any questions that you might have.  

## What should you do to minimize the effect of the rate limit   
If you have a DockerHub account, **to avoid failing jobs, we suggest that you start authenticating** in your Semaphore configuration.  
Docker offers a rate limit of 200 pulls per 6 hours for their free plan accounts and unlimited pulls for Pro and Team Docker Hub accounts.  
Please check instructions on [how to authenticate Docker pulls](#how-to-authenticate-Docker-pulls) in the section below.  

## How can you know if you are hitting the limit  
If you have exceeded the rate limit, Docker will throw the `Too Many Requests` error.  
Check the output of your `docker pull` command in the job log, if you have exceeded the rate limit, the output will be the following:  
```bash
Error pulling image <docker-image-name>: Error response from daemon: toomanyrequests: Too Many Requests.`
```

## How to authenticate Docker pulls  
### Storing your Docker Hub credentials  
The first step is to store your Docker Hub credentials so that you can use them in your project later on.  
There are two ways of doing this:  
- [Enviroment variables](/docs/exporting-environment-variables.html) - defined for a single project, not shared between projects.  
- [Secrets](/docs/secrets.html) - set on the organization level, can be attached to multiple projects.  

**Storing credentials in environment variables**  

- Open the project where you want to use Docker Hub credentials  
- Click on **Project settings** in the top right corner  
- Click on **Enviroment Variables** in the left side menu  
- Click on **+ Add** next to the **Project specific Enviroment Variables**  
- Fill in the form `Name: DOCKER_USERNAME, Content: <your-docker-hub-username>`  
- Click **Create Variable**  
- Repeat the process and add one more variable: `Name: DOCKER_PASSWORD, Content:<your-docker-hub-password>`  
- Remember to select **Encrypt content** checkbox when creating your Docker password variable  

**Storing credentials in secrets**  
To add a secret to your organization, it is necessary to be a member of the organization's owners team or team with the "admin" permission level.  

- Open your organization page on Semaphore  
- Go to the **Secrets** tab  
- Click on the **New Secret** button  
- Fill in the form, enter the name of the secret and optionally a description  
- Click on **+Add first** next to the **Environment Variables**  
- Enter `DOCKER_USERNAME` as a variable name and your Docker Hub username as content, then click on **Save**  
- Click on **+ Add new** next to **Environment Variables**  
- Enter `DOCKER_PASSWORD` as a variable name and your Docker Hub password as content  
- Make sure to select the **Encrypt** checkbox before clicking **Save**  
- Click on **Edit** next to the **No Projects sharing this Secret**  
- Select the projects that you want the secret to be available on and finish editing.  

### Log in to the Docker Hub
After you have stored your Docker Hub credentials, you need to update your project configuration too.  
You want to log into the Docker Hub before running any `docker pull` commands. 

The easiest way to do this is to:  
- Go to your project **Build Settings**  
- Add a new or edit your existing **Setup** job (commands in this job will be executed before each job)  
- Add the following command: `echo $DOCKER_PASSWORD | docker login --username "$DOCKER_USERNAME" --password-stdin`  

## How to check if you are logged in
The `docker login` command will display a **Login Succeeded** message as an output if the authentication was successful. 

Another way to check is to open `~/.docker/config.json` and check the `auths` field. 

If you have been successfully logged in then the `auths` field will be updated accordingly:
```
{
	"auths": {
		"https://index.docker.io/v1/": {....
    }
```

If you are not logged in, the `auths` field will be empty:
```
{
	"auths": {},
```

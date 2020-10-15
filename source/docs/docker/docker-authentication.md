---
layout: post
title: Docker authentication
category: Docker
---

# Docker Hub authentication

As announced in the [Docker blog post](https://www.docker.com/blog/scaling-docker-to-serve-millions-more-developers-network-egress/), on November 1<sup>st</sup> 2020, Docker Hub will introduce [rate limits](https://docs.docker.com/docker-hub/download-rate-limit/) for public image pulls.  

The rate limits of 100 pulls per 6 hours will apply to anonymous public image pulls, while the authenticated users on a free Docker Hub plan will be able to make up to 200 pulls per 6 hours. Authenticated users with Pro and Team Docker Hub accounts have unlimited pull rate.  

Exceeding the explained rate limits will cause a disruption in your Semaphore 2.0 workflows and below you can find the recommended steps in order to avoid it.  

## Will this affect you
Semaphore runs jobs from a shared pool of IPs and anonymous public image pulls are counted based on the IP address.  
This means that if you are pulling images from a public Docker Hub repository as an anonymous user, **your Semaphore jobs will be affected by the new DockerHub rate limit**.  

We want to support you through this transition and help you reduce the impact of the Docker Hub rate limit introduction.  
Feel free to reach out to our support team with any questions that you might have.  

## What should you do to minimize the effect of the rate limit  
If you have a DockerHub account, **to avoid failing jobs we suggest that you start authenticating your pulls** in your Semaphore configuration.  
Docker offers a rate limit of 200 pulls per 6 hours for their free plan accounts and unlimited pulls for Pro and Team Docker Hub accounts.  
Please check instructions on [how to authenticate Docker pulls](#how-to-authenticate-Docker-pulls) in the section below.  

## How can you know if you are hitting the limit
If you have exceeded the rate limit Docker will throw the `Too Many Requests` error.  
In the job log check the output of your `docker pull` command, if you have exceeded the rate limit output will be the following:  
```bash
Error pulling image [DOCKER IMAGE NAME]: Error response from daemon: toomanyrequests: Too Many Requests.`
```

## How to authenticate Docker pulls

---
layout: post
title: Use a self-signed certificate with private Docker registry
category: Docker
---

If you have a private Docker registry, which is using a self-signed SSL certificate, so pulling the Docker images does not work, the solution is to use a self-signed certificate with Docker, add a [self-signed certificate file as a configuration file on Semaphore](docs/adding-configuration-files.html) and save it under the name of **domain.crt**.

Then, following command should be present in the setup of your project:

```bash
sudo mv $SEMAPHORE_PROJECT_DIR/domain.crt /etc/docker/certs.d/myregistrydomain.com:5000/ca.crt
```

This should allow connection to a private remote registry with the use of the self-signed certificate.

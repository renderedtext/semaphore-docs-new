---
layout: post
title: Sharing build configurations across multiple projects
category: Customizing your build
---

Every project can be configured with
[environment variables](/docs/exporting-environment-variables.html)
and
[configuration files](/docs/adding-custom-configuration-files.html).
If you want to share environment variables and configuration files between two
or more projects, your organization can set up a shared configuration and
attach it to multiple projects.

A _shared configuration_ is a collection of environment variables and
configuration files in an organization that can be shared between projects.

An ideal workflow for shared configurations is for an admin in the
organization to set up several configurations containing organization wide
secrets necessary for building your projects. Once the shared
configurations are set up, admins and owners can share it with their teams.

For example, if you have have a set of environment variables (`AWS_ACCESS_KEY_ID`,
`AWS_SECRET_ACCESS_KEY`) for accessing a your resources on AWS, you can create a
shared configuration called `AWS Access Keys`.

To use entries from the shared configuration, you need to add it to your teams
and to attach it to your project.

### Creating a shared configuration and adding it to your teams

Any admin or owner in your organization can create a shared configuration, and
fill it environment variables and configuration files. When created, the shared
configuration is added to the owners team only.

Following this, admins and owners in the organization can add the shared
configuration to their teams to allow non-admin users to use it on their projects.

### Using a shared configuration in your project

To use a shared configuration in your project, you must be a member of a team
that has the shared configuration.

To use the entries from the shared configuration in your projects, you need to
attach the shared configuration to your project, and select the environment
variables you want to use from the shared configuration.

## Setting up a shared configuration via API v2

First, you need to find your API credentials to access your organization via the
API.  You can find your API credentials at the bottom of your your
[users settings page](https://semaphoreci.com/users/edit). To learn more about
API authentiacation read the [API v2 authentiacation guide](/docs/api-v2-overview.html#authentication).

``` bash
export AUTH_TOKEN=<token>
```

With the authorization token in place, let's continue by
[creating a shared configuration in our organization](/docs/api-v2-shared-configs.html#create-shared-configuration-in-an-organization). For this, you will need to
 be either an admin or an owner in your organization.

``` bash
export ORG_USERNAME=<org_name>
export SHARED_CONFIG_NAME=<shared_config_name>

curl -X POST \
     -H "Authorization: Token ${AUTH_TOKEN}" \
     -d "{ \"name\" : \"${SHARED_CONFIG_NAME}\" }" \
     "https://api.semaphoreci.com/v2/orgs/${ORG_USERNAME}/shared_configs"

# Store the returned `id` in an environment variable:

export SHARED_CONFIG_ID=<shared_config_id>
```

### Adding entries to the shared configuration

You can add environment variables and configuration files to your shared
configuration.

To [add an environment variables to the configuration](/docs/api-v2-env-vars.html#create-environment-variable-within-a-shared-configuration):

``` bash
export ENV_VAR_NAME=<name>
export ENV_VAR_CONTENT=<content>

curl -X POST \
     -H "Authorization: Token ${AUTH_TOKEN}" \
     -d "{ \"name\" : \"${ENV_VAR_NAME}\" , \"content\" : \"${ENV_VAR_CONTENT}\" }" \
     "https://api.semaphoreci.com/v2/shared_configs/${SHARED_CONFIG_ID}/env_vars"
```

To [add a configuration file to the configuration](/docs/api-v2-config-files.html#create-a-config-file-within-a-shared-configuration):

``` bash
export FILE_PATH=<path>
export FILE_CONTENT=<content>

curl -X POST \
     -H "Authorization: Token ${AUTH_TOKEN}" \
     -d "{ \"path\" : \"${FILE_PATH}\" , \"content\" : \"${FILE_CONTENT}\" }' \
     "https://api.semaphoreci.com/v2/shared_configs/${SHARED_CONFIG_ID}/config_files"
```

### Adding shared configuration to your teams

Before we can use the shared configuration in projects, we need to add them to
our teams so that our team members can use them.

Let's [find the team's id](/docs/api-v2-teams.html#list-teams-in-an-organization), and [connect the shared configuration with the team](/docs/api-v2-shared-configs.html#add-a-shared-configuration-to-a-team):

``` bash
# List teams in our organization

curl -X GET \
     -H "Authorization: Token ${AUTH_TOKEN}" \
     "https://api.semaphoreci.com/v2/orgs/${ORG_USERNAME}/teams"

# Connect the shared configuration with our team

export TEAM_ID=<team_id>

curl \
 -X POST \
 -H "Authorization: Token ${AUTH_TOKEN}" \
 "https://api.semaphoreci.com/v2/teams/${TEAM_ID}/shared_configs/${SHARED_CONFIG_ID}"
```

## Using shared configurations in projects

Continuing with the previous setup, any member of the team can add the shared
configuration to his projects. As a team member, you can [attach the shared
configuration to a project](/docs/api-v2-shared-configs.html#attach-a-shared-configuration-to-a-project) and [use the provided environment variables](/docs/api-v2-env-vars.html#connect-a-shared-environment-variable-to-a-project):

``` bash
# First, we find the id of the project

export PROJECT_NAME=<project_name>

curl \
 -X GET \
 -H "Authorization: Token ${AUTH_TOKEN}" \
 "https://api.semaphoreci.com/v2/orgs/${ORG_USERNAME}/project?name=${PROJECT_NAME}"

# Store the id of the project

export PROJECT_ID=<project_id>

# Connect the shared configuration to the project

curl \
 -X POST \
 -H "Authorization: Token ${AUTH_TOKEN}" \
 "https://api.semaphoreci.com/v2/projects/${PROJECT_ID}/shared_configs/${SHARED_CONFIG_ID}"

# Use the environment variable provided by the attached shared configuration

curl \
  -X GET \
  -H "Authorization: Token ${AUTH_TOKEN}" \
  "https://api.semaphoreci.com/v2/shared_configs/${SHARED_CONFIG_ID}/env_vars"

export ENV_VAR_ID=<env_var_id>

curl \
 -X GET \
 -H "Authorization: Token ${AUTH_TOKEN}" \
 "https://api.semaphoreci.com/v2/projects/${PROJECT_ID}/env_vars/${ENV_VAR_ID}"
```

After this step, you should see the attached environment variable on your
project.

![Shared Environment Variables](/docs/assets/shared-configurations/env-vars.png)

The next build on our project will include the connected environment variable.

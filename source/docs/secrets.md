---
layout: post
title: Secrets
category: Customizing your build
---

This document describes all the ways you can set up and manage secrets for your
organization. It covers topics:

- [What is a secret?](#what-is-a-secret)
  - [Example use of a secret](#example-use-of-a-secret)
  - [Needed permissions](#needed-permissions)
  - [Using a secret in your project](#using-a-secret-in-your-project)
- [Setting up a secret via UI](#setting-up-a-secret-via-ui)
  - [Creating a secret](#creating-a-secret)
  - [Editing a secret](#editing-a-secret)
  - [Deleting a secret](#deleting-a-secret)
  - [Managing secret's entries](#managing-secrets-entries)
      - [Adding an Environment Variables to the secret](#adding-an-environment-variable-to-the-secret)
      - [Editing and deleting an Environment Variable from the secret](#editing-and-deleting-an-environment-variable-from-the-secret)
      - [Adding a Configuration Files to the secret](#adding-a-configuration-file-to-the-secret)
      - [Editing and deleting an Configuration File from the secret](#editing-and-deleting-a-configuration-file-from-the-secret)
      - [Attaching and detaching the secret from a Team](#attaching-and-detaching-the-secret-from-a-team)
      - [Attaching and detaching the secret from a Project](#attaching-and-detaching-the-secret-from-a-project)
- [Setting up a secret via API](#setting-up-a-secret-via-api-v2)
  - [Creating a secret via API](#creating-a-secret-via-api)
  - [Adding entries to the secret](#adding-entries-to-the-secret)
  - [Adding secret to your teams](#adding-secret-to-your-teams)
  - [Using secrets in projects](#using-secrets-in-projects)
- [Viewing attached entries in the Project Settings](#viewing-attached-entries-in-the-project-settings)

## What is a secret?

Every project can be configured with
[environment variables](/docs/exporting-environment-variables.html)
and
[configuration files](/docs/adding-configuration-files.html).
If you want to share environment variables and configuration files between two
or more projects, your organization can set up a secret and
attach it to multiple projects.

A _secret_ is a collection of environment variables and
configuration files in an organization that can be shared between projects.

### Example use of a secret

If you have have a set of environment variables (`AWS_ACCESS_KEY_ID`,
`AWS_SECRET_ACCESS_KEY`) for accessing a your resources on AWS, you can create
a secret called `AWS Access Keys`. Then, you can share that secret across the
teams that need to access the same resources.

Idea of a secret is to minimize duplication of environment variables and
configuration files across your teams and projects.

### Needed permissions

An ideal workflow for secrets is for a person with
["admin" or "owner" permission
level in the organization](/docs/organizations/permission-levels-in-an-organization.html)
to set up several organization wide secrets necessary for building your
projects. Once the secrets are set up, members of the "admin" and "owner" teams
can share them with other teams.

To use entries from the secret, you need to add it to your teams
and to attach it to your project.

To read more about permission level of a team inside the organization, go to
[Permission levels in an organization](/docs/organizations/permission-levels-in-an-organization.html)


### Using a secret in your project

To use a secret in your project, you must be a member of a team
that has the secret.

To use the entries from the secret in your projects, you need to attach the
secret to your project. Once attached, all entries will be included in your
project.

## Setting up a secret via UI

In order to add a secret to your organization, it is necessary to be a member
of the organization's owners team, or team with the "admin" permission level.
You can perform these actions on the secret:

- [Creating a secret](#creating-a-secret)
- [Editing a secret](#editing-a-secret)
- [Deleting a secret](#deleting-a-secret)
- [Managing secret's entries](#managing-secrets-entries)

### Creating a secret

Once you've obtained proper permission to add a secret, visit your organization
page on Semaphore, and go to "Secrets" tab. To add a new secret, click "New
Secret" button on the organization "Secrets" tab. You can fill in:

 - Secret name, and,
 - Secret description.

After, click "Create Secret". This will create a secret that can be shared
across your organization. Newly created secret is automatically added to the
"Owners" team of your organization.

### Editing a secret

To change secret name and description, click on "Settings" button next to the
secret name and description. Then you will see a form where you can change
name and description. Once finished with editing, click "Save Changes" button.

You should see your edited secret at the top of the listed secrets.

Note that Semaphore sorts secrets by the time they were updated at.

### Deleting a secret

To delete a secret, click on "Settings" button next to the secret name and
description. Then, in the bottom right part of the box, click the "Delete"
button. You will see a deletion confirmation dialog.

If you've attached your secret to a certain project, Semaphore will warn you
from which projects the secret will be deleted. If you agree with these
changes, confirm deletion by clicking "Delete".

After you've confirmed deletion, you shouldn't see the secret listed.

### Managing secret's entries

Since secret is a collection of environment variables and configuration files
that can be shared across organization's projects, these
actions are available in the user interface:

- [Adding an Environment Variables to the secret](#adding-an-environment-variable-to-the-secret)
- [Editing and deleting an Environment Variable from the secret](#editing-and-deleting-an-environment-variable-from-the-secret)
- [Adding a Configuration Files to the secret](#adding-a-configuration-file-to-the-secret)
- [Editing and deleting an Configuration File from the secret](#editing-and-deleting-a-configuration-file-from-the-secret)
- [Attaching and detaching the secret from a Team](#attaching-and-detaching-the-secret-from-a-team)
- [Attaching and detaching the secret from a Project](#attaching-and-detaching-the-secret-from-a-project)

#### Adding an Environment Variable to the secret

Once the secret is created, you can add an environment variable to it. You can
do that by clicking "+ Add first" link next to the Environment Variables title
(if there were some environment variables, the link text would be "+ Add new").

After you click the link, a form for the new environment variable will be
shown. Environment variable has a name, content and an option to encrypt
it's content.

When you're finished with filling in the form, click "Save", and the new
environment variable should be added to the secret.

#### Editing and deleting an Environment Variable from the secret

Note that you can only edit environment variable that hasn't been encrypted. If
the environment variable has been encrypted, it can only be deleted and then
readded.

In order to edit an unencrypted environment variable, click "Edit" link next to
the environment variable. You should then see a form similar to the one when
adding an environment variable. After making changes, click "Save". Your
changes should be reflected in the interface.

To delete an environment variable, click "Delete" link next to the environment
variable. You will be asked to confirm the delete action, and you can do that
by clicking "Yes, delete." button. After clicking, you should not see the
environment variable in the list.

#### Adding a Configuration File to the secret

To add a configuration file to a secret, click "+ Add first" next to the
Configuration Files title (if there were some configuration files, the link
text would be "+ Add new").

Form for a new configuration file will be shown where you can fill in file
path, content and choose whether the content will be encrypted or not.

After you've filled in the form, click "Save" and the new configuration file
should be added to the secret.

#### Editing and deleting a Configuration File from the secret

Please note that only configuration files that were not encrpyted can be edited.

To edit an unencrypted configuration file, click "Edit" next to the
configuration file.  Form similar to the one when adding a configuration file
should be shown. To save the changes you've made, click "Save".

To delete a configuration file, click "Delete" link next to the configuration
file. Then, click "Yes, delete." and you shouldn't see the configuration file
anymore.

#### Attaching and detaching the secret from a Team

To attach a secret to a team, click "Edit permission" next to
"Who can see and edit this?" title.

Once clicked, there should be a list of teams. In order to attach a secret to a
team, you need to check a box next to the team name. You will see a 'Saved.'
message once the secret is attached.

To detach the secret from a team, you will need to uncheck the box next to the
team name. 'Saved.' message should show once the secret is detached.

Note that you can only see teams that are available to you.

#### Attaching and detaching the secret from a Project

In order to attach a secret to a project, click "Edit" next to
"Projects sharing this Secret" title.

Once "Edit" is clicked, you should see a list of projects that belong to your
organization. In order to attach a secret to a project, you need to check a box
next to the project name. You will see a short 'Saved.' message once the secret
is attached.

To detach the secret from a project, you will need to uncheck the box next to
the project name. Once the secret is detached, you will see a 'Saved' message.

## Setting up a secret via API v2

First, you need to find your API credentials to access your organization via the
API.  You can find your API credentials at the bottom of your your
[users settings page](https://semaphoreci.com/users/edit). To learn more about
API authentication read the [API v2 authentication guide](/docs/api-v2-overview.html#authentication).

``` bash
export AUTH_TOKEN=<token>
```

### Creating a secret via API

With the authorization token in place, let's continue by
[creating a secret in our organization](/docs/api-v2-secrets.html#create-secret-in-an-organization). For this, you will need to
 be either an admin or an owner in your organization.

``` bash
export ORG_USERNAME=<org_name>
export SECRET_NAME=<secret_name>

curl -X POST \
     -H "Authorization: Token ${AUTH_TOKEN}" \
     -d "{ \"name\" : \"${SECRET_NAME}\" }" \
     "https://api.semaphoreci.com/v2/orgs/${ORG_USERNAME}/secrets"

# Store the returned `id` in an environment variable:

export SECRET_ID=<secret_id>
```

### Adding entries to the secret

You can add environment variables and configuration files to your secret.

To [add an environment variables to the secret](/docs/api-v2-env-vars.html#create-environment-variable-within-a-secret):

``` bash
export ENV_VAR_NAME=<name>
export ENV_VAR_CONTENT=<content>

curl -X POST \
     -H "Authorization: Token ${AUTH_TOKEN}" \
     -d "{ \"name\" : \"${ENV_VAR_NAME}\" , \"content\" : \"${ENV_VAR_CONTENT}\" }" \
     "https://api.semaphoreci.com/v2/secrets/${SECRET_ID}/env_vars"
```

To [add a configuration file to the secret](/docs/api-v2-config-files.html#create-a-config-file-within-a-secret):

``` bash
export FILE_PATH=<path>
export FILE_CONTENT=<content>

curl -X POST \
     -H "Authorization: Token ${AUTH_TOKEN}" \
     -d "{ \"path\" : \"${FILE_PATH}\" , \"content\" : \"${FILE_CONTENT}\" }' \
     "https://api.semaphoreci.com/v2/secrets/${SECRET_ID}/config_files"
```

### Adding secret to your teams

Before we can use the secret in projects, we need to add them to
our teams so that our team members can use them.

Let's [find the team's id](/docs/api-v2-teams.html#list-teams-in-an-organization), and [connect the secret with the team](/docs/api-v2-secrets.html#add-a-secret-to-a-team):

``` bash
# List teams in our organization

curl -X GET \
     -H "Authorization: Token ${AUTH_TOKEN}" \
     "https://api.semaphoreci.com/v2/orgs/${ORG_USERNAME}/teams"

# Connect the secret with our team

export TEAM_ID=<team_id>

curl \
 -X POST \
 -H "Authorization: Token ${AUTH_TOKEN}" \
 "https://api.semaphoreci.com/v2/teams/${TEAM_ID}/secrets/${SECRET_ID}"
```

### Using secrets in projects

Continuing with the previous setup, any member of the team can add the
secret to his projects. As a team member, you can [attach the secret
to a project](/docs/api-v2-secrets.html#attach-a-secret-to-a-project) and use the provided environment variables from secret:

``` bash
# First, we find the id of the project

export PROJECT_NAME=<project_name>

curl \
 -X GET \
 -H "Authorization: Token ${AUTH_TOKEN}" \
 "https://api.semaphoreci.com/v2/orgs/${ORG_USERNAME}/project?name=${PROJECT_NAME}"

# Store the id of the project

export PROJECT_ID=<project_id>

# Connect the secret to the project

curl \
 -X POST \
 -H "Authorization: Token ${AUTH_TOKEN}" \
 "https://api.semaphoreci.com/v2/projects/${PROJECT_ID}/secrets/${SECRET_ID}"
```

After this step, you should see the attached environment variable on your
project.

The next build on our project will include the connected environment variable.

## Viewing attached entries in the Project Settings

After you've added a secret to a project, you can view what has been added to
the project in the Project Settings.

You can visit the project where you attached the secret and go into Project
Settings -> Environment Variables to see which environment variables are added
to your project.

You can visit the project where you attached the secret and go into Project
Settings -> Configuration Files to see which configuration files are added to
your project.

Each time you add or remove a secret from a project, project's Environment
Variables and Configuration Files tabs will reflect the change.

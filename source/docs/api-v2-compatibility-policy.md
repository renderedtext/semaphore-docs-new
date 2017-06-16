---
category: API v2
layout: post
title: API v2 Compatibility Policy
---

This article describes Semaphore’s commitment to compatibility
for services built for the Semaphore API v2. It also describes
how we introduce changes to the API and how those changes are communicated.

Changes to the API will be communicated on
[Semaphore's changelog](https://semaphoreci.com/renderedtext/semaphore/changelog)
or on [Semaphore's blog](http://semaphoreci.com/blog/)

Within any given version of the API, any given resource
(eg. /orgs, /teams) has a specified level of stability. The
stability of a resource documented and displayed on the resource's
documentation page. The stability of a resource specifies what
changes (if any) Semaphore will make to the resource.

There are three levels of stability:

- prototype
- development
- production

#### Prototype

A prototype resource is experimental and major changes are likely. In
time, a prototype resource may or may not advance to production.

- Compatible and emergency changes may be made with no advance notice
- Disruptive changes may be made with no prior notice

#### Development

A development resource is a work-in-progress, but major changes should
be infrequent. Development resources should advance to production
stability in time.

- Compatible and emergency changes may be made with no advance notice
- Disruptive changes may be made with one month notice

#### Production

A production resources is complete and major changes will no longer occur.

- Compatible and emergency changes may be made with no advance notice
- Disruptive changes may not occur, instead a new major version is developed

## Types of changes

#### Compatible change

Small in scope and unlikely to break or change semantics of existing methods.

- Adding nested resources, methods and attributes
- Change of documentation
- Change of undocumented behavior

#### Disruptive change

May have larger impact and effort will be made to provide migration paths
as needed.

- Change semantics of existing methods
- Remove resources, methods and attributes

#### Emergency change

May have larger impact, but are unavoidable due to legal compliance, security
vulnerabilities or violation of specification.

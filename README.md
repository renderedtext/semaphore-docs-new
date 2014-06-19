# Semaphore Docs

Semaphore Docs, powered by [Middleman](http://middlemanapp.com) and Amazon S3.


## Setup

Clone the repo and install all necessary gems with

```
$ git clone git@github.com:renderedtext/semaphore-docs-new.git
$ bundle install --path .bundle
```


## Writing

Pages are stored in `source/docs/`.

To view the blog locally run:

```
./server
```

which actually runs

```
$ bundle exec middleman -p 4000
```

Now you can open [http://localhost:4000/docs](http://localhost:4000/docs).

### Embedding images

There's a helper defined in `config.rb` which we use as follows.

First, rename the file from `.md` to `.md.erb`. Then instead of:

    <img src="/blog/assets/images/2012-06-14/semaphore-homepage.png" width="700" />

we write:

    <p><%= image_tag image_url("/blog/assets/images/2012-06-14/semaphore-homepage.png"), :width => 700 %></p>

### Escaping Erb

    You must escape Erb code snippets in files with `.erb` extension ([via](https://github.com/middleman/middleman-syntax/issues/29)):

    <%%= foo %>


## Deployment

_for Rendered Text people_

Simply run

```
./deploy
```

which does `bundle exec middleman build` and uploads the content to an S3
bucket using the AWS CLI. It requires a valid `~/.aws` configuration.


## Configuration

All sensitive credentials are stored in `data/credentials.yml` check `data/credentials.yml.example` for more info about format of file.

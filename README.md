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

    <img src="/docs/assets/img/2012-06-14/semaphore-homepage.png" class="img-responsive" />

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

## Importing content from Semaphore Blog

If you turn a blog post into a Semaphore Docs page you should include the
canonical url in the post meta data. For more info, visit the Semaphore Blog
[guidelines](https://github.com/renderedtext/semaphore-blog#moving-content-to-semaphore-docs).

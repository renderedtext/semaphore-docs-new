---
layout: post
title: Using wkhtmltopodf
category: Managing dependencies
---

If your application is using locally installed binary version of wkhtmltopdf without additional configuration, or if you use [wkhtmltopdf-heroku](https://github.com/bradphelan/wkhtmltopdf-heroku) gem, no additional configuration is necessary.

If your application is using wkhtmltopdf or wkhtmltopdf-binary gem or binary version is installed on custom location, then you need to tell your PDF generator tool to use wkhtmltopdf that is installed locally on Semaphore builder machines. Path to executable wkhtmltopdf is stored in `WKHTMLTOPDF_PATH` [environment variable](/docs/available-environment-variables.html).

## Example configuration

### wicked_pdf

```ruby
# config/initializers/wicked_pdf.rb
if ENV['CI'] == 'true'
  WickedPdf.config = {
    :exe_path => ENV['WKHTMLTOPDF_PATH']
  }
end
```

### PDFKit

```ruby
# config/initializers/pdfkit.rb
if ENV['CI'] == 'true'
  PDFKit.configure do |config|
    config.wkhtmltopdf = ENV['WKHTMLTOPDF_PATH']
  end
end
```

See our test apps for example source code:

- [wicked_pdf without additional configuration](https://github.com/renderedtext/testapp-capybara-webkit/tree/pdf)
- [wicked_pdf + wkhtmltopdf-herok](:https://github.com/renderedtext/testapp-capybara-webkit/tree/wkhtmltopdf-heroku)
- [wicked_pdf + wkhtmltopdf-binar](:https://github.com/renderedtext/testapp-capybara-webkit/tree/wkhtmltopdf-binary)

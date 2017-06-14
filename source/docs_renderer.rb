require "cgi"

class DocsRenderer < Redcarpet::Render::HTML
  def block_quote(quote)
    %(<blockquote cite="http://developer.mozilla.org" class="mh0 ph4 pv1 f5 lh-loose bl b--green bw2 black-70 bg-near-white">#{escape_html(quote)}</blockquote>)
  end

  def table(header, body)
    %(<div class="overflow-x-scroll"><table class="f5">#{header}#{body}</table></div>)
  end

  def codespan(code)
    %(<span class="f7 code bg-washed-grayblue black-50blue br2 pa1">#{escape_html(code)}</span>)
  end

  def block_code(code, language)
    %(<pre class="pre code f7 mv4"><code class="ba b--black-20">#{escape_html(code)}</code></pre>)
  end

  private

  def escape_html(string)
    CGI.escapeHTML(string)
  end
end

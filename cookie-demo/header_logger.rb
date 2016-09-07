class HeaderLogger
  def initialize(app)
    @app = app
  end
  def call(env)
    blue = "\033[34m"
    red = "\033[31m"
    normal = "\033[0m"
    STDERR.puts(blue + format_headers(env) + "\n")
    status,headers,response = @app.call(env)
    STDERR.puts(red + headers.map { |k,v| "  #{k}: #{v}\n" }.join('') + "\n" + normal)
    [status,headers,response]
  end

  private

  def format_headers(hash)
    hash.map do |h,v|
      "  #{h.downcase.gsub(/^http_/,'').gsub(/_/,'-').capitalize}: #{v}\n" if
        h =~ /^HTTP/
    end.compact.join ''
  end

end

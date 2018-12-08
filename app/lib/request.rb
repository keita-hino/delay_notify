require 'net/http'
class Request
  attr_accessor :url
  def initialize(url)
    @url = url
  end
  def get
    uri = URI.parse(url)
    begin
      json = Net::HTTP.get(uri)
      JSON.parse(json)
    rescue
      puts "not connect"
    end
  end

  def post(authorization,message)
    uri = URI.parse(url)
    request = Net::HTTP::Post.new(uri)
    request["Authorization"] = authorization
    request.set_form_data(
      "message" => message,
    )

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
  end
end

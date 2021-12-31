class ApplicationController < ActionController::Base

  private
  
  def add_latitude_longitude(title)
    base_url = 'https://nominatim.openstreetmap.org/search'
    
    q = URI.encode_www_form_component(title)
    connection = Faraday.new(url: base_url) do |builder|
      builder.request  :url_encoded
      builder.response :logger
      builder.response :json, parser_options: { symbolize_names: true }
      builder.adapter Faraday.default_adapter
    end
    data = (connection.get "/search/#{q}?#{paramators}").body.first
    @latitude = data[:lat].to_f if data
    @longitude = data[:lon].to_f if data
  end
  
  def paramators
    { format: "json",
      polygon: 0,
      addressdatails: 1
    }.to_query
  end
end

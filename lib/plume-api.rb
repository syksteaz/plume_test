require 'net/http'

class PlumeApi

  attr_accessor :token, :pollution_recent, :pollution_forecast, :uv_forecast

  DOMAIN = "https://api.plume.io/1.0"

  def initialize(token)
    @token = token
  end

  def get_pollution_recent(zone, period)
    uri = URI(DOMAIN + "/pollution/recent?" + "token=" + @token + "&zone=" + zone + "&period=" + period)
    @pollution_recent = Net::HTTP.get(uri)
  end

  def get_pollution_forecast(lat, lon)
    uri = URI(DOMAIN + "/pollution/forecast?" + "token=" + @token + "&lat=" + lat.to_s + "&lon=" + lon.to_s)
    @pollution_forecast = Net::HTTP.get(uri)
  end

  def get_uv_forecast(lat, lon)
    uri = URI(DOMAIN + "/uv/forecast?" + "token=" + @token + "&lat=" + lat.to_s + "&lon=" + lon.to_s)
    @uv_forecast = Net::HTTP.get(uri)
  end
end

# TEST avec ruby lib/plume-api.rb

plume = PlumeApi.new('HERE_INSERT_ACCESS_TOKEN')

plume.get_pollution_recent('PARIS', 'day')
puts plume.pollution_recent


plume.get_pollution_forecast('48.8534100', '2.3488000')
puts plume.pollution_forecast

plume.get_uv_forecast('48.8534100', '2.3488000')
puts plume.uv_forecast

# DOCUMENTATION

# https://api.plume.io/1.0/pollution/recent?token=xxx&zone=PARIS&period=day
# token(string), zone(string), period(string: day,month,year)

# https://api.plume.io/1.0/pollution/forecast?token=xxx&lat=48.85&lon2.294
# token(string), lat(float), lon(float)

# https://api.plume.io/1.0/uv/forecast?token=xxx&lat=48.85&lon2.294
# token(string), lat(float), lon(float)

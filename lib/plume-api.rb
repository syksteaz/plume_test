require 'net/http'

class PlumeApi

  DOMAIN = "https://api.plume.io/1.0"

  def initialize(token)
    @token = token
  end

  def get_pollution_recent(token, zone, period)
    uri = URI(DOMAIN + "/pollution/recent?" + "token=" + token + "&zone=" + zone + "&period=" + period)
    @pollution_recent = Net::HTTP.get(uri)
  end

  def get_pollution_forecast(token, lat, lon)
    uri = URI(DOMAIN + "/pollution/forecast?" + "token=" + token + "&lat=" + lat.to_s + "&lon=" + lon.to_s)
    @pollution_forecast = Net::HTTP.get(uri)
  end

  def get_uv_forecast(token, lat, lon)
    uri = URI(DOMAIN + "/uv/forecast?" + "token=" + token + "&lat=" + lat.to_s + "&lon=" + lon.to_s)
    @uv_forecast = Net::HTTP.get(uri)
  end
end

# https://api.plume.io/1.0/pollution/recent?token=xxx&zone=PARIS&period=day
# token(string), zone(string), period(string: day,month,year)

# https://api.plume.io/1.0/pollution/forecast?token=xxx&lat=48.85&lon2.294
# token(string), lat(float), lon(float)

# https://api.plume.io/1.0/uv/forecast?token=xxx&lat=48.85&lon2.294
# token(string), lat(float), lon(float)

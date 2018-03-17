class StatisticGenerateService
  def initialize(url)
    @url = url
  end

  def call
    statistics_array = []
    loop do
      stat_data = Redis.current.lpop(@url.short_url)
      break if stat_data.blank?
      statistic = JSON.parse(stat_data)
      client = DeviceDetector.new(statistic.last)
      statistics_array << "('#{statistic.first.to_datetime.to_s(:db)}','#{client.device_type}','#{client.os_name}',#{@url.id},NOW(),NOW())"
    end
    StatisticBuildService.new(statistics_array).call
  end
end

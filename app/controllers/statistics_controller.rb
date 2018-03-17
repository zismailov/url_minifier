class StatisticsController < ApplicationController
  before_action :set_url
  before_action :prepare_statistics

  def index
    @statistics = @url.statistics.all
  end

  private

  def set_url
    @url = current_user.urls.find_by(id: params[:url_id])
  end

  def prepare_statistics
    StatisticGenerateService.new(@url).call
  end
end

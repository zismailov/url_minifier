class UrlsController < ApplicationController
  skip_before_action :require_login, only: [:index]
  before_action :set_url, only: [:show]

  def index
    @urls = current_user.urls
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    if @url.save
      UrlGenerateService.new(@url).call
      redirect_to url_path(@url), notice: "Your link was created succesfully"
    else
      flash.now[:alert] = "Creation of link is failed"
      render :new
    end
  end

  def show; end

  def perform_path
    url = Url.find_by(short_url: params[:short_url]) || Url.new
    errors = ErrorService.new(url).call
    if errors.blank?
      UrlService.new(url).call
      redirect_to urls_path
    else
      redirect_to new_url_path, alert: errors.join("; ")
    end
  end

  private

  def set_url
    @url = current_user
  end

  def url_params
    params.require(:url).permit(:long_url, :short_url, :life_term, :delay_time, :user_id)
  end
end

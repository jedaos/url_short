class UrlShortController < ApplicationController

def index
  @urls = Url.all
end

def new
end

def create
  @url = Url.new(url_params)

  respond_to do |format|
    if @url.save
      format.html { redirect_to root_path }
      format.json { render :show, status: :created, location: @url }
    else
      format.html { render :new }
      format.json { render json: @url.errors, status: :unprocessable_entity}
    end
  end
end

def show
  @url = Url.find_by_short_url(params[:id])
  redirect_to @url.long_url
end

private

def url_params
  params.require(:url).permit(:long_url, :id)

end

end

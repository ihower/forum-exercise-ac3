class TopicsController < ApplicationController

  def index
    @topics = Topic.page(params[:page]).per(15)
  end

end

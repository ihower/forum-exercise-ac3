class TopicsController < ApplicationController

  before_action :authenticate_user!

  def index
    if params[:cid]
      category = Category.find( params[:cid] )
      @topics = category.topics
    else
      @topics = Topic.all
    end

    @q = @topics.search(params[:q])
    @topics = @q.result(distinct: true)

    @topics = @topics.page(params[:page]).per(15)
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user

    if @topic.save
      redirect_to topics_url
    else
      render :action => :new
    end
  end

  def about
  end

  protected

  def topic_params
    params.require(:topic).permit(:title, :content, :category_ids => [])
  end

end

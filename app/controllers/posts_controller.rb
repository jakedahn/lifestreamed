class PostsController < ApplicationController
  def index
    @tweets = Post.where("post_type = 'twitter'").limit(25)
    @songs = Post.where("post_type = 'lastfm'").limit(25)
    @photos = Post.where("post_type = 'instagram'").limit(10)
  end

  def show
  end

end

class PostsController < ApplicationController
  def index
    @tweets = Post.where("post_type = 'twitter'")
    @songs = Post.where("post_type = 'lastfm'")
    @photos = Post.where("post_type = 'instagram'")
  end

  def show
  end

end

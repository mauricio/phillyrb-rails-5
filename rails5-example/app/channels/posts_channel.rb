class PostsChannel < ApplicationCable::Channel

  def follow
    stream_from "posts"
  end

  def unfollow
    stop_all_streams
  end

end
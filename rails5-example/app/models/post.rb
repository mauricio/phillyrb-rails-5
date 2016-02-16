class Post < ApplicationRecord

  validates_presence_of :title, :contents

  attribute :tags, :tag_list

  after_save :send_create_notification
  after_destroy :send_destroy_notification

  protected

  def send_create_notification
    ActionCable.server.broadcast "posts", post: self, action: "created"
  end

  def send_destroy_notification
    ActionCable.server.broadcast "posts", post: self, action: "destroyed"
  end

  class << self

    def by_created_at_or_featured(time = 1.hour.ago)
      where(created_at: (time..Time.now)).or(where(featured: true))
    end

  end

end
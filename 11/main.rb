require 'active_record'
require 'logger'

ActiveRecord::Base.establish_connection(
                                        "adapter" => "sqlite3",
                                        "database" => "./blog.db"
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

class Post < ActiveRecord::Base
  scope :top3, -> {order("created_at desc").limit(3)}
  validates :title, :presence => true
  validates :body, :length => {:minimum => 5}
end

post = Post.new(:body => "123")

if !post.save
  p post.errors.messages
end


p Post.all

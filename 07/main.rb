require 'active_record'
require 'logger'

ActiveRecord::Base.establish_connection(
                                        "adapter" => "sqlite3",
                                        "database" => "./blog.db"
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

class Post < ActiveRecord::Base
  scope :top3, -> {order("created_at desc").limit(3)}
end


#p Post.where(:id => 1..3)
#p Post.where(:id => [1, 3])

#p Post.order("id desc").limit(3)

p Post.top3

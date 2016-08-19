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


#Post.where(:title => "title4").first_or_create
#Post.where(:title => "title5").first_or_create

Post.where(:title => "title6").first_or_create do |p|
  p.body = "hello6"
end

p Post.last

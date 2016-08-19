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

post = Post.find(1)
=begin
post.title = "(new)title1"
post.save
=end

post.update_attributes(:title => "nnn", :body => "hhh")

Post.where(:id => 3..4).update_all(:title => "aaa", :body => "bbb")

p Post.all

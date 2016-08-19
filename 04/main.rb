require 'active_record'

ActiveRecord::Base.establish_connection(
                                        "adapter" => "sqlite3",
                                        "database" => "./blog.db"
)

class Post < ActiveRecord::Base
end

post = Post.new(:title => "title1", :body => "hello1")
post = Post.new
post.title = "title2"
post.body = "hello2"

post = Post.new do |p|
  p.title = "title3"
  p.body = "hello3"
end
post.save

Post.create(:title => "title4", :body => "hello4")

p Post.all


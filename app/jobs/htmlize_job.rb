class HtmlizeJob < ApplicationJob
  queue_as :default
  include MarkdownHelper

  def perform(post_id)
    puts "Performing my job"
    post = Post.find(post_id)
    htmlized_post = markdown(post.content_raw)
    post.content_html = htmlized_post
    post.save
    puts "I was super effective!"
  end
end

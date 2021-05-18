require 'pry-rails'
class Api::StoriesApiController < ApplicationController
 
  def user_avatar(name)
      ## returning an array of all avatar pngs
      ## finding avatar png for a specific user
      ## cleaning path for an image
      @avatar_file_names = Dir["public/avatars/*.png"]
      @avatar_url = @avatar_file_names.extract! { |n| n.include? name}
      
      ## checking if avatar exists, returtning path to image
      ## if not returning auther name and word avatar
      begin
        @avatar_url = @avatar_url[0][7..]
      rescue => exception
        @avatar_url = name + " avatar"
      end
      @avatar_url
  end

  def find_tags_by_story_id(story)
    @tag_ids = Tagging.where(story_id: story.id)
    tags = Tag.where(id: @tag_ids).pluck(:tag)
  end
 
  def form_story_url(story)
    "#{request.base_url}/s/#{story.short_id}/#{story.title.downcase.squish.gsub! " ", "_"}"
  end

  def find_all_stories
    @stories = Story.all
    @response =
      @stories.map  do |story|
        @id = story.user_id
        name = User.find(@id).username        
        {
          "title": story.title,
          "tags": find_tags_by_story_id(story),
          "created_at": story.created_at.to_date,
          "author": name,
          "auth img": user_avatar(name),
          "nbr of comments": story.comments_count,
          "url": form_story_url(story),
          "nbr of votes": story.score
        }
      end
      
    render json: @response
  end
end

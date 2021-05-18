class RepliesController < ApplicationController
  REPLIES_PER_PAGE = 25
  

  before_action :require_logged_in_user, :flag_warning, :set_page
  after_action :update_read_ribbons, only: [:unread]

  def all
    # render action: 'placeholder' and return
    @heading = @title = "All Your Replies"
    @replies = Comment.where(user_id: @user.id)
                 .for_user(@user.id)
                 .offset((@page - 1) * REPLIES_PER_PAGE)
                 .limit(REPLIES_PER_PAGE)
    # apply_current_vote // not implemented yet
    render :show
    
  end

  def comments
    # render action: 'placeholder' and return
    @heading = @title = "Your Comment Replies"   
    # @replies = Comment.where("user_id = @user.id and parent_comment_id != 'nil'")
    @replies = Comment.comment_replies_for(@user.id)
                 .offset((@page - 1) * REPLIES_PER_PAGE)
                 .limit(REPLIES_PER_PAGE)
    # apply_current_vote
    render :show
  end

  def stories
    # render action: 'placeholder' and return
    @heading = @title = "Your Story Replies"
    @replies = Comment
                .story_replies_for(@user.id)
                .offset((@page - 1) * REPLIES_PER_PAGE)
                .limit(REPLIES_PER_PAGE)
    # apply_current_vote
    render :show
  end

  def unread
    # render action: 'placeholder' and return
    @heading = @title = "Your Unread Replies"
    @replies = ReplyingComment.unread_replies_for(@user.id)
    # apply_current_vote
    render :show
  end

private

  # comments/_comment expects Comment objects to have a comment_vote attribute
  # with the current user's vote added by StoriesController.load_user_votes
  def apply_current_vote
    @replies.each do |r|
      next unless r.current_vote_vote.present?
      r.comment.current_vote = {
        vote: r.current_vote_vote,
        reason: r.current_vote_reason.to_s,
      }
    end
  end

  def set_page
    @page = params[:page].to_i
    if @page == 0
      @page = 1
    elsif @page < 0 || @page > (2 ** 32)
      raise ActionController::RoutingError.new("page out of bounds")
    end
  end

  def update_read_ribbons
    story_ids = @replies.pluck(:story_id).uniq
    ReadRibbon
      .where(user_id: @user.id, story_id: story_ids)
      .update_all(updated_at: Time.current)
  end
end
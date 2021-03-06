module ApplicationHelper
  MAX_PAGES = 15

  def avatar_img(user, size)
    image_tag(
      user.avatar_path(size),
      :srcset => "#{user.avatar_path(size)} 1x, #{user.avatar_path(size * 2)} 2x",
      :class => "avatar",
      :size => "#{size}x#{size}",
      :alt => "#{user.username} avatar",
    )
  end

  def errors_for(object)
    html = ""
    unless object.errors.blank?
      html << "<div class=\"flash-error\">"
      html << "<h2>#{pluralize(object.errors.count,t('helpers.appli.error'))}  #{t('helpers.appli.prohibited')} \
               #{object.class.name.downcase} #{t('helpers.appli.beingsaved')}</h2>"
      html << "<p>#{t('helpers.appli.fields')}</p>"
      html << "<ul>"
      object.errors.full_messages.each do |error|
        html << "<li>#{error}</li>"
      end
      html << "</ul></div>"
    end

    raw(html)
  end

  def header_links
    return @header_links if @header_links

    @header_links = {
      root_path => { :title => @cur_url == "/" ? t('helpers.appli.hipster') : t('helpers.appli.home') },
      recent_path => { :title => t('helpers.appli.recent') },
      comments_path => { :title => t('helpers.appli.comments') },
    }
    if @user && @user.is_admin?
      @header_links[dashboard_path] = { :title => "Dashboard" }
    end
    if @user
      @header_links[threads_path] = { :title => t('helpers.appli.threads') }
    end

    if @user && @user.can_submit_stories?
      @header_links[new_story_path] = { :title => t('helpers.appli.submit') }
    end

    if @user
      @header_links[saved_path] = { :title => t('helpers.appli.saved') }
    end

    @header_links[search_path] = { :title => t('helpers.appli.search') }

    @header_links.each do |k, v|
      v[:class] ||= []

      if k == @cur_url
        v[:class].push "cur_url"
      end
    end

    @header_links
  end

  def right_header_links
    return @right_header_links if @right_header_links

    @right_header_links = {}

    if @user
      if (count = @user.unread_replies_count) > 0
        @right_header_links[replies_unread_path] = {
          :class => ["new_messages"],
          :title => "#{@user.unread_replies_count+ t('helpers.appli.reply')}".pluralize(count),
        }
      else
        @right_header_links[replies_path] = { :title => t('helpers.appli.replies') }
      end

      if (count = @user.unread_message_count) > 0
        @right_header_links[messages_path] = {
          :class => ["new_messages"],
          :title => "#{@user.unread_message_count} Message".pluralize(count),
        }
      else
        @right_header_links[messages_path] = { :title => "Messages" }
      end

      @right_header_links[settings_path] = { :title => "#{@user.username} (#{@user.karma})" }
    else
      @right_header_links[login_path] = { :title => t('helpers.appli.login') }
    end

    @right_header_links.each do |k, v|
      v[:class] ||= []

      if k == @cur_url
        v[:class].push "cur_url"
      end
    end

    @right_header_links
  end

  def link_to_different_page(text, path)
    if current_page? path
      text
    else
      link_to(text, path)
    end
  end

  def page_numbers_for_pagination(max, cur)
    if max <= MAX_PAGES
      return (1 .. max).to_a
    end

    pages = (cur - (MAX_PAGES / 2) + 1 .. cur + (MAX_PAGES / 2) - 1).to_a

    while pages[0] < 1
      pages.push pages.last + 1
      pages.shift
    end

    while pages.last > max
      if pages[0] > 1
        pages.unshift pages[0] - 1
      end
      pages.pop
    end

    if pages[0] != 1
      if pages[0] != 2
        pages.unshift "..."
      end
      pages.unshift 1
    end

    if pages.last != max
      if pages.last != max - 1
        pages.push "..."
      end
      pages.push max
    end

    pages
  end

  def tag_link(tag)
    link_to tag.tag, tag_path(tag), class: tag.css_class, title: tag.description
  end

  def time_ago_in_words_label(time)
    ago = ""
    secs = (Time.current - time).to_i
    if secs <= 5
      ago = t('helpers.appli.justnow')
    elsif secs < 60
      ago = t('helpers.appli.less')
    elsif secs < (60 * 60)
      mins = (secs / 60.0).floor
      ago = "#{mins} #{t('helpers.appli.minute').pluralize(mins)+ t('helpers.appli.ago')}"
    elsif secs < (60 * 60 * 48)
      hours = (secs / 60.0 / 60.0).floor
      ago = "#{hours} #{t('helpers.appli.hours').pluralize(hours)+ t('helpers.appli.ago')}"
    elsif secs < (60 * 60 * 24 * 30)
      days = (secs / 60.0 / 60.0 / 24.0).floor
      ago = "#{days} #{t('helpers.appli.day').pluralize(days) + t('helpers.appli.ago')}"
    elsif secs < (60 * 60 * 24 * 365)
      months = (secs / 60.0 / 60.0 / 24.0 / 30.0).floor
      ago = "#{months} #{t('helpers.appli.month')+ t('helpers.appli.ago')}"
    else
      years = (secs / 60.0 / 60.0 / 24.0 / 365.0).floor
      ago = "#{years} #{t('helpers.appli.year').pluralize(years)+ t('helpers.appli.ago')}"
    end

    raw(content_tag(:span, ago, title: time.strftime("%F %T %z")))
  end
end

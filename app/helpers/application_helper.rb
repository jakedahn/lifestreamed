module ApplicationHelper
  def link_twitter_user(txt)
    if match = txt.match(/.*?(@)((?:[a-z][a-z]+))(:|\s)/i)
      user = match[1]+match[2]
      txt.gsub!(user, '<a href="http://twitter.com/' + user + '">' + user + '</a>')
    end
    txt
  end
end

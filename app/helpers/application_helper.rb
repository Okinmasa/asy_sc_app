module ApplicationHelper
#正しいタイトルを返す
  def full_title(page_title)
  	base_title = "統制ツール"
  	if page_title.empty?
  	  base_title
  	else
	  "#{base_title} | #{page_title}"
  	end
  end
end

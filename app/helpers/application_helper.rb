module ApplicationHelper

  # If don't use provide method to apply a title we can use this method to provide good default. 
  def full_title(page_title = '')
    base_title = "Ironmongery Store Ireland"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
module ApplicationHelper

  # Adds class names to the <body> tag
	def klass_pagename
    class_names = [params[:controller], params[:action]].compact.join(" ").downcase
  end
  
  # Add a class via any view by doing
  def klass_extra
    klass_names ||= " " + content_for(:extra_class_names_for_body)
  end

  # Sort Helper used in Admin Index
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  def description(page_description)
    content_for(:description) { page_description }
  end

  def fb_img(page_fb_img)
    content_for(:fb_img) { page_fb_img }
  end
end
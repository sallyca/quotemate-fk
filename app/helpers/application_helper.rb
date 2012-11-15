module ApplicationHelper

  def include_js(*js_files)
    content_for(:js) { javascript_include_tag(js_files) }
  end

end

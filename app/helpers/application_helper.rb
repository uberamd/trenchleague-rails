module ApplicationHelper
  def markdown(text)
    options = {
        filter_html:     true,
        hard_wrap:       true,
        link_attributes: { rel: 'nofollow', target: "_blank" },
        space_after_headers: true,
        fenced_code_blocks: true
    }

    extensions = {
        autolink:           true,
        superscript:        true,
        disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  def is_active_controller(controller_name, class_name = nil)
    if params[:controller] == controller_name
      class_name == nil ? "active" : class_name
    else
      nil
    end
  end

  def is_active_action(action_name)
    params[:action] == action_name ? "active" : nil
  end
end

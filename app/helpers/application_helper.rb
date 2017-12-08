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

  def get_graph_color_string(index, opacity)
    case index
      when 0
        return "rgba(65,187,244,#{opacity})"
      when 1
        return "rgba(26,179,148,#{opacity})"
      when 2
        return "rgba(179,181,198,#{opacity})"
      when 3
        return "rgba(244,65,65,#{opacity})"
      when 4
        return "rgba(244,172,65,#{opacity})"
      when 5
        return "rgba(244,65,124,#{opacity})"
      else
        return "rgba(170,66,244,#{opacity})"
    end
  end

  def do_useful_division_on_values(num, denom)

    # return 0 if num is nil
    if num.nil?
      return 0
    end

    # if denom is 0 or nil then return num
    if denom == 0 || denom.nil?
      return num
    end

    # do real math
    return num / denom

  end
end

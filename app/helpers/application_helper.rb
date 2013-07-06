module ApplicationHelper

# Altered devise default error explanation helper

  def error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
      <div id="error_explanation">
        <hr/>
        <h2>#{sentence}</h2>    
        <ul>#{messages}</ul>
        <hr/>
      </div>
    HTML

    html.html_safe
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def chart_data key, limit=6

    data = {}

    if current_user.weights.length >= 2 
      current_user.weights.last(limit).each do |w|
        (data[:labels] ||= []).push w.created_at.strftime("%m.%d")  # Beautiful array-inside-of-hash init
        (data[:points] ||= []).push w.value
      end
      data[key].to_s
    else
      nil
    end

  end
end

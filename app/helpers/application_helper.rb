module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-danger"
    when :alert then "alert alert-warning"
    end
  end

  def notification_messages!
    [:notice, :success].each do |key|
      if flash[key]
        @key = key
        @notification_message = flash[key]
      end
    end

    messages!
  end

  def messages!
    return "" if @notification_message.blank?

    html = <<-HTML
      <div class="#{flash_class(@key)}" role="alert">
        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Fermer</span></button>
        <strong>#{@notification_message}</strong>
      </div>
    HTML

    html.html_safe
  end

  def front_messages!
    return "" if @notification_message.blank?

    html = <<-HTML
        <strong>#{@notification_message}</strong>
    HTML

    html.html_safe
  end
end

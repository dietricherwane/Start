module CompletedProjectsHelper
  def completed_project_messages!
    [:error, :alert, :success, :notice].each do |key|
      if flash[key]
        @key = key
        @notification_message = flash[key]
      end
    end

    return "" if @notification_message.blank?

    messages!
  end
end

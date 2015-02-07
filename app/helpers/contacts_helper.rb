module ContactsHelper
  def contact_messages!
    [:error, :alert, :success, :notice].each do |key|
      if flash[key]
        @key = key
        @notification_message = flash[key]
      end
    end

    return "" if @notification_message.blank?

    front_messages!
  end
end

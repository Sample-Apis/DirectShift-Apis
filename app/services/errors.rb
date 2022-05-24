class Errors
  class << self
    def customize(error_messages)
      errors = []
      error_messages.full_messages.each do |error_message|
        custom_error_message = error_message.split('^')[1]
        errors << if custom_error_message.blank?
                    error_message
                  else
                    custom_error_message
                  end
      end
      errors
    end
  end
end

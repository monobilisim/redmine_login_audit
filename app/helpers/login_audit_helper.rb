#
# Copyright (C) 2018 Martin Denizet <martin.denizet@supinfo.com>
#
module LoginAuditHelper

  # Returns the real client IP address, prioritizing X-Forwarded-For if present
  def real_client_ip(request)
    xff = request.headers['X-Forwarded-For']
    if xff.present?
      return xff.split(',').first.strip
    end
    request.remote_ip
  end

  def choices_for_purge
    my_array = []
    12.times do |i|
      my_array<<[i+1, i+1]
    end
    my_array
  end

  def success_image(success=true)
    image_tag(success ? 'true.png' : 'false.png')
  end
end
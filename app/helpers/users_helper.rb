module UsersHelper

  # Returns the Gravatar for the given user.
  def gravatar_for(user, options = {size: 50})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    
    if user.picture? 
      gravatar_url = user.picture.url
    else 
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}" 
    end
    image_tag(gravatar_url, alt: user.name, class: "gravatar", size: "#{size}x#{size}")
	
  end
end
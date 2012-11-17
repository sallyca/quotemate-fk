module UsersHelper

  def user_avatar(user, size = :medium, options = {})
    options = {
      :class => 'user-avatar'
    }.merge(options)

    case size
    when :icon
      options[:size] = "22x22"
      dim = "22x22#"
    when :small
      options[:size] = "50x50"
      dim = "50x50#"
    when :medium
      options[:size] = "80x80"
      dim = "80x80#"
    end

    if user.avatar && user.avatar.image
      image_fu user.avatar, dim, options
    else
      image_tag "empty/user-avatar-#{size.to_s}.png", options
    end
  end
  
end

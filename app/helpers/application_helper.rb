module ApplicationHelper
  def alert_for(flash_type)
    {success: 'alert-success',
     error: 'alert-danger',
     alert: 'alert-warning',
     notice: 'alert-info'}
     [flash_type.to_sym] || flash_type.to_s
  end
  
  def form_image_select(post) 
    if post.image.exists?
      return image_tag post.image.url(:medium), id: 'image-preview', class: 'img-responsive'
    else
      # Placeholder image from http://www.futurespast.co/wp-content/themes/bh_courage/assets/images/placeholder_featured_image.svg 
      return image_tag '/assets/placeholder.jpg', id: 'image-preview', class: 'img-responsive'
    end
  end
  
  def profile_avatar_select(user)
    if user.avatar.exists?
      return image_tag user.avatar.url(:medium), id: 'image-preview', class: 'img-responsive img-circle profile-image'
    else 
      return image_tag '/assets/placeholder-avatar.png', id: 'image-preview', class: 'img-responsive img-circle profile-image'
    end
  end
end

module LikesHelper
  def redirect_to_path
    "#{request.full_path}##{dom_id(likeable)}"
  end
end

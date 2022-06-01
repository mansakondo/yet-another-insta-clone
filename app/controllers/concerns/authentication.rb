module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate

    private
      def authenticate
        if user = User.find_by(id: cookies.encrypted[:user_id])
          Current.user = user
        else
          redirect_to sign_in_url
        end
      end
  end
end

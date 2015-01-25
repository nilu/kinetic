module Api
  class UsersController < Api::BaseController

      def user_params
        params.permit(:email, :password)
      end

      def query_params
        params.permit(:email, :password)
      end
  end
end
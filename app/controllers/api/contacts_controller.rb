module Api
  class ContactsController < Api::BaseController

    private

      def contact_params
        params.permit(:email)
      end

      def query_params
        params.permit(:email)
      end

  end
end
module Api
  class ContactsController < Api::BaseController

    private

      def album_params
        params.require(:contact).permit(:title)
      end

      def query_params
        # this assumes that an contact belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit(:email)
      end

  end
end
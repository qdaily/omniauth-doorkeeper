require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Doorkeeper < OmniAuth::Strategies::OAuth2
      # change the class name and the :name option to match your application name
      option :name, :doorkeeper

      option :client_options, {
                              :site => "http://test.app.qdaily.com:7777",
                              :authorize_url => "/oauth/authorize",
                              :token_url => "/oauth/token"
                            }

      option :provider_ignores_state, true

      uid {  raw_info['id'] }

      info do
        {
          id: raw_info["id"],
          username: raw_info["username"],
          email: raw_info["email"],
          phone: raw_info["phone"],
          genre: raw_info["genre"],
          _alias: raw_info["_alias"]

        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/users/me').parsed
      end
    end
  end
end
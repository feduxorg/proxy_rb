# frozen_string_literal: true
require 'shellwords'

require 'proxy_rb/credentials'
require 'proxy_rb/proxy_url_parser'

# ProxyRb
module ProxyRb
  # Represent proxy
  class HttpProxy
    attr_reader :url, :credentials

    def initialize(parser)
      @url         = parser.proxy_url
      @credentials = parser.credentials
    end

    def host
      url.host
    end

    def port
      url.port
    end

    def user
      credentials.user_name
    end

    def password
      credentials.password
    end

    def empty?
      host.nil? || host.empty?
    end

    # Convert to symbol to reference the proxy
    #
    # @return [Symbol]
    #   <host>_<port>_<credentials>
    def to_ref
      Shellwords.escape(*[host, port, user].compact.join('_')).to_sym
    end
  end
end

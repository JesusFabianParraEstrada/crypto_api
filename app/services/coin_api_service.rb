require 'websocket-client-simple'

class CoinApiService
  @ws

  def self.start
    @ws || CoinApiService.new
  end

  def initialize
    @url = "#{url_ws}?apikey=#{ENV['API_KEY']}"
    connect
  end

  def connect
    @ws = WebSocket::Client::Simple.connect @url

    @ws.on(:open) do
      puts 'Conexión WebSocket abierta'
    end

    @ws.on(:message) do |event|
      pp event.data
      Rails.logger.info "Received message: #{event.data}"
    end

    @ws.on(:close) do |event|
      puts "Conexión WebSocket cerrada: #{event.code}, #{event.reason}"
    end

    @ws.on(:error) do |event|
      puts "Error: #{event.message}"
      Rails.logger.error "Error: #{event.message}"
    end
  end

  def handle_message(message)
    puts "Mensaje recibido: #{message}"
    #Procesar mensaje recibido
  end

  def url_ws
    Rails.env.production? ? ENV['URL_PROD'] : ENV['URL_DEV']
  end
end

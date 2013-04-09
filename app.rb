require 'sinatra/base'
require 'haml'

class App < Sinatra::Base
  get '/' do
    haml :index
  end

  get %r{\A/room/?\Z} do
    serial = new_serial_string

    serial
  end

  get '/room/:serial' do
    break 'bad serial!' unless valid_serial? params[:serial]

    params[:serial]
  end

  get '/mb/:serial' do
    break 'bad serial!' unless valid_serial? params[:serial]

    params[:serial]
  end

  post '/mb/' do

  end

  private

  def valid_serial?(str)
    str =~ /[0-9a-f]{32}/
  end

  def new_serial_string
    SecureRandom.hex
  end
end

require 'sinatra'
require 'sendgrid-ruby'

get '/' do
	erb :home
end

get '/about' do
	erb :about
end

get '/photos' do
	erb :photos
end

get '/contact' do
	erb :contact
end

post '/contact' do
	@email = params[:email]
	@message = params[:message]

	client = SendGrid::Client.new do |c|   
		c.api_key = ENV['SENDGRID_API_KEY'] 
	end


	mail = SendGrid::Mail.new do |m|   
		m.to = 'nblayney@g.cofc.edu'   
		m.from = @email   
		m.subject = "Inquiry for Darin's Hawaiian Shaved Ice"   
		m.text = @message 
	end

	res = client.send(mail) 
	puts res.code 
	puts res.body

	redirect '/'

end






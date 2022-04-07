module Authenticable
	
	def current_user
		return @current_user if @current_user
		header = request.headers['Authorization']
		return nil if header.nil?

		token = header.split(' ')[1]
		decoded = JsonWebToken.decode(token)
		@current_user = User.find(decoded["user_id"]) 
	end


end

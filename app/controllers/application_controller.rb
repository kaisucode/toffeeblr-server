class ApplicationController < ActionController::API
  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      if not header
        puts("No header provided")
        render json: { error: e.message }, status: :unprocessable_entity
      else
        print("jwt messed up, header: ")
        puts(header)
        render json: { error: e.message }, status: :internal_server_error
      end
    end
  end
end

class ApplicationController < ActionController::API
  include ActionController::Cookies

  def authorize
    return render json: {errors: ["Not authorized"]}, status: :unauthorized unless session[:user_id]
  end

end

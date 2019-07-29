class PhoneAuthController < ApplicationController
  def send_otp
    user = User.where(phone: params[:phone]).first
    user.send_otp
    render(:json => {status: 'success'})
  end

  def verify_otp
    user = User.where(phone: params[:phone]).first
    puts "OTP Valid: #{user.authenticate_otp(params[:otp])}"
    if user.authenticate_otp(params[:otp].to_s).present?
      token = DeviseTokenAuth::TokenFactory.create
      puts token
      @resource.tokens[token.client] = {
        token:  token.token_hash,
        expiry: token.expiry
      }
      puts @resource
      new_auth_header = @resource.build_auth_header(token.token, token.client)
      response.headers.merge!(new_auth_header)

      puts response
      render(json: response)
    else
      render(status: 401)
    end  
  end
end

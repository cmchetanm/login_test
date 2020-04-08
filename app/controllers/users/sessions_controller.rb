# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :find_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    if params[:user][:password].blank?
      redirect_to :action => "password", :id => @user
    else
      super
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def password
    @user = User.find_by(id: params[:id])
    if @user.present?
      render :action => "password"
    else
      redirect_to new_user_session_path, flash: { notice: "User not found in our db with your email!" }
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def find_user
    @user = User.find_by(email: params[:user][:email])&.id
  end
end

# frozen_string_literal: true

# Controller
class CustomersController < ApplicationController
  layout 'customers_layout/customers'
  before_action :validate_user_logged_in
  before_action :authenticate_customer!

  private

  def validate_user_logged_in
    return unless user_signed_in?

    redirect_to root_path
    flash[:notice] = 'You are signing in as User, please logout and sign in again as Customer'
  end
end

# frozen_string_literal: true

class ModeratorsController < ApplicationController
  layout 'moderators_layout/moderators'
  before_action :validate_customer_logged_in
  before_action :authenticate_user!
  before_action :validate_moderator

  private

  def validate_customer_logged_in
    return unless customer_signed_in?

    redirect_to root_path
    flash[:notice] = 'You are signing in as Customer, please logout and sign in again as User'
  end

  def validate_moderator
    return if %w[Moderator Admin].include?(current_user.type)

    redirect_to root_path
    flash[:notice] = 'You are not Moderator or Admin'
  end
end

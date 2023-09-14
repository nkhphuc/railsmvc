# frozen_string_literal: true

class ModeratorsController < ApplicationController
  layout 'moderators_layout/moderators'
  before_action :authenticate_user!
  before_action :validate_moderator

  private

  def validate_moderator
    return if ['Moderator', 'Admin'].include?(current_user.type)
    redirect_to root_path
    flash[:notice] = 'You are not Moderator or Admin'
  end
end

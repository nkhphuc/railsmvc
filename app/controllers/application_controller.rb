# frozen_string_literal: true

# Application Controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if %w[Moderator Admin].include?(resource.class.to_s)
      students_path
    else
      customer_index_path
    end
  end
end

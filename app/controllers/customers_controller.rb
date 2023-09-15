# frozen_string_literal: true

class CustomersController < ApplicationController
  layout 'customers_layout/customers'
  before_action :authenticate_customer!

end

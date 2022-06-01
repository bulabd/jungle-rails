class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASSWORD']

  def show
    @product_count = Product.count.to_i
    @category_count = Category.count.to_i
  end
end

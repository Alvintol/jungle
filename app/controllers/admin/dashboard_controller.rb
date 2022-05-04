class Admin::DashboardController < ApplicationController
  def show
    @category_total = Category.count
    @products_total = Product.count
  end
end


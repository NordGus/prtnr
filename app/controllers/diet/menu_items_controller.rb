# frozen_string_literal: true

module Diet
  # Diet::MenuItemsController
  class MenuItemsController < DietController
    before_action :set_date
    before_action :set_menu_item, only: %i[edit update delete destroy]

    def index
      @menu_items = Diet::Menu::Item.includes(:recipe).where(date: @date)
    end

    def new
      @menu_item = Diet::Menu::Item.new(date: @date)
    end

    def create
      @menu_item = Diet::Menu::Item.new(menu_item_params)

      render :new unless @menu_item.save
    end

    def edit; end

    def update
      render :edit unless @menu_item.update(menu_item_params)
    end

    def delete; end

    def destroy
      @menu_item.destroy
    end

    def count
      @count = Diet::Menu::Item.where(date: @date).count
    end

    private

    def set_date
      @date = Date.strptime(params[:menu_id].to_s, '%Y_%m_%d')
    end

    def set_menu_item
      @menu_item = Diet::Menu::Item.find(params[:id])
    end

    def menu_item_params
      params.require(:menu_item).permit(:date, :portions, :recipe_id)
    end
  end
end

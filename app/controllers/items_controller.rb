class ItemsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        items = Item.all.order(user_id: :desc)
        render json: items, include: :user, status: :ok
    end

    private
    def render_not_found_response
        render json: {error: "Item not found"}, status: :not_found
    end
end
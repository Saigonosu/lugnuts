class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create, :destroy]
  before_action :set_line_item, only: [:show, :edit, :update]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    product = Product.find(params[:productCode])
    @line_item = @cart.add_product(product.productCode)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to cart_url(current_user) }
        format.js { @current_item = @line_item }
        format.json { render action: 'show', status: :created, location: @line_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    product = Product.find(params[:productCode])
    @line_item = @cart.remove_product(product.productCode)

    respond_to do |format|
      if @line_item.quantity > 0
        if @line_item.save
          format.html { redirect_to cart_url(current_user) }
          format.json { head :no_content }
        else
          format.html { redirect_to cart_url(current_user), notice: 'Line item was unsuccessfully updated.' }
        end
      else
        if @line_item.destroy
          format.html { redirect_to cart_url(current_user) }
        else
          format.html { redirect_to cart_url(current_user), notice: 'Line item was unsuccessfully updated.' }
        end
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def line_item_params
    params.require(:line_item).permit(:productCode, :cart_id)
  end
end

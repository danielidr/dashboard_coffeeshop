class SalesController < ApplicationController
  before_action :set_sale, only: %i[ show edit update destroy ]

  # GET /sales or /sales.json
  def index
    @sales_all = Sale.group_by_month(:sale_date, last: 12).sum(:price)
    @sales_amount_month = Sale.group_by_month(:sale_date, last: 12).sum(:amount)
    @sales_average = Sale.group_by_month(:sale_date, last: 12).average(:amount)
        
    @sales_amount12 = Sale.where('sale_date > ?', 1.year.ago).group(:origin).count

    @sales_amount6 = Sale.where('sale_date > ?', 6.month.ago).group(:origin).count

    @sales_amount3 = Sale.where('sale_date > ?', 3.month.ago).group(:origin).count

    @sales_amount1 = Sale.where('sale_date > ?', 1.month.ago).group(:origin).count

    @sales_blend_coffee12 = Sale.where('sale_date > ?', 1.year.ago).group(:blend_coffee).count 
        
    @sales_blend_coffee6 = Sale.where('sale_date > ?', 6.month.ago).group(:blend_coffee).count  

    @sales_blend_coffee3 = Sale.where('sale_date > ?', 3.month.ago).group(:blend_coffee).count 

    @sales_blend_coffee1 = Sale.where('sale_date > ?', 1.month.ago).group(:blend_coffee).count
  end

  # GET /sales/1 or /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales or /sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: "Sale was successfully created." }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1 or /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: "Sale was successfully updated." }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1 or /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: "Sale was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sale_params
      params.require(:sale).permit(:price, :blend_coffe, :origin, :sale_date, :amount)
    end
end

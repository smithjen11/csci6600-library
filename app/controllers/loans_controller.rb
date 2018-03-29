class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin, only: [:new, :create, :edit, :update, :destroy]

  # GET /loans
  def index
    @loans = Loan.all
  end

  # GET /loans/1
  def show
  end

  # GET /loans/new
  def new
    @loan = Loan.new
  end

  # GET /loans/1/edit
  def edit
  end

  # POST /loans
  def create
    @loan = Loan.new(loan_params)

    respond_to do |format|
      if @loan.save
        format.html { redirect_to @loan, notice: 'Loan was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /loans/1
  def update
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to @loan, notice: 'Loan was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /loans/1
  def destroy
    @loan.destroy
    respond_to do |format|
      format.html { redirect_to loans_url, notice: 'Loan was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_params
      params.require(:loan).permit(:book_id, :user_id, :date_borrowed, :due_date, :date_returned, :renewed_count, :overdue, :fine, :fine_paid_date)
    end

    def ensure_admin
      redirect_to root_path unless current_user.try(:admin?)
    end
end

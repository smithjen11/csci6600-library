class HoldsController < ApplicationController
  before_action :set_hold, only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin, only: [:edit, :update]

  # GET /holds
  def index
    @holds = Hold.all
  end

  # GET /holds/1
  def show
  end

  # GET /holds/new
  def new
    @hold = Hold.new
    @books = Book.all
  end

  # GET /holds/1/edit
  def edit
    @books = Book.all
  end

  # POST /holds
  def create
    @hold = Hold.new(hold_params)

    respond_to do |format|
      if @hold.save
        format.html { redirect_to :back, notice: 'Hold was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /holds/1
  def update
    respond_to do |format|
      if @hold.update(hold_params)
        format.html { redirect_to @hold, notice: 'Hold was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /holds/1
  def destroy
    @hold.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Hold was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hold
      @hold = Hold.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hold_params
      params.require(:hold).permit(:book_id, :user_id, :request_date, :release_date)
    end

    def ensure_admin
      redirect_to root_path unless current_user.try(:admin?)
    end
end

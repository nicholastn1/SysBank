class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]
  before_action :initialize_dependences, only: [:new, :edit, :create, :update]

  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.where(account_id: current_user.accounts.ids).or(Transaction.where(account_destiny_id: current_user.accounts.ids)).page(params[:page]).per(5)

  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new(transaction_type: params[:transaction_type])
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = Transaction.new(transaction_params.merge!(user_id: current_user.id))
    begin
      respond_to do |format|
        if @transaction.save!
          format.html { redirect_to @transaction, notice: "Transaction was successfully created." }
          format.json { render :show, status: :created, location: @transaction }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @transaction.errors, status: :unprocessable_entity }
        end
      end
    rescue => exception
      render :new
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params.merge!(user_id: current_user.id))
        format.html { redirect_to @transaction, notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: "You can't remove an transaction!" }
      format.json { head :no_content }
    end
  end

  private

    def initialize_dependences
      @accounts = current_user.accounts
      @accounts_destiny = Account.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:date, :amount, :transaction_type, :account_id, :user_id, :account_destiny_id)
    end

end

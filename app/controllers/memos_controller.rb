class MemosController < ApplicationController
  before_action :set_memo, only: [:edit, :update, :destroy]

  def index
    @memos = Memo.all
  end

  def new
    @memo = Memo.new
  end

  def edit
  end

  def create
    @memo = Memo.new(memo_params)

    if @memo.save
      redirect_to memos_url, notice: 'Memo was successfully created.'
    else
      render :new
    end
  end

  def update
    if @memo.update(memo_params)
      redirect_to memos_url, notice: 'Memo was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @memo.destroy
    respond_to do |format|
      format.html { redirect_to memos_url, notice: 'Memo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_memo
    @memo = Memo.find(params[:id])
  end

  def memo_params
    params.require(:memo).permit(:kind, :content)
  end
end

class MemosController < ApplicationController
  before_action :set_memo, only: [:edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:create, :update] # TODO: APIのための一時対応…

  def index
    @memos = Memo.date_ordered
  end

  def current
    @keeps = Memo.current.keeps.date_ordered
    @problems = Memo.current.problems.date_ordered
  end

  def new
    @memo = Memo.new
  end

  def edit
  end

  def create
    @memo = Memo.new(memo_params)

    respond_to do |format|
      if @memo.save
        format.html { redirect_to memos_url, notice: 'Memo was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render :new }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @memo.update(memo_params)
        format.html { redirect_to memos_url, notice: 'Memo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
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

class TablesController < ApplicationController
  before_action :set_table, only: [:show, :edit, :update, :destroy]

  def index
    @tables = Table.all
  end

  def show
  end

  def new
    @table = Table.new
  end

  def edit
  end

  def create
    @table = Table.new(table_params)
    respond_to do |format|
      if @table.save
        @table.users << current_user
        format.html { redirect_to @table, notice: 'Table was successfully created.' }
        format.json { render :show, status: :created, location: @table }
      else
        format.html { render :new }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @table.update(table_params2)
        
    @table.users << current_user
        format.html { redirect_to @table, notice: 'Table was successfully updated.' }
        format.json { render :show, status: :ok, location: @table }
      elsif @table.update(table_params3)    
        
    @table.users << current_user
        format.html { redirect_to @table, notice: 'Table was successfully updated.' }
        format.json { render :show, status: :ok, location: @table }
      elsif @table.update(table_params4)       
        
    @table.users << current_user
        format.html { redirect_to @table, notice: 'Table was successfully updated.' }
        format.json { render :show, status: :ok, location: @table }
      elsif @table.update(table_params5)       
        
    @table.users << current_user
        format.html { redirect_to @table, notice: 'Table was successfully updated.' }
        format.json { render :show, status: :ok, location: @table }
      elsif @table.update(table_params6)        
        
    @table.users << current_user
        format.html { redirect_to @table, notice: 'Table was successfully updated.' }
        format.json { render :show, status: :ok, location: @table }
      elsif @table.update(table_params7)        
        
    @table.users << current_user
        format.html { redirect_to @table, notice: 'Table was successfully updated.' }
        format.json { render :show, status: :ok, location: @table }
      else
        format.html { render :edit }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @table.destroy
  end

  private
  def set_table
    @table = Table.find(params[:id])
    end

  def table_params
    params.require(:table).permit(:user_id)
   end
  
  def table_params2
    params.require(:table).permit(:user_id2)
    end
   def table_params3
    params.require(:table).permit(:user_id3)
    end
   def table_params4
    params.require(:table).permit(:user_id4)
    end
   def table_params5
    params.require(:table).permit(:user_id5)
    end
   def table_params6
    params.require(:table).permit(:user_id6)
    end
   def table_params7
    params.require(:table).permit(:user_id7)
    end
end

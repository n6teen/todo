class Todo1sController < ApplicationController
  before_action :set_todo1, only: %i[ show edit update destroy ]

  # GET /todo1s or /todo1s.json
  def index
    @todo1s = Todo1.all
  end

  # GET /todo1s/1 or /todo1s/1.json
  def show
  end

  # GET /todo1s/new
  def new
    @todo1 = Todo1.new
  end

  # GET /todo1s/1/edit
  def edit
  end

  # POST /todo1s or /todo1s.json
  def create
    @todo1 = Todo1.new(todo1_params)

    respond_to do |format|
      if @todo1.save
        format.html { redirect_to @todo1, notice: "Todo1 was successfully created." }
        format.json { render :show, status: :created, location: @todo1 }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo1s/1 or /todo1s/1.json
  def update
    respond_to do |format|
      if @todo1.update(todo1_params)
        format.html { redirect_to @todo1, notice: "Todo1 was successfully updated." }
        format.json { render :show, status: :ok, location: @todo1 }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo1s/1 or /todo1s/1.json
  def destroy
    @todo1.destroy!

    respond_to do |format|
      format.html { redirect_to todo1s_path, status: :see_other, notice: "Todo1 was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo1
      @todo1 = Todo1.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def todo1_params
      params.expect(todo1: [ :title, :status ])
    end
end

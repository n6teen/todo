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
        format.turbo_stream # Renders create.turbo_stream.erb
        format.html { redirect_to todo1_url(@todo1), notice: "Todo was successfully created." }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@todo1)}_form", partial: "form", locals: { todo: @todo1 }) }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo1s/1 or /todo1s/1.json
  def update
    respond_to do |format|
      if @todo1.update(todo1_params)
        format.turbo_stream { render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@todo1)}", partial: "todo1", locals: { todo: @todo1 }) }
        format.html { redirect_to root_path, notice: "Todo updated successfully." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /todo1s/1 or /todo1s/1.json
  def destroy
    @todo1.destroy!
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("#{helpers.dom_id(@todo1)}") }
      format.html { redirect_to todo1s_path, status: :see_other, notice: "Todo was successfully destroyed." }
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

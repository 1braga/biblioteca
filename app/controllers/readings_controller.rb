class ReadingsController < ApplicationController
  before_action :set_reading, only: %i[ show edit update destroy ]

  # GET /readings or /readings.json
  def index
    @readings = Reading.all
  end

  # GET /readings/1 or /readings/1.json
  def show
  end

  # GET /readings/new
  def new
    @reading = Reading.new
  end

  # GET /readings/1/edit
  def edit
  end

  # POST /readings or /readings.json
  def create
    user = User.find(reading_params[:user_id])
    book = Book.find(reading_params[:book_id])

    @reading = RegisterReadingService.new(
      user: user,
      book: book,
      status: reading_params[:status],
      rating: reading_params[:rating],
      review: reading_params[:review]
    ).call
    if @reading.persisted?
      ActiveSupport::Notifications.instrument("reading.created", {
        user: @reading.user,
        book: @reading.book
      })
      redirect_to @reading, notice: "Livro registrado como lido com sucesso."
    else
      Rails.logger.error "Falha ao criar leitura: #{@reading.errors.full_messages.join(', ')}"
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /readings/1 or /readings/1.json
  def update
    respond_to do |format|
      if @reading.update(reading_params)
        format.html { redirect_to @reading, notice: "Reading was successfully updated." }
        format.json { render :show, status: :ok, location: @reading }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /readings/1 or /readings/1.json
  def destroy
    @reading.destroy!

    respond_to do |format|
      format.html { redirect_to readings_path, status: :see_other, notice: "Reading was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading
      @reading = Reading.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reading_params
      params.require(:reading).permit(:user_id, :book_id, :status, :rating, :review)
    end
end

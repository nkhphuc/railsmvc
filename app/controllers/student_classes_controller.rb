class StudentClassesController < ModeratorsController
  before_action :set_student_class, only: %i[ show edit update destroy ]

  # GET /student_classes or /student_classes.json
  def index
    @student_classes = StudentClass.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /student_classes/1 or /student_classes/1.json
  def show
  end

  # GET /student_classes/new
  def new
    @student_class = StudentClass.new
  end

  # GET /student_classes/1/edit
  def edit
  end

  # POST /student_classes or /student_classes.json
  def create
    @student_class = StudentClass.new(student_class_params)

    respond_to do |format|
      if @student_class.save
        # format.html { render :new, notice: "Student class was successfully created." }
        # format.html { redirect_to student_class_url(@student_class), notice: "Student class was successfully created." }
        format.json { render :show, status: :created, location: @student_class }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_classes/1 or /student_classes/1.json
  def update
    respond_to do |format|
      if @student_class.update(student_class_params)
        # format.html { redirect_to student_class_url(@student_class), notice: "Student class was successfully updated." }
        format.json { render :show, status: :ok, location: @student_class }
        format.turbo_stream
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_classes/1 or /student_classes/1.json
  def destroy
    @student_class.destroy

    respond_to do |format|
      # format.html { redirect_to student_classes_url, notice: "Student class was successfully destroyed."}
      format.json { head :no_content }
      format.turbo_stream {render turbo_stream: turbo_stream.remove(@student_class)}
    end
  end

  def get_teachers
    teachers = Teacher.pluck(:id, :name).map do |id, name|
      { value: id, text: name }
    end
    render json: { options: teachers }
  rescue StandardError => e
    render json: { errors: e.message }, status: :unprocessable_entity
  end

  def update_teachers
    respond_to do |format|
      format.turbo_stream
    end
  end

  def update_teachers
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_class
      @student_class = StudentClass.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_class_params
      params.require(:student_class).permit(:name, :teacher_id, :school_id)
    end
end

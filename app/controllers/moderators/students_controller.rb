# frozen_string_literal: true

# Students Controller
module Moderators
  class StudentsController < ModeratorsController
    before_action :set_student, only: %i[show edit update destroy]

    def index
      students_load = if params[:query].present?
                        Student.where('name LIKE ?', "%#{params[:query]}%")
                      else
                        Student.all
                      end
      @students = students_load.page params[:page]
    end

    def show; end

    def new
      @student = Student.new
      @student.grades.build
    end

    def edit
      @student.grades.build
    end

    def create
      @student = Student.new(student_params)

      respond_to do |format|
        if @student.save
          format.html { redirect_to student_path(@student), notice: 'Student was successfully created.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @student.update(student_params)
          format.html { redirect_to student_path(@student), notice: 'Student was successfully updated.' }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @student.destroy

      respond_to do |format|
        format.html { redirect_to students_path, notice: 'Student was successfully destroyed.' }
      end
    end

    private

    def set_student
      @student = Student.find_by(id: params[:id])
      # if @student.nil?
      #   @student.errors.add
      # end
    end

    def student_params
      params.require(:student).permit(:name, :email, :birthday, :image, { medias: [] },
                                      grades_attributes: %i[id subject semester score _destroy])
    end
  end
end

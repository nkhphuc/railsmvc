# frozen_string_literal: true

# Students Controller
module Moderators
  # Controller
  class StudentsController < ModeratorsController
    before_action :set_student, only: %i[show edit update destroy move_up move_down]

    def index
      # students_load = if params[:query].present?
      #                   Student.includes(:grades).where('CONCAT(first_name, " ", name) LIKE ?', "%#{params[:query]}%").order(Arel.sql('`order` IS NULL, `order` ASC'))
      #                 else
      #                   Student.includes(:grades).order(Arel.sql('`order` IS NULL, `order` ASC'))
      #                 end
      # students_load = if params[:query].present?
      #                   Student.where('name LIKE ?', "%#{params[:query]}%")
      #                     .includes(:grades).joins(:grades)
      #                     .where(grades: {subject: 0})
      #                 else
      #                   Student.all.includes(:grades).joins(:grades).where(grades: {subject: 0})
      #                 end
      # @students = students_load.page params[:page]
      @q = Student.ransack(params[:q])
      @students = @q.result.includes(:grades).order(Arel.sql('`order` IS NULL, `order` ASC')).page params[:page]
      respond_to do |format|
        format.html
        format.js
      end
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

    def move_up
      OrderingService.new(@student).move_up
      redirect_to students_path
    end

    def move_down
      OrderingService.new(@student).move_down
      redirect_to students_path
    end


    private

    def set_student
      @student = Student.find_by(id: params[:id])
      # if @student.nil?
      #   @student.errors.add
      # end
    end

    def student_params
      params.require(:student).permit(:name, :email, :birthday, :image, { medias: [] }, :first_name, :order,
                                      grades_attributes: %i[id subject semester score _destroy])
    end
  end
end

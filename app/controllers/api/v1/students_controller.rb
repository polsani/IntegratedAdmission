module Api
  module V1
    class StudentsController < ApplicationController
      def create
        @student = Student.new(student_params)

        @student.admission_approved = false

        if @student.grade_enem >= 450 #TODO implements upload and validation for document image
          @student.admission_approved = true
        end

        @student.save
      end

      def show
        @student = Student.find(params[:id])
        render json: @student
      end

      def index
        @students = Student.all

        render json: @students
      end

      private

        def student_params
          params.require(:student).permit(:name, :tax_id, :grade_enem, emails_attributes: [ :email ])
        end
    end
  end
end


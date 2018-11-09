module Api
  module V1
    class StudentsController < ApplicationController
      def create
        @student = Student.new(student_params)

        @student.save
      end

      def show
        @student = Student.find(params[:id])
        render json: @student
      end

      private

        def student_params
          params.require(:student).permit(:name, :tax_id, :grade_enem, emails_attributes: [ :email ])
        end
    end
  end
end


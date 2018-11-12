module Api
  module V1
    class RegistrationsController < ApplicationController

      def create
        @registration = Registration.new(registration_params)

        #if @registration.invoice_amount > 12
        #  render json:
        #end

        @invoice_value = @registration.value / @registration.invoice_amount

        @current_day = Date.today.day
        @current_month = Date.today.month
        @current_year = Date.today.year

        for i in 1..@registration.invoice_amount
          @invoice = Invoice.create

          @invoice.sequence = i
          @invoice.value = @invoice_value
          @invoice.payment_way_id = @registration.payment_way_id

          @due_date = Date.new(@current_year, @current_month, @registration.best_day_to_pay)
          @due_date = @due_date + (i - 1).month

          if @current_day > @registration.best_day_to_pay
            @due_date = @due_date + 1.month
          end

          @invoice.due_date = @due_date

          @registration.invoices << @invoice
        end

        if !@registration.save
          render json: @registration.errors, status: 422
        end
      end

      def show
        @registration = Registration.find(params[:id])

        render json: @registration
      end

      def index
        @registrations = Registration.all

        render json: @registrations
      end

      private

      def registration_params
        params.require(:registration).permit(:value, :best_day_to_pay, :invoice_amount, :student_id, :payment_way_id)
      end

    end
  end
end


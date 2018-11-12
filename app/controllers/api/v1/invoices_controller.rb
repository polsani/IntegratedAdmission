module Api
  module V1
    class InvoicesController < ApplicationController

      def show
        @invoice = Invoice.find(params[:id])

        render json: @invoice
      end

      #TODO implements update invoice
    end
  end
end

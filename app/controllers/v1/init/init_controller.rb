module V1
  module Init
    class InitController < ApplicationController
      def index
        render json: { status: 'ok', message: 'Hi' }, status: :ok
      end
    end
  end
end
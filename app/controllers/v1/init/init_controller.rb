# frozen_string_literal: true

module V1
  module Init
    # Health controller
    class InitController < ApplicationController
      def index
        render json: { status: 'ok', message: 'Hi' }, status: :ok
      end
    end
  end
end

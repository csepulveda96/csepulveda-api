# frozen_string_literal: true

module V1
  module Texts
    # Controller to get translations from i18n
    class TranslationsController < ApplicationController
      # GET /v1/texts/translations?language=
      def index
        response = ::Texts::TranslationsService.new(language: params[:language]).perform

        render json: response, status: response[:httpstatus]
      end
    end
  end
end

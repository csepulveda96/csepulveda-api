# frozen_string_literal: true

module Texts
  # Service to return translations
  class TranslationsService
    attr_accessor :language

    def initialize(language:)
      @language = language
    end

    def perform
      return i18n_not_available unless language_available?

      I18n.locale = language.to_sym

      data = build_translations

      build_hash(data: data)
    rescue StandardError => e
      hash = build_hash(error: true, httpstatus: :internal_server_error)

      hash[:message] = error_message(e.message.to_s)

      hash
    end

    private

    def build_translations
      {
        headers: build_header,
        body: build_body
      }
    end

    def build_header
      I18n.t('header')
    end

    def build_body
      I18n.t('body')
    end

    def language_available?
      I18n.available_locales.include?(language.to_sym)
    end

    def i18n_not_available
      hash = build_hash(error: true, httpstatus: :unprocessable_entity)

      hash[:message] = not_available

      hash
    end

    def build_hash(error: false, httpstatus: :ok, data: [])
      {
        error: error,
        message: nil,
        httpstatus: httpstatus,
        data: data
      }
    end

    def error_message(text)
      I18n.t('messages.error', error: text)
    end

    def not_available
      I18n.t('messages.language_not_available', lang: language)
    end
  end
end

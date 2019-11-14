# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'static_pages/home'
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/about'
  get 'static_pages/contact'
end

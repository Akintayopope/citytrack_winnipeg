# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap" # @5.3.7
pin "@popperjs/core", to: "@popperjs--core.js" # @2.11.8
pin_all_from "app/javascript/images", under: "images"
pin "chartkick" # @5.0.1

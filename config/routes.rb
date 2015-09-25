Rails.application.routes.draw do
  root "home#welcome"

  get "/code-of-conduct", to: "home#code_of_conduct"

end

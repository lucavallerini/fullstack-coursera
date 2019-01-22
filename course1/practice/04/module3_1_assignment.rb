require 'httparty'

class Recipe
   include HTTParty

   base_uri "http://food2fork.com/api"
   default_params key: ENV["FOOD2FORK_KEY"]
   format :json

   def self.for(keyword)
      get(base_uri + "/search", { query: default_params.merge({q: keyword}) })['recipes']
   end
end

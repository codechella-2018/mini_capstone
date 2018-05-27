require 'unirest'

products = Unirest.get("http://localhost:3000/api/products_url").body

puts JSON.pretty_generate(products)
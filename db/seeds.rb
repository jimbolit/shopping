# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all

Product.destroy_all

User.destroy_all

Order.destroy_all

breakfast = Category.create([{
    name: "Breakfast",
    image: "breakfast.jpg"
}])

lunch = Category.create([{
    name: "Lunch",
    image: "lunchsam.jpg"
}])

dinner = Category.create([{
    name: "Dinner Ingredients",
    image: "dinner.jpg"
    }])

kitchen = Category.create([{
    name: "Kitchen Essentials",
    image: "essentials.jpg"
    }])

non_food = Category.create([{
    name: "Non-Food",
    image: "toiletpaper.jpg"
    }])
 
pharmacy = Category.create([{
    name: "Pharmacy",
    image: "pharmacy.jpg"
    }])
    
Product.create([{
    name: "Sanitarium Weetbix Wheat Biscuits", 
    amount: "1.2Kg",
    image: "weetbix12kg.jpg",
    price: 7.60,
    category_id: breakfast[0]["id"]
    }])

Product.create([{
    name: "Meadow Fresh Uht Milk Standard Long Life 1L", 
    amount: "1L",
    image: "mf_uht_std_1l.jpg",
    price: 2.89,
    category_id: breakfast[0]["id"]
    }])

Product.create([{
    name: "Sanitarium Skippy Cornflakes", 
    amount: "1L",
    image: "skippycornflakes500g.jpg",
    price: 4.30,
    category_id: breakfast[0]["id"]
    }])

Product.create([{
    name: "Golden Crumpets Rounds 300g", 
    amount: "300g",
    image: "goldencrumpets.jpg",
    price: 2.20,
    category_id: breakfast[0]["id"]
    }])

Product.create([{
    name: "Sanitarium Marmite Yeast Spread", 
    amount: "500g",
    image: "marmite500.jpg",
    price: 7.29,
    category_id: breakfast[0]["id"]
    }])

Product.create([{
    name: "Kelloggs Nutrigrain Cereal
    Volume 805g", 
    amount: "805g",
    image: "nutrigrain805.jpg",
    price: 10.00,
    category_id: breakfast[0]["id"]
    }])

Product.create([{
    name: "Molenberg Toast Bread Original", 
    amount: "700g",
    image: "Molenberg-Toast-Bread-Original.jpg",
    price: 3.40,
    category_id: lunch[0]["id"]
    }])

Product.create([{
    name: "Best Foods Mayonnaise Real 405g", 
    amount: "405g",
    image: "best-foods-mayonnase-405.jpg",
    price: 5.00,
    category_id: lunch[0]["id"]
    }])

Product.create([{
    name: "San Remo Pasta Spaghetti pkt", 
    amount: "500g",
    image: "san-remo-spaghetti.jpg",
    price: 3.99,
    category_id: dinner[0]["id"]
    }])

Product.create([{
    name: "Wattie's Pasta Sauce Traditional Garlic", 
    amount: "420g",
    image: "watties-tomato-sauce-garlic.jpg",
    price: 2.50,
    category_id: dinner[0]["id"]
    }])

Product.create([{
    name: "Olivani Olive Oil Pure 1l", 
    amount: "1L",
    image: "olivani-olive-oil.jpg",
    price: 13.00,
    category_id: kitchen[0]["id"]
    }])

Product.create([{
    name: "Cerebos Salt Iodised Table Drum 300g", 
    amount: "300g",
    image: "cerebos-salt.jpg",
    price: 1.69,
    category_id: kitchen[0]["id"]
    }])

Product.create([{
    name: "Quilton Toilet Paper 18pk White Unscented", 
    amount: "18pk",
    image: "quilton-toilet-paper-18.jpg",
    price: 10.99,
    category_id: non_food[0]["id"]
    }])

Product.create([{
    name: "Handee Paper Towels White 2pk", 
    amount: "2pk",
    image: "handee-paper-towels.jpg",
    price: 3.50,
    category_id: non_food[0]["id"]
    }])

james = User.create([{
    first_name: "James", 
    last_name: "Little",
    email: "jameslittle@outlook.co.nz",
    password: "trigger",
    mobile_number: "02102377971",
    address: "6 Kowhai Street, Grey Lynn, Aucland, 1024, New Zealand"
    }])
   
  Order.create([{
      address: james[0]["address"],
      first_name: james[0]["first_name"],
      last_name: james[0]["last_name"],
      email: james[0]["email"],
      phone_number: james[0]["mobile_number"],
      total: 20.00,
      text: "",
      comments: "Leave at the door if I'm not there",
      user_id: james[0]["id"]
    }])  
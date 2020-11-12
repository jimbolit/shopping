# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all

Category.create([{
    name: "Breakfast",
    image: "breakfast.jpg"
}])

Category.create([{
    name: "Lunch",
    image: "lunchsam.jpg"
}])

Category.create([{
    name: "Dinner Ingredients",
    image: "dinner.jpg"
    }])

Category.create([{
    name: "Kitchen Essentials",
    image: "essentials.jpg"
    }])

Category.create([{
    name: "Non-Food",
    image: "toiletpaper.jpg"
    }])
 
Category.create([{
    name: "Pharmacy",
    image: "pharmacy.jpg"
    }])

Products.create([{
    name: "Pharmacy",
    image: "pharmacy.jpg"
    }])

        
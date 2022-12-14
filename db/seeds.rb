coffees = [
  {
    name: 'Praline Latte',
    size: "6 ounces",
    milk_type: 'Almond milk',
    bio: "I'm double nutty, but in a good way!",
    image: 'https://media.istockphoto.com/id/505168330/photo/cup-of-cafe-latte-with-coffee-beans-and-cinnamon-sticks.jpg?s=612x612&w=0&k=20&c=h7v8kAfWOpRapv6hrDwmmB54DqrGQWxlhP_mTeqTQPA='
  },
  {
    name: 'Caramel Macchiato',
    size: '12 ounces',
    milk_type: 'Oat milk',
    bio: "I'm sweet, creamy, and to the point, ohweeeeee!",
    image: 'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80'
  },
  {
    name: 'Dopio',
    size: '1.5 ounces',
    milk_type: 'NONE',
    bio: "A double shot of Italian strength🤌.. that's all you need to know",
    image: 'https://coffeeatthree.com/wp-content/uploads/crema-recipe-500x500.jpg'
}
]

coffees.each do |each_coffee|
  Coffee.create each_coffee
  puts "creating coffee #{each_coffee}"
end
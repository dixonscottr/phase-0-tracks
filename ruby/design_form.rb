design_form = {
  :name => "Julia Sugarbaker",
  :address => "Atlanta, Georgia",
  :email => "julia@sugarbaker.com",
  :phone => "404-555-1212",
  :blue_shade => "cornflower",
  :wallpaper => "paisley",
  :ombre => "Practically medieval in its appalling irrelevance"
}

design_form[:hired] = true
design_form[:phone] = "404-555-1515"

p design_form

applicant_name = design_form[:name]

p applicant_name

p design_form[:name] + design_form[:address]

puts design_form.length

design_form["shoulder_pads"] = true
p design_form
puts design_form.length

design_form.store(:style, "80s realness")

p design_form
puts design_form.length


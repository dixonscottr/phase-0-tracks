fashion_show ={

  runway_one: {
    theme: "Bedazzaled Denim",
    hosts: {
      main_host: "Ryan Seacrest",
      backup_host: "Mylie Cyrus"
      },
    start_time: "18:00",
    sponsors: [],
    models: [
      "Vanessa Von Vanderdenim",
      "Gigi Jenesaisquoi",
      "Zahara Zanzibar"
      ]
    },

  runway_two: {
    theme: "1870s Bordello Realness",
    hosts: {
      main_host: "Matt Lauer",
      backup_host: "Johnny Knoxville"
      },
    start_time: "18:20",
    sponsors: [
      "Prilosec OTC",
      "Gogurt"
      ],
    models: [
      "Charlene Chartreuse",
      "Martha (from Accounting)",
      "Tara Tartlette"
      ]
    },

  runway_three: {
    theme: "Lancaster County Eleganza",
    hosts: {
      main_host: "Queen Latifah",
      backup_host: "Hillary Clinton"
      },
    start_time: "19:00",
    sponsors: [
      "Trudy's Salt Water Taffy"
      ],
    models: [
      "Miriam Maybelle",
      "Fannie Fransmith",
      "Jacqueline Jacobson"
      ]
  }

}

puts fashion_show[:runway_one]
puts fashion_show[:runway_two]
puts fashion_show[:runway_three]
alias LibraryApiWeb.Seeders.{
  PersonSeeder
}

#### Creating Persons

IO.puts "Seeding persons..."
person_data = [
  #1
  %{
    id: Ecto.UUID.generate(),
    first_name: "Rey",
    middle_name: "Kun",
    last_name: "Fideles",
    birth_date: "1994-01-01",
    id_type: "PRC",
    id_no: "123ABC",
    address: "Alimanguan, San Vicente, Palawan",
    contact_no: "09195454874"
  }
]

[person_1] = PersonSeeder.seed(person_data)
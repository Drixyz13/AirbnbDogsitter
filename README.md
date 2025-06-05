# 🐕 Dogsitter Airbnb

Welcome to the **Dogsitter Airbnb** project! This Ruby on Rails application simulates a platform where dogsitters can be matched with dogs for walks, all within specific cities.

---

## 📚 Project Overview

This application models four main entities:

- **Dog**: A pet available for walks.
- **Dogsitter**: A person offering dog walking services.
- **City**: Each dog and dogsitter belongs to a city.
- **Stroll**: Represents a walk between one dog and one dogsitter.

> A stroll belongs to one dog and one dogsitter.  
> A dog or dogsitter can have many strolls.  
> Dogs and dogsitters are assigned to a single city.

---

## ⚙️ Models and Associations

- `Dog`:
  - `name`, `breed`, `city_id`
  - `belongs_to :city`
  - `has_many :strolls`
  - `has_many :dogsitters, through: :strolls`

- `Dogsitter`:
  - `first_name`, `last_name`, `city_id`
  - `belongs_to :city`
  - `has_many :strolls`
  - `has_many :dogs, through: :strolls`

- `City`:
  - `name`
  - `has_many :dogs`
  - `has_many :dogsitters`

- `Stroll`:
  - `date`, `dog_id`, `dogsitter_id`
  - `belongs_to :dog`
  - `belongs_to :dogsitter`

---

## 🌱 Seed File

Run the following command to populate the database with fake data using [Faker](https://github.com/faker-ruby/faker):

```bash
rails db:drop db:create db:migrate db:seed
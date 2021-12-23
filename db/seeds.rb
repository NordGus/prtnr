# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Inventory::Unit::Amount.find_or_create_by(name: 'units')
Inventory::Unit::Amount.find_or_create_by(name: 'little spoons')

Inventory::Unit::Volumetric.find_or_create_by(name: 'kiloliters')
Inventory::Unit::Volumetric.find_or_create_by(name: 'centiliters')
Inventory::Unit::Volumetric.find_or_create_by(name: 'deciliters')
Inventory::Unit::Volumetric.find_or_create_by(name: 'liters')
Inventory::Unit::Volumetric.find_or_create_by(name: 'milliliters')
Inventory::Unit::Volumetric.find_or_create_by(name: 'cubic meters')

Inventory::Unit::Weight.find_or_create_by(name: 'kilograms')
Inventory::Unit::Weight.find_or_create_by(name: 'centigrams')
Inventory::Unit::Weight.find_or_create_by(name: 'decigrams')
Inventory::Unit::Weight.find_or_create_by(name: 'grams')
Inventory::Unit::Weight.find_or_create_by(name: 'pounds')

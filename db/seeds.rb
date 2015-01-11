# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 cities = City.create([{ name: 'Medellin' }, { name: 'Bogota' },{ name: 'Quibdó' },{ name: 'Cali' },{ name: 'Pereira' }])
states= State.create([{ name: 'Antioquia' }, { name: 'Cundinamarca' },{ name: 'Chocó' },{ name: 'Valle del Cauca' },{ name: 'Risaralda' }])
genres= Genre.create([{name: 'Masculino'},name: 'Femenino'])

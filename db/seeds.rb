# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Genre.create!(:name => "ケーキ")
Genre.create!(:name => "プリン")
Genre.create!(:name => "焼き菓子")
Genre.create!(:name => "キャンディ")

Item.create!(:genre_id => 1,:name =>" シェフこだわりのチーズケーキ ",:non_tax_price => 3000 ,:introduction =>" 当店自慢のこだわりのチーズケーキです。 ", :image => File.open('./app/assets/images/no_image.jpg'), :is_active => true)
Item.create!(:genre_id => 2,:name =>" シェフ大好き長野プリン ",:non_tax_price => 2000 ,:introduction =>" 当店限定のこだわりのプリンです。 ", :image => File.open('./app/assets/images/no_image.jpg'), :is_active => true)
Item.create!(:genre_id => 3,:name =>" シェフも食べたことある鳩サブレ ",:non_tax_price => 200 ,:introduction =>" 千葉県から直送の鳩サブレです。 ", :image => File.open('./app/assets/images/no_image.jpg'), :is_active => true)
Item.create!(:genre_id => 4,:name =>" キャンディ ",:non_tax_price => 20 ,:introduction =>" nil ", :image => File.open('./app/assets/images/no_image.jpg'), :is_active => false)


# admin
Admin.create!(:email => 'suuankou@yahoo.co.jp', :password => 'aaaaaa')
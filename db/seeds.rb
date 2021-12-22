# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#ジャンル

Genre.create!(:name => "ケーキ")
Genre.create!(:name => "プリン")
Genre.create!(:name => "焼き菓子")
Genre.create!(:name => "キャンディ")

#商品

Item.create!(:genre_id => 1,:name =>" シェフこだわりのチーズケーキ ",:non_tax_price => 3000 ,:introduction =>" 当店自慢のこだわりのチーズケーキです。", :image => File.open('./app/assets/images/no_image.jpg'), :is_active => true)
Item.create!(:genre_id => 2,:name =>" シェフ大好き長野プリン ",:non_tax_price => 2000 ,:introduction =>" 当店限定のこだわりのプリンです。 ", :image => File.open('./app/assets/images/no_image.jpg'), :is_active => true)
Item.create!(:genre_id => 3,:name =>" シェフも食べたことある鳩サブレ ",:non_tax_price => 200 ,:introduction =>" 千葉県から直送の鳩サブレです。 ", :image => File.open('./app/assets/images/no_image.jpg'), :is_active => true)
Item.create!(:genre_id => 4,:name =>" キャンディ ",:non_tax_price => 20 ,:introduction =>" nil ", :image => File.open('./app/assets/images/no_image.jpg'), :is_active => false)

# Item.create!(:genre_id => 1,:name =>"女王様のミックスベリータルト",:non_tax_price => 2100 ,:introduction =>"タルトの主役はフルーツ。その美味しさを最大限に活かすために「フルーツは山盛りで」が店主のこだわり。よくあるベリータルトに比べるとかさ高になっているのも、そのためです。タルトの生地も、クリームも全てタルトとの相性を考えて作り出した、自慢のクリームとタルトです。 ", :image => File.open(‘./app/assets/images/タルト_ベリータルト.jpg’), :is_active => true)
# Item.create!(:genre_id => 1,:name =>"地中海風ベジタブルタルト",:non_tax_price => 1700 ,:introduction =>"フランスの伝統的総菜タルトキッシュです。ランチやパーティで手軽にご利用ください。 冷凍のままオーブントースターで約15分温めてください。チェリートマト、ズッキーニ、パプリカ、 玉ねぎなど色鮮やかなたっぷりの具材をふんわりとした卵のやさしさでまとめてあり、食べ応えがあります。これ一つで充分な ボリュームです。 地中海風タルトの特徴 伝統的なフランスの惣菜料理キュッシュ 色鮮やかな野菜をふんだんに使用< ふんわりと卵でやさしくまとめてある 加熱済み食品である。 オーブントースターで冷凍のまま約15分 作りたての味わいを再現 ランチやパーティのつまみに。 ", :image => File.open(‘./app/assets/images/タルト_ネギタルト.jpg’), :is_active => true)
# Item.create!(:genre_id => 1,:name =>"おうちのアップルタルト ",:non_tax_price => 1100 ,:introduction =>"フレッシュなアップルを62％使用し、シャキシャキ食感が残っているアップルタルトです。さらに注目したいのが「人工着色料・人工香料・保存料」をまったく使用していないこと!!お子様も安心して食べられる、おやつや朝食にピッタリなスイーツなんです。 ", :image => File.open(‘./app/assets/images/タルト_アップルタルト.jpg’), :is_active => true)
# Item.create!(:genre_id => 3,:name =>"アメリカンチョコチップクッキー ",:non_tax_price => 450 ,:introduction =>"サクッと軽い歯ざわりのクッキー生地に、口どけの良いチョコチップをたっぷり練り込みました。チョコレート好きの方にもご満足いただける逸品です。", :image => File.open(‘./app/assets/images/焼き菓子_チョコクッキー.jpg’), :is_active => true)
# Item.create!(:genre_id => 3,:name =>"グルテンフリー米粉マフィン ",:non_tax_price => 400 ,:introduction =>"実店舗でリピーター様続出の、厳選素材を使用して焼き上げた、バナナたっぷりの甘さ控えめのマフィンです。その時に手に入る材料を使って、いろんな味のバリエーションをランダムに詰め合わせいたしますので、味はお楽しみになります。（卵、砂糖、乳製品不使用タイプもございます） ", :image => File.open(‘./app/assets/images/焼き菓子_マフィン.jpg’), :is_active => true)
# Item.create!(:genre_id => 3,:name =>"ほっと一息バームクーヘン ",:non_tax_price => 1200 ,:introduction =>"発売当初からご好評をいただいている定番商品 しっとりと口どけの良い食感 蜂蜜やメープルシロップをバランスよく配合したコクと甘さが特徴の生地を、絶妙なタイミングで一枚一枚、焼きながら巻きあげていくその層は、きめが細かくしっとりとした弾力ある口あたりに焼きあがります。シュガーコーティングして仕上げた側面は、食感のアクセント。 フード・スイーツ 洋菓子 バームクーヘン ", :image => File.open(‘./app/assets/images/焼き菓子_バームクーヘン.jpg’), :is_active => true)

# admin

Admin.create!(:email => 'suuankou@yahoo.co.jp', :password => 'aaaaaa')


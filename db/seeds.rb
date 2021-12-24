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

# Item.create!(:genre_id => 1,:name =>" シェフこだわりのチーズケーキ ",:non_tax_price => 3000 ,:introduction =>" 当店自慢のこだわりのチーズケーキです。", :image => File.open('./app/assets/images/no_image.jpg'), :is_active => true)
# Item.create!(:genre_id => 2,:name =>" シェフ大好き長野プリン ",:non_tax_price => 2000 ,:introduction =>" 当店限定のこだわりのプリンです。 ", :image => File.open('./app/assets/images/no_image.jpg'), :is_active => true)
# Item.create!(:genre_id => 3,:name =>" シェフも食べたことある鳩サブレ ",:non_tax_price => 200 ,:introduction =>" 千葉県から直送の鳩サブレです。 ", :image => File.open('./app/assets/images/no_image.jpg'), :is_active => true)
# Item.create!(:genre_id => 4,:name =>" キャンディ ",:non_tax_price => 20 ,:introduction =>" nil ", :image => File.open('./app/assets/images/no_image.jpg'), :is_active => false)

# CSV取り込み
# require "csv"

# CSV.foreach('db/item_date.csv', headers: true) do |row|
#   Item.create(
#     genre_id: row['genre_id'],
#     name: row['name'],
#     non_tax_price: row['non_tax_price'],
#     image_id: row['image_id'],
#     is_active: row["is_active"],
#     introduction: row["introduction"]
#   )
# end

Item.create!(:genre_id => 1,:name =>" 女王様のミックスベリータルト ",:non_tax_price => 2100 ,:introduction =>"タルトの主役はフルーツ。その美味しさを最大限に活かすために「フルーツは山盛りで」が店主のこだわり。よくあるベリータルトに比べるとかさ高になっているのも、そのためです。タルトの生地も、クリームも全てタルトとの相性を考えて作り出した、自慢のクリームとタルトです。 ", :image => File.open('./app/assets/images/タルト_ベリータルト.jpg'), :is_active => true)
Item.create!(:genre_id => 1,:name =>" 地中海風ベジタブルタルト ",:non_tax_price => 1700 ,:introduction =>"フランスの伝統的総菜タルトキッシュです。ランチやパーティで手軽にご利用ください。 チェリートマト、ズッキーニ、パプリカ、 玉ねぎなど色鮮やかなたっぷりの具材をふんわりとした卵のやさしさでまとめてあり、食べ応えがあります。これ一つで充分な ボリュームです。 地中海風タルトの特徴 伝統的なフランスの惣菜料理キュッシュ 色鮮やかな野菜をふんだんに使用< ふんわりと卵でやさしくまとめてある 加熱済み食品である。 ", :image => File.open('./app/assets/images/タルト_ネギタルト.jpg'), :is_active => true)
Item.create!(:genre_id => 1,:name =>" おうちのアップルタルト ",:non_tax_price => 1100 ,:introduction =>"フレッシュなアップルを62％使用し、シャキシャキ食感が残っているアップルタルトです。さらに注目したいのが「人工着色料・人工香料・保存料」をまったく使用していないこと!!お子様も安心して食べられる、おやつや朝食にピッタリなスイーツなんです。 ", :image => File.open('./app/assets/images/タルト_アップルタルト.jpg'), :is_active => true)
Item.create!(:genre_id => 3,:name =>" アメリカンチョコチップクッキー ",:non_tax_price => 450 ,:introduction =>"サクッと軽い歯ざわりのクッキー生地に、口どけの良いチョコチップをたっぷり練り込みました。チョコレート好きの方にもご満足いただける逸品です。 ", :image => File.open('./app/assets/images/焼き菓子_チョコクッキー.jpg'), :is_active => true)
Item.create!(:genre_id => 3,:name =>" グルテンフリー米粉マフィン ",:non_tax_price => 400 ,:introduction =>"実店舗でリピーター様続出の、厳選素材を使用して焼き上げた、バナナたっぷりの甘さ控えめのマフィンです。その時に手に入る材料を使って、いろんな味のバリエーションをランダムに詰め合わせいたしますので、味はお楽しみになります。（卵、砂糖、乳製品不使用タイプもございます） ", :image => File.open('./app/assets/images/焼き菓子_マフィン.jpg'), :is_active => true)
Item.create!(:genre_id => 3,:name =>" ほっと一息バームクーヘン ",:non_tax_price => 1200 ,:introduction =>"発売当初からご好評をいただいている定番商品 しっとりと口どけの良い食感 蜂蜜やメープルシロップをバランスよく配合したコクと甘さが特徴の生地を、絶妙なタイミングで一枚一枚、焼きながら巻きあげていくその層は、きめが細かくしっとりとした弾力ある口あたりに焼きあがります。シュガーコーティングして仕上げた側面は、食感のアクセント。 フード・スイーツ 洋菓子 バームクーヘン ", :image => File.open('./app/assets/images/焼き菓子_バームクーヘン.jpg'), :is_active => true)
Item.create!(:genre_id => 2,:name =>"天空のプリン雅",:non_tax_price => 2980 ,:introduction =>"天空のプリン雅（みやび）は、北海道産生クリームを贅沢に使用し、濃厚かつクリーミーに仕上げました。ヒルナンデス！で紹介された人気のお取り寄せスイーツです。おいしさの秘密は、宮古島の雪塩を使用したキャラメルソースのかすかな塩味。バニラプリンの濃厚な甘味と相まって、おいしさがお口いっぱいに広がります。", :image => File.open('./app/assets/images/豪華なプリン.JPG'), :is_active => true)
Item.create!(:genre_id => 2,:name =>"ウフウフガーデンのとろ生プリン",:non_tax_price => 1300 ,:introduction =>"バニラビーンズをたっぷり使用しており、豊かな香りとたまごの濃厚な旨みが感じられます。直営農場から届く採れたての新鮮なたまごを使用。たまご本来の濃厚な甘みとなめらかな口どけが感じられます。山形県の大自然の中で生産された生乳100％。自然なおいしさがたまごの甘みとコクを引き立てます。深みのある味わいと優しい香りを持ち、マイルドで甘く豊かな香りでキャラメルのような風味があるのが楽しめます。", :image => File.open('./app/assets/images/チョコプリン.JPG'), :is_active => true)
Item.create!(:genre_id => 2,:name =>"彩果の恵み",:non_tax_price => 700 ,:introduction =>"りんご、ぶどう、洋梨、マンゴ、もも、レッドグレープフルーツ、苺、オレンジ 各1個入り。1瓶につき約100億個の乳酸菌が入り。一般的な甘味料よりもヘルシーな希少糖を配合。水分少なめのコクのあるヨーグルト、塩分が感じられるフランス産チーズ、濃厚なカスタードクリームを絶妙に配合することで、滑らかな舌触りを実現しています。", :image => File.open('./app/assets/images/いちごのプリン.jpeg'), :is_active => true)
Item.create!(:genre_id => 4,:name =>"飴のつどい",:non_tax_price => 500 ,:introduction =>"天空のプリン雅（みやび）は、北海道産生クリームを贅沢に使用し、濃厚かつクリーミーに仕上げました。ヒルナンデス！で紹介された人気のお取り寄せスイーツです。おいしさの秘密は、宮古島の雪塩を使用したキャラメルソースのかすかな塩味。バニラプリンの濃厚な甘味と相まって、おいしさがお口いっぱいに広がります。", :image => File.open('./app/assets/images/屋台の飴.jpeg'), :is_active => true)
Item.create!(:genre_id => 4,:name =>"みぞれ玉",:non_tax_price => 300 ,:introduction =>"人気のフルーツ(イチゴ、レモン、グレープ、オレンジ)に爽やかサイダー味カキ氷をイメージしたザラメ砂糖掛けの大粒キャンディです昔なつかしいイメージを残しました。", :image => File.open('./app/assets/images/ドロップ.JPG'), :is_active => true)
Item.create!(:genre_id => 4,:name =>"フルーツキャンディ",:non_tax_price => 200 ,:introduction =>"1977年創業のドイツのキャンディーメーカー、カベンディッシュ&ハーベイ。果実そのものを食べているかのようなみずみずしくピュアな味わいが特徴です。どこか懐かしい味わいと、かわいらしく高級感のあるパッケージで老若男女問わず世界中約80ヵ国以上で愛されています。", :image => File.open('./app/assets/images/棒付き飴.JPG'), :is_active => true)

# admin

Admin.create!(:email => 'suuankou@yahoo.co.jp', :password => 'aaaaaa')

# customer

Customer.create!(:last_name => "東家",:first_name => "萬子",:kana_last_name => "トンチャ",:kana_first_name => "ワンズ",:post_code => "1638001",:address => "東京都新宿区西新宿2-8-1",:phone_number => "0353211111",:email => "0@gmail.com",:password => "000000",:is_deleted => false)
Customer.create!(:last_name => "南家",:first_name => "筒子",:kana_last_name => "ナンチャ",:kana_first_name => "ピンズ",:post_code => "9008570",:address => "沖縄県那覇市泉崎1-2-2",:phone_number => "0988662333",:email => "00@gmail.com",:password => "000000",:is_deleted => false)
Customer.create!(:last_name => "西家",:first_name => "索子",:kana_last_name => "シャーチャ",:kana_first_name => "ソーズ",:post_code => "8128577",:address => "福岡県福岡市博多区東公園7番7号",:phone_number => "0926511111",:email => "000@gmail.com",:password => "000000",:is_deleted => false)
Customer.create!(:last_name => "北家",:first_name => "字牌",:kana_last_name => "ペイチャ",:kana_first_name => "ジハイ",:post_code => "0608588",:address => "札幌市中央区北3条西6丁目",:phone_number => "0112314111",:email => "0000@gmail.com",:password => "000000",:is_deleted => false)

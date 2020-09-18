# ユーザーデータの生成
User.create!(name: "Daichi Ozaki",
             sex: 1,
             email: "example@locker.org",
             password: "foobar",
             password_confirmation: "foobar",
             birthday: Date.new(1994, 2, 13),
             occupation: "フリーター",
             prefecture_code: 13,
             state: '東京都',
             city: '北区',
             street: '西ヶ原4-50-7',
             house: 'ハイツボナール101号室',
             user_apparause_point: 3.0,
             admin: 1)

User.create!(name: "尾崎　大地",
             sex: 1,
             email: "d.ozaki@locker.org",
             password: "password",
             password_confirmation: "password",
             birthday: Date.new(1994, 2, 13),
             occupation: "会社員",
             prefecture_code: 12,
             state: '千葉県',
             city: '千葉市',
             street: '中央区東千葉2-5-22',
             house: 'リブリメゾン雅208号室',
             user_apparause_point: 3.0)

User.create!(name: "舘　ひろし",
             sex: 1,
             email: "h.tachi@locker.org",
             password: "password",
             password_confirmation: "password",
             birthday: Date.new(1950, 3, 31),
             occupation: "俳優",
             prefecture_code: 13,
             state: '東京都',
             city: '世田谷区',
             street: '桜丘5-8-22',
             house: 'グリーンヒル101号室',
             user_apparause_point: 3.0)

User.create!(name: "宮川　大輔",
             sex: 1,
             email: "d.miyagawa@locker.org",
             password: "password",
             password_confirmation: "password",
             birthday: Date.new(1972, 9, 16),
             occupation: "お笑い芸人",
             prefecture_code: 13,
             state: '東京都',
             city: '文京区',
             street: '小石川3-17',
             user_apparause_point: 3.0)

User.create!(name: "山下　きよし",
             sex: 1,
             email: "k.yamashita@locker.org",
             password: "password",
             password_confirmation: "password",
             birthday: Date.new(1922, 3, 10),
             occupation: "画家",
             prefecture_code: 13,
             state: '東京都',
             city: '渋谷区',
             street: '神宮前1-15-6',
             house: 'ピロティ原宿',
             user_apparause_point: 3.0)

User.create!(name: "福沢　諭吉",
             sex: 1,
             email: "y.fukuzawa@locker.org",
             password: "password",
             password_confirmation: "password",
             birthday: Date.new(1835, 1, 10),
             occupation: "武士",
             prefecture_code: 13,
             state: '東京都',
             city: '芝区',
             street: '三田2',
             user_apparause_point: 5.0)

User.create!(name: "ビッグダディ",
             sex: 1,
             email: "d.bigdaddy@locker.org",
             password: "password",
             password_confirmation: "password",
             birthday: Date.new(1972, 9, 16),
             occupation: "専業主夫",
             prefecture_code: 13,
             state: '東京都',
             city: '渋谷区',
             street: '東1-10-10',
             user_apparause_point: 3.0)

User.create!(name: "一宮　隆",
             sex: 1,
             email: "t.ichinomiya@locker.org",
             password: "password",
             password_confirmation: "password",
             birthday: Date.new(1972, 9, 16),
             occupation: "会社役員",
             prefecture_code: 13,
             state: '東京都',
             city: '渋谷区',
             street: '東2-27-1',
             user_apparause_point: 3.0)

User.create!(name: "山田　浩貴",
             sex: 1,
             email: "h.yamada@jnc-corp.co.jp",
             password: "password",
             password_confirmation: "password",
             birthday: Date.new(1992, 9, 16),
             occupation: "会社員",
             prefecture_code: 13,
             state: '東京都',
             city: '渋谷区',
             street: '代官山町3-3',
             house: 'ソミュール代官山',
             user_apparause_point: 3.0)

User.create!(name: "戸田　啓太",
             sex: 1,
             email: "k.toda@locker.org",
             password: "password",
             password_confirmation: "password",
             birthday: Date.new(1993, 9, 29),
             occupation: "会社員",
             prefecture_code: 13,
             state: '東京都',
             city: '渋谷区',
             street: '道玄坂1-17-3',
             house: '第２野々ビル',
             user_apparause_point: 3.0)

User.create!(name: "佐々木　智子",
             sex: 0,
             email: "t.sasaki@locker.org",
             password: "password",
             password_confirmation: "password",
             birthday: Date.new(1990, 4, 13),
             occupation: "弁護士",
             prefecture_code: 13,
             state: '東京都',
             city: '渋谷区',
             street: '南平台町5-6',
             house: '東急南平台町ビル',
             user_apparause_point: 3.0)

User.create!(name: "平野　はるか",
             sex: 0,
             email: "h.hirano@locker.org",
             password: "password",
             password_confirmation: "password",
             birthday: Date.new(1996, 6, 30),
             occupation: "会社員",
             prefecture_code: 13,
             state: '東京都',
             city: '渋谷区',
             street: '神泉町12-5',
             house: 'ジェイパーク渋谷神泉',
             user_apparause_point: 3.0)

User.create!(name: "中島　愛菜",
             sex: 0,
             email: "a.nakashima@locker.org",
             password: "password",
             password_confirmation: "password",
             birthday: Date.new(1950, 3, 31),
             occupation: "俳優",
             prefecture_code: 13,
             state: '東京都',
             city: '世田谷区',
             street: '桜丘5-8-22',
             house: 'グリーンヒル101号室',
             user_apparause_point: 3.0)

User.create!(name: "宮里　大貴",
             sex: 1,
             email: "d.miyasato@locker.org",
             password: "password",
             password_confirmation: "password",
             birthday: Date.new(1972, 9, 16),
             occupation: "飲食店店長",
             prefecture_code: 13,
             state: '東京都',
             city: '渋谷区',
             street: '道玄坂2-25-14',
             user_apparause_point: 3.0)

User.create!(name: "山崎　亮太",
             sex: 1,
             email: "r.yamasaki@locker.org",
             password: "password",
             password_confirmation: "password",
             birthday: Date.new(1922, 3, 10),
             occupation: "画家",
             prefecture_code: 13,
             state: '東京都',
             city: '渋谷区',
             street: '道玄坂1-15-17',
             house: 'セントラル道玄坂',
             user_apparause_point: 3.0)

User.create!(name: "安藤　裕翔",
             sex: 1,
             email: "y.ando@locker.org",
             password: "password",
             password_confirmation: "password",
             birthday: Date.new(1835, 1, 10),
             occupation: "会社員",
             prefecture_code: 13,
             state: '東京都',
             city: '渋谷区',
             street: '南平台町13-1',
             house: '南平台佐藤ビル',
             user_apparause_point: 5.0)

User.create!(name: "鈴木　悠斗",
             sex: 1,
             email: "y.yuto@locker.org",
             password: "password",
             password_confirmation: "password",
             birthday: Date.new(1972, 9, 16),
             occupation: "パート",
             prefecture_code: 13,
             state: '東京都',
             city: '渋谷区',
             street: '神泉町12-6',
             house: '小松ビル',
             user_apparause_point: 3.0)

User.create!(name: "西森　健太",
             sex: 1,
             email: "k.nishimori@locker.org",
             password: "password",
             password_confirmation: "password",
             birthday: Date.new(1972, 12, 16),
             occupation: "会社員",
             prefecture_code: 13,
             state: '東京都',
             city: '渋谷区',
             street: '神泉町11-8',
             house: '梅山ビル',
             user_apparause_point: 3.0)

User.create!(name: "相田　悟",
             sex: 1,
             email: "s.aida@jnc-corp.co.jp",
             password: "password",
             password_confirmation: "password",
             birthday: Date.new(1990, 9, 16),
             occupation: "アパート経営者",
             prefecture_code: 13,
             state: '東京都',
             city: '渋谷区',
             street: '神泉町12-7',
             house: 'キング荘',
             user_apparause_point: 3.0)

User.create!(name: "山口　咲",
             sex: 0,
             email: "s.yamaguchi@locker.org",
             password: "password",
             password_confirmation: "password",
             birthday: Date.new(1993, 8, 29),
             occupation: "会社員",
             prefecture_code: 13,
             state: '東京都',
             city: '渋谷区',
             street: '神泉町22-6',
             house: '渋谷MKBLD',
             user_apparause_point: 3.0)

# 99.times do |n|
#     name = ForgeryJa(:name).full_name
#     sex = [0, 1]
#     email = ForgeryJa(:email).address
#     password = "password"
#     birthday = ForgeryJa(:date).date
#     occupation = ForgeryJa(:name).job_title
#     state = ForgeryJa(:address).state
#     city = ForgeryJa(:address).city
#     street = ForgeryJa(:address).street_name + ForgeryJa(:address).street_number
#     user_apparause_point = Random.rand(5)
#     User.create!(name: name,
#                 sex: sex.sample,
#                 email: email,
#                 password: password,
#                 password_confirmation: password,
#                 birthday: birthday,
#                 occupation: occupation,
#                 state: state,
#                 city: city,
#                 street: street,
#                 user_apparause_point: user_apparause_point)
# end

# 以下、belogns_to,belongs_toの対応付のためcreate!メソッド使えず
users = User.order(:created_at).take(10)
size = [30, 60, 100, 150]
users.each do |user|
  about_baggage_size_w = size.sample
  about_baggage_size_l = size.sample
  about_baggage_size_h = size.sample
  user.create_receivable_baggages!(about_baggage_size_w: about_baggage_size_w,
                                   about_baggage_size_l: about_baggage_size_l,
                                   about_baggage_size_h: about_baggage_size_h)
end

# BaggageRequest用
users = User.order(:created_at).take(10)
at_now = Time.zone.now
at_now_plus_1_month = at_now + 1.month
baggage_contents = ["服", "割れ物", "家電", "本", "重量物"]
request_contents = ["傷が入りやすい品物もありますので、棚の上などに保管願います。",
                    "少し重い品物になりますので、脆いものの上などに置かないよう注意して下さい。",
                    "日光になるべく当てたくないので、暗所での保管をお願い致します。",
                    "振動に弱い品物がありますので、振動する機械のそばに置かないよう願います。"]
transaction_messages = ["こんにちは、取引よろしくお願いします。",
                        "荷物を取りに行く時間がはっきりと確定していないので、取引時間にある程度融通のきく方歓迎致します。",
                        "品物への匂い移りのため、荷物に匂いがつく範囲での喫煙はご遠慮下さい"]
size = [30, 60, 100, 150]

users.each do |user|
  rand_time = Time.at(rand(at_now..at_now_plus_1_month))
  point = [0.0, 0.5, 1.0, 1.5, 2.0, 2.5,
           3.0, 3.5, 4.0, 4.5, 5.0]
  request =
    user.active_requires.create!(
      from_time: rand_time,
      to_time: rand_time + 3.hour,
      request_content: request_contents.sample,
      baggage_content: baggage_contents.sample,
      transaction_message: transaction_messages.sample,
      about_baggage_size_w: size.sample,
      about_baggage_size_l: size.sample,
      about_baggage_size_h: size.sample,
      leaver_start_authenticate: 0,
      receiver_start_authenticate: 0,
      leaver_end_authenticate: 0,
      receiver_end_authenticate: 0,
      transaction_started_at: rand_time,
      transaction_terminated_at: rand_time + 3.hour,
      leaver_point: point.sample,
      receiver_point: point.sample,
      approval_flag: 0,
      cancelled_flag: 0
    )
  10.times do |n|
    request.to_users.create!(required_id: n + 1,
                             requires_id: user.id,
                             del_flag: 0) if user.id != n + 1
  end
end

# users = User.order(:created_at).take(6)
# 50.times do
#     content = Faker::Lorem.sentence(5)
#     users.each{ |user| user.microposts.create!(content: content)}
# end

# Message
message_list = [
  ["こんにちは、リクエスト頂きありがとうございます。",
   "こんにちは、こちらこそリクエスト受けて頂きありがとうございます。",
   "非常に申し訳ないのですが、リクエスト時間より少し早めに到着するかもしれないのですが、対応いただけますでしょうか？",
   "はい！30分前後であれば問題ないので、リクエスト頂いた時間の±30分で荷物をお預け頂ければ幸いです。",
   "了解致しました。よろしくお願いいたします。",
   "とんどもありません。お待ちしています！"],
  [1, 2, 2, 1, 2, 1]
]

user1 = User.first
user2 = User.second

message_list[0].each_with_index do |message, idx|
  user2.active_request.find_by(
    required_id: user1.id
  ).messages.create(
    content: message,
    user_id: message_list[1][idx],
    read_flag: 0,
    del_flag: 0,
  )
end

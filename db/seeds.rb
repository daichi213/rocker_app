
# ユーザーデータの生成
User.create!(name: "Daichi Ozaki",
            sex: 1,
            email: "example@locker.org",
            password: "foobar",
            password_confirmation: "foobar",
            birthday: Date.new(1994, 2, 13),
            occupation: "フリーター",
            address: "東京都北区西ヶ原4-50-7",
            user_apparause_point: 3.0,
            admin: 1)

99.times do |n|
    name = ForgeryJa(:name).full_name
    sex = [0, 1]
    email = ForgeryJa(:email).address
    password = "password"
    birthday = ForgeryJa(:date).date
    occupation = ForgeryJa(:name).job_title
    address = ForgeryJa(:address).full_address
    user_apparause_point = Random.rand(5)
    User.create!(name: name,
                sex: sex.sample,
                email: email,
                password: password,
                password_confirmation: password,
                birthday: birthday,
                occupation: occupation,
                address: address,
                user_apparause_point: user_apparause_point)
end

# size = [30, 60, 100, 150]
# 100.times do |n|
#     about_baggage_size_w = size.sample
#     about_baggage_size_l = size.sample
#     about_baggage_size_h = size.sample
#     Baggage.create!(user_id: n+1,
#                     about_baggage_size_w: about_baggage_size_w,
#                     about_baggage_size_l: about_baggage_size_l,
#                     about_baggage_size_h: about_baggage_size_h)
# end

# 以下、belogns_to,belongs_toの対応付のためcreate!メソッド使えず
users = User.order(:created_at).take(100)
size = [30, 60, 100, 150]
users.each do |user|
    about_baggage_size_w = size.sample
    about_baggage_size_l = size.sample
    about_baggage_size_h = size.sample
    user.create_receivable_baggages!(about_baggage_size_w: about_baggage_size_w,
                                    about_baggage_size_l: about_baggage_size_l,
                                    about_baggage_size_h: about_baggage_size_h)
end

# users = User.order(:created_at).take(6)
# 50.times do 
#     content = Faker::Lorem.sentence(5)
#     users.each{ |user| user.microposts.create!(content: content)}
# end
module UsersHelper
    def search_circumference(range, lat, lng)
        # User model 側で記述
        User.within(range, origin: [lng, lat])
    end

    def search_closest(lat, lng)
        User.closest(origin: [lat, lng])
    end

    def distance(lat1, lng1, lat2, lng2)
        # ラジアン単位に変換
        x1 = lat1.to_f * Math::PI / 180
        y1 = lng1.to_f * Math::PI / 180
        x2 = lat2.to_f * Math::PI / 180
        y2 = lng2.to_f * Math::PI / 180
   
        # 地球の半径 (km)
        radius = 6378.137
   
        # 差の絶対値
        diff_y = (y1 - y2).abs
   
        calc1 = Math.cos(x2) * Math.sin(diff_y)
        calc2 = Math.cos(x1) * Math.sin(x2) - Math.sin(x1) * Math.cos(x2) * Math.cos(diff_y)
   
        # 分子
        numerator = Math.sqrt(calc1 ** 2 + calc2 ** 2)
   
        # 分母
        denominator = Math.sin(x1) * Math.sin(x2) + Math.cos(x1) * Math.cos(x2) * Math.cos(diff_y)
   
        # 弧度
        degree = Math.atan2(numerator, denominator)
   
        # 大円距離 (km)
        degree * radius
      end
   
end

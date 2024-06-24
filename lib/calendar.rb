# Dateクラスを使って、今月の１日と月末の日付と曜日を求め、次のような形式でカレンダーを表示させてください。

#  April 2013
#  Su Mo Tu We Th Fr Sa
#      1  2  3  4  5  6
#   7  8  9 10 11 12 13
#  14 15 16 17 18 19 20
#  21 22 23 24 25 26 27
#  28 29 30

require 'date'

def main
  today = Date.today
  first_day_of_month = Date.new(today.year, today.month, 1)
  last_day_of_month = Date.new(today.year, today.month + 1, 1) - 1

  calendar = build_calendar(first_day_of_month, last_day_of_month)
  render_calendar(today, calendar)
end

def build_calendar(first_day, last_day)
  calendar = []
  week = Array.new(first_day.cwday, "  ") # 一週目を初期化

  (1..last_day.day).each do |day|
    week << day.to_s.rjust(2)
    if week.length == 7
      calendar << week
      week = []
    end
  end
  calendar << week.fill("  ", week.length...7) unless week.empty?

  calendar
end

def render_calendar(today, calendar)
  puts today.strftime(format="%B %Y")
  puts ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'].join(" ")
  calendar.each do |w|
    puts w.join(" ")
  end
end


main

officer_array = [ "なし", "交通部", "環境部", "広報部", "執行部"]
history_array = ["未選出", "現役員", "元役員"]

20.times do |number|
    User.create!(
        id: "#{number}",
        name: "親#{number + 1}",
        cname: "子#{number + 1}",
        email: "test#{number +1}",
        password: "1234",
        password_confirmation: "1234",
        grade: "#{rand(1..7)}",
        pta_officer: "#{officer_array[rand(5)]}",
        pta_officer_history: "#{history_array[rand(3)]}"
        )
end
require "pony"

puts "Здравствуйте, данная программа предназначена для отправки электронных писем."
puts "Пожалуйста следуйте указанным инструкциям."
puts "Если у вас остались вопросы, то можете найти список подсказок, прописав команду '-help'"
sleep 1
puts "Выберите из списка провайдер, используемый вами, указав номер."
puts "1.mail"
puts "2.gmail"
puts "3.yandex"
puts "4.другой."
choice = STDIN.gets.chomp
if (choice == '-help')
  abort "Помощь тут."
end
if (choice == '4')
  puts "Извините, мы не поддерживаем вашь провайдер."
else
  puts "Введите свой mail"
  me = STDIN.gets.chomp
  if (me == '-help')
  abort "Помощь тут."
  end
  puts "Введите пароль почты #{me}"
  password = STDIN.gets.chomp
  if (password == '-help')
  abort "Помощь тут."
  end
  puts "Введите mail получателя."
  recipient = STDIN.gets.chomp
  if (recipient == '-help')
  abort "Помощь тут."
  end
  puts "Введите текст письма."
  txt = STDIN.gets.chomp
  if (txt == '-help')
  abort "Помощь тут."
  end
end

if (choice == '1')

  Pony.mail({
    :subject => "Тема",
    :body => txt,
    :to => recipient,
    :from => me,
    :via => :smtp,
    :via_options => {
      :address => 'smtp.mail.ru',
      :port => '465',
      :tls => true,
      :user_name => me,
      :password => password,
      :authentication => :plain
}
 })
else
  if (choice == '2')

# Google не работает.
    Pony.mail({
    :to => recipient,
    :via => :smtp,
    :via_options => {
      :address        => 'smtp.gmail.com',
      :port           => '25',
      :enable_starttls_auto => true,
      :user_name      => 'user',
      :password       => 'password',
      :authentication => :plain,
      :domain         => "localhost.localdomain"
  }
})
  else
    if (choice == '3')
      Pony.mail({
        :subject => "Тема",
        :body => txt,
        :to => recipient,
        :from => me,
        :via => :smtp,
        :via_options => {
          :address => 'smtp.yandex.ru',
          :port => '465',
          :tls => true,
          :user_name => me,
          :password => password,
          :authentication => :plain
}
})          
 end
end
  end


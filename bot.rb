require 'telegram/bot'

TOKEN = '684307416:AAGNnNrsbMxQdX9JyCjKLC2qHo0f71XH7jo'

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.sendMessage(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    end
  end
end
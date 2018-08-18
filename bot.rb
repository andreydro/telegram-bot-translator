require 'telegram/bot'
require 'pry'
require "ohm"

TOKEN = '684307416:AAGNnNrsbMxQdX9JyCjKLC2qHo0f71XH7jo'

@language

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")

    when Telegram::Bot::Types::CallbackQuery
      # 2 main featrures
      if message.data == 'basic'
        kb = [
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Conversation', callback_data: 'conversation'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Travel', callback_data: 'travel'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Hotel', callback_data: 'hotel')
          ]
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)

        bot.api.send_message(chat_id: message.from.id, text: "Choose category", reply_markup: markup)
      end

      if message.data == 'translation'
        bot.api.send_message(chat_id: message.from.id, text: "Cooming soon...")
      end

      # language
      if message.data == 'french'
         kb = [
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Basic phrases', callback_data: 'basic'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Translation', callback_data: 'translation')
          ]
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)

        bot.api.send_message(chat_id: message.from.id, text: "Do you want see list of basic phrases or translation function", reply_markup: markup)
      end

      # category
      
    when Telegram::Bot::Types::Message
      kb = [
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'French', callback_data: 'french'),
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'German', callback_data: 'german'),
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Spanish', callback_data: 'spanish')
      ]
      markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
      bot.api.send_message(chat_id: message.chat.id, text: 'Please, choose language you want to use', reply_markup: markup) 

    when 'help'
      bot.api.sendMessage(
      	chat_id: message.chat.id, 
        text: "You can use following commands"
      )
    end
  end
end
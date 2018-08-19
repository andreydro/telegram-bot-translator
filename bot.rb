require 'telegram/bot'
require 'pry'
require "ohm"

TOKEN = '684307416:AAGNnNrsbMxQdX9JyCjKLC2qHo0f71XH7jo'



class User < Ohm::Model
  attribute :language
  attribute :name
end

User.redis = Redic.new('redis://127.0.0.1:6379/0')

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
   
    # binding.pry
    def authenticate_user(message)
      @user = User.create(name: "#{message.from.first_name}_#{message.from.last_name}", language: 'french')
    end

    authenticate_user(message)

   # binding.pry
    case message

    when Telegram::Bot::Types::CallbackQuery
      # 2 main featrures
      if message.data == 'french'
        kb = [
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Travel', callback_data: 'travel_fr'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Personal', callback_data: 'personal_fr'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Application', callback_data: 'application_fr'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Bussiness', callback_data: 'bussiness_fr'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Academic', callback_data: 'academic_fr'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Immigration', callback_data: 'immigration_fr')
          ]
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)

        bot.api.send_message(chat_id: message.from.id, text: "Choose category", reply_markup: markup)
      end

      if message.data == 'travel_fr'
         kb = [
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Greetings', callback_data: 'greetings'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Introduction', callback_data: 'introduction')
          ]
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)

        bot.api.send_message(chat_id: message.from.id, text: "Choose topic", reply_markup: markup)
      end

       if message.data == 'personal_fr'
         kb = [
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Greetings', callback_data: 'greetings'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Introduction', callback_data: 'introduction')
          ]
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)

        bot.api.send_message(chat_id: message.from.id, text: "Choose topic", reply_markup: markup)
      end

       if message.data == 'application_fr'
         kb = [
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Greetings', callback_data: 'greetings'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Introduction', callback_data: 'introduction')
          ]
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)

        bot.api.send_message(chat_id: message.from.id, text: "Choose topic", reply_markup: markup)
      end

      if message.data == 'bussiness_fr'
         kb = [
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Greetings', callback_data: 'greetings'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Introduction', callback_data: 'introduction')
          ]
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)

        bot.api.send_message(chat_id: message.from.id, text: "Choose topic", reply_markup: markup)
      end

       if message.data == 'academic_fr'
         kb = [
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Greetings', callback_data: 'greetings'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Introduction', callback_data: 'introduction')
          ]
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)

        bot.api.send_message(chat_id: message.from.id, text: "Choose topic", reply_markup: markup)
      end

       if message.data == 'immigration_fr'
         kb = [
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Greetings', callback_data: 'greetings'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Introduction', callback_data: 'introduction')
          ]
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)

        bot.api.send_message(chat_id: message.from.id, text: "Choose topic", reply_markup: markup)
      end

    when Telegram::Bot::Types::Message
      kb = [
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'French', callback_data: 'french'),
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'German', callback_data: 'german'),
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Spanish', callback_data: 'spanish')
      ]
      markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
      bot.api.send_message(chat_id: message.chat.id, text: 'Please, choose language you want to use', reply_markup: markup)

    when '/help'
      bot.api.sendMessage(
        chat_id: message.chat.id,
        text: "You can use following commands"
      )
    end
  end
end
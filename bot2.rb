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
    case message.text

    when '/start'
      question = 'Please, choose the language'
      # See more: https://core.telegram.org/bots/api#replykeyboardmarkup
      answers =
        Telegram::Bot::Types::ReplyKeyboardMarkup
        .new(keyboard: [%w(French German Spanish)], one_time_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)

    when '/stop'
      # See more: https://core.telegram.org/bots/api#replykeyboardremove
      kb = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text: 'Sorry to see you go :(', reply_markup: kb)

    when 'French'
      question = 'Please, choose category'
      # See more: https://core.telegram.org/bots/api#replykeyboardmarkup
      answers =
        Telegram::Bot::Types::ReplyKeyboardMarkup
        .new(keyboard: [%w(Travel Personal Application), %w(Business Academic Immigration), %w(Culture Activity Job)], one_time_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)

    when 'Conversation'
      question = 'Please, choose topic'

      answers = 
        Telegram::Bot::Types::ReplyKeyboardMarkup
        .new(keyboard: [%w(Greetings Introduction Questions), %w(Goodbye Understanding Gratitude), %w(Apologies Activity Job)], one_time_keyboard: true)

    # when Telegram::Bot::Types::CallbackQuery
    #   # 2 main featrures
    #   if message.data == 'basic'
    #     kb = [
    #       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Conversation', callback_data: 'conversation'),
    #       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Useful', callback_data: 'useful'),
    #       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Guest', callback_data: 'guest'),
    #       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Travel', callback_data: 'travel'),
    #       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Hotel', callback_data: 'hotel'),
    #       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Restaurant', callback_data: 'restaurant'),
    #       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Services', callback_data: 'services'),
    #       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Stores', callback_data: 'stores'),
    #       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Health', callback_data: 'health'),
    #       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Culture', callback_data: 'culture'),
    #       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Activity', callback_data: 'activity'),
    #       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Job', callback_data: 'job'),
    #       ]
    #     markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)

    #     bot.api.send_message(chat_id: message.from.id, text: "Choose category", reply_markup: markup)
    #   end

    #   if message.data == 'translation'
    #     bot.api.send_message(chat_id: message.from.id, text: "Cooming soon...")
    #   end

    #   if message.data == 'conversation'
    #      kb = [
    #       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Greetings', callback_data: 'greetings'),
    #       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Introduction', callback_data: 'introductin')
    #       ]
    #     markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)

    #     bot.api.send_message(chat_id: message.from.id, text: "Do you want see list of basic phrases or translation function", reply_markup: markup)
    #   end

    #   # language
    #   if message.data == 'french'
    #      kb = [
    #       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Basic phrases', callback_data: 'basic'),
    #       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Translation', callback_data: 'translation')
    #       ]
    #     markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)

    #     bot.api.send_message(chat_id: message.from.id, text: "Do you want see list of basic phrases or translation function", reply_markup: markup)
    #   end

    #   if message.data == 'german'
    #      kb = [
    #       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Basic phrases', callback_data: 'basic'),
    #       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Translation', callback_data: 'translation')
    #       ]
    #     markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)

    #     bot.api.send_message(chat_id: message.from.id, text: "Do you want see list of basic phrases or translation function", reply_markup: markup)
    #   end

    #   if message.data == 'spanish'
    #      kb = [
    #       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Basic phrases', callback_data: 'basic'),
    #       Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Translation', callback_data: 'translation')
    #       ]
    #     markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)

    #     bot.api.send_message(chat_id: message.from.id, text: "Do you want see list of basic phrases or translation function", reply_markup: markup)
    #   end

    # when Telegram::Bot::Types::Message
    #   kb = [
    #     Telegram::Bot::Types::InlineKeyboardButton.new(text: 'French', callback_data: 'french'),
    #     Telegram::Bot::Types::InlineKeyboardButton.new(text: 'German', callback_data: 'german'),
    #     Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Spanish', callback_data: 'spanish')
    #   ]
    #   markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
    #   bot.api.send_message(chat_id: message.chat.id, text: 'Please, choose language you want to use', reply_markup: markup)

    # when '/help'
    #   bot.api.sendMessage(
    #     chat_id: message.chat.id,
    #     text: "You can use following commands"
    #   )
    end
  end
end
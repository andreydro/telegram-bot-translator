require 'telegram/bot'
require 'pry'
require 'yaml'
require "ohm"

TOKEN = '684307416:AAGNnNrsbMxQdX9JyCjKLC2qHo0f71XH7jo'

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message
    when Telegram::Bot::Types::CallbackQuery

      if message.data == 'french'
        kb = [
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Travel', callback_data: 'travel_fr'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Personal', callback_data: 'personal_fr'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Shopping', callback_data: 'shopping_fr'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Accommodation', callback_data: 'accommodation_fr'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Eating Out', callback_data: 'eating_out_fr'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Numbers and Money', callback_data: 'numbers_and_money_fr')
          ]
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)

        bot.api.send_message(chat_id: message.from.id, text: "Choose the category", reply_markup: markup)
      end

      if message.data == 'travel_fr'
        data = YAML.load_file('./fr/travel_fr.yml').each { |e| e[e.length+1] = '\n' }

        bot.api.send_message(chat_id: message.from.id, text: data['travel_data'].join(",\n"))
      end

       if message.data == 'personal_fr'
        data = YAML.load_file('./fr/personal_fr.yml').each { |e| e[e.length+1] = '\n' } 

        bot.api.send_message(chat_id: message.from.id, text: data['personal_data'].join(",\n"))
      end

       if message.data == 'shopping_fr'
         data = YAML.load_file('./fr/shopping_fr.yml').each { |e| e[e.length+1] = '\n' } 

        bot.api.send_message(chat_id: message.from.id, text: data['shopping_data'].join(",\n"))
      end

      if message.data == 'accommodation_fr'
         data = YAML.load_file('./fr/accommodation_fr.yml').each { |e| e[e.length+1] = '\n' } 

        bot.api.send_message(chat_id: message.from.id, text: data['accommodation_data'].join(",\n"))
      end

       if message.data == 'eating_out_fr'
         data = YAML.load_file('./fr/eating_out_fr.yml').each { |e| e[e.length+1] = '\n' } 

        bot.api.send_message(chat_id: message.from.id, text: data['eating_out_data'].join(",\n"))
      end

       if message.data == 'numbers_and_money_fr'
       data = YAML.load_file('./fr/numbers_and_money_fr.yml').each { |e| e[e.length+1] = '\n' } 

        bot.api.send_message(chat_id: message.from.id, text: data['numbers_and_money_data'].join(",\n"))
      end

      if message.data == 'german'
        kb = [
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Greetings', callback_data: 'greetings_de'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'General Conversation', callback_data: 'gen_conversation_de'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Directions and Places', callback_data: 'dir_plac_de'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Accommodation', callback_data: 'accommodation_de'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Eating Out', callback_data: 'eating_out_de'),
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Shopping', callback_data: 'shopping_de')
          ]
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)

        bot.api.send_message(chat_id: message.from.id, text: "Choose the category", reply_markup: markup)
      end

      if message.data == 'greetings_de'
        data = YAML.load_file('./de/greetings_de.yml').each { |e| e[e.length+1] = '\n' }

        bot.api.send_message(chat_id: message.from.id, text: data['personal_data'].join(",\n"))
      end

      if message.data == 'gen_conversation_de'
        data = YAML.load_file('./de/gen_conversation_de.yml').each { |e| e[e.length+1] = '\n' }

        bot.api.send_message(chat_id: message.from.id, text: data['personal_data'].join(",\n"))
      end

      if message.data == 'dir_plac_de'
        data = YAML.load_file('./de/dir_plac_de.yml').each { |e| e[e.length+1] = '\n' }

        bot.api.send_message(chat_id: message.from.id, text: data['personal_data'].join(",\n"))
      end

      if message.data == 'accommodation_de'
        data = YAML.load_file('./de/accommodation_de.yml').each { |e| e[e.length+1] = '\n' }

        bot.api.send_message(chat_id: message.from.id, text: data['personal_data'].join(",\n"))
      end

      if message.data == 'eating_out_de'
        data = YAML.load_file('./de/eating_out_de.yml').each { |e| e[e.length+1] = '\n' }

        bot.api.send_message(chat_id: message.from.id, text: data['personal_data'].join(",\n"))
      end

      if message.data == 'shopping_de'
        data = YAML.load_file('./de/shopping_de.yml').each { |e| e[e.length+1] = '\n' }

        bot.api.send_message(chat_id: message.from.id, text: data['personal_data'].join(",\n"))
      end

      if message.data == 'spanish'
        kb = [
          Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Greetings', callback_data: 'greetings_es')
          ]
        markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)

        bot.api.send_message(chat_id: message.from.id, text: "Choose the category", reply_markup: markup)
      end

      if message.data == 'greetings_es'
        data = YAML.load_file('./es/greetings_es.yml').each { |e| e[e.length+1] = '\n' }

        bot.api.send_message(chat_id: message.from.id, text: data['greetings_data'].join(",\n"))
      end

    when Telegram::Bot::Types::Message
      kb = [
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'French', callback_data: 'french'),
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'German', callback_data: 'german'),
        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Spanish', callback_data: 'spanish')
      ]
      markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: kb)
      bot.api.send_message(chat_id: message.chat.id, text: 'Hello! Please, choose language you need', reply_markup: markup)
    end
  end
end
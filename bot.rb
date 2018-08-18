require 'telegram/bot'
require 'pry'

TOKEN = '684307416:AAGNnNrsbMxQdX9JyCjKLC2qHo0f71XH7jo'

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
  	msg = message.text.downcase
    case msg
    when 'start'
      bot.api.sendMessage(
      	chat_id: message.chat.id, 
      	text: %(
      	  Hello, #{message.from.first_name}. 
      	  Do you want see basic vacabulary or translate particular phrase?
      	  use commands basic or phrase
      	  )
      	)
    when 'help'
      bot.api.sendMessage(
      	chat_id: message.chat.id, 
        text: "You can use following commands"
      )
    when 'basic'
		  bot.api.sendMessage(
		    	chat_id: message.chat.id, 
		      text: %(
		        Please, choose language:
		          French
		          German
		          Spanish
		      )
		    )
    when 'phrase'
	    bot.api.sendMessage(
	      	chat_id: message.chat.id, 
	        text: "You will able to use realtime translation soon...."
	      )  	 
    when 'french'
    	bot.api.sendMessage(
      	chat_id: message.chat.id, 
        text: %(
          Enter category:
          Conversation
          Useful
          Guest
          Travel
          Hotel
          Restaurant
          Services
          Stores
          Health
          Culture
          Activity
          Job
        )
      )
    end
  end
end
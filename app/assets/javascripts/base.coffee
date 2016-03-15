# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ -> 
  $('.messages button').on 'click', (e) -> 
    text_field = $('.messages input[name=message]')
    text = text_field.val()
    text_field.val('')
    App.messages_channel.send({message: text})

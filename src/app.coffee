UI = require('ui')
Vector2 = require('vector2')


menu = new (UI.Menu)(
  sections: [
    {
      title: 'Theme'
      items: [
        { title: 'Nature' }
        { title: 'Pop' }
      ]
    }
  ]
)
menu.show()
# main = new (UI.Card)(
#   title: 'Pebble.js'
#   icon: 'images/menu_icon.png'
#   subtitle: 'Hello World!'
#   body: 'Press any button.')
# main.show()
# main.on 'click', 'up', (e) ->
#   menu = new (UI.Menu)(sections: [ { items: [
#     {
#       title: 'Pebble.js'
#       icon: 'images/menu_icon.png'
#       subtitle: 'Can do Menus'
#     }
#     {
#       title: 'Second Item'
#       subtitle: 'Subtitle Text'
#     }
#   ] } ])
#   menu.on 'select', (e) ->
#     console.log 'Selected item #' + e.itemIndex + ' of section #' + e.sectionIndex
#     console.log 'The item is titled "' + e.item.title + '"'
#     return
#   menu.show()
#   return
# main.on 'click', 'select', (e) ->
#   wind = new (UI.Window)
#   textfield = new (UI.Text)(
#     position: new Vector2(0, 50)
#     size: new Vector2(144, 30)
#     font: 'gothic-24-bold'
#     text: 'Text Anywhere!'
#     textAlign: 'center')
#   wind.add textfield
#   wind.show()
#   return
# main.on 'click', 'down', (e) ->
#   card = new (UI.Card)
#   card.title 'A Card'
#   card.subtitle 'Is a Window'
#   card.body 'The simplest window type in Pebble.js.'
#   card.show()
#   return
#
# # ---
# # generated by js2coffee 2.0.0

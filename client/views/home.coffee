Template.home.rendered = ->
  card_1c = FView.byId 'card_1c'
  card_1c.surface.on 'click', ->
    card_1c.parent.view.setAngle Math.PI,
      curve: "easeOutBounce"
      duration: 500

  card_back = FView.byId 'card_back'
  card_back.surface.on 'click', ->
    card_back.parent.view.setAngle 0,
      curve: "easeOutBounce"
      duration: 500

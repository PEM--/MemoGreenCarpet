if Meteor.isClient
  Meteor.startup ->
    css = new CSSC

    css.add '*',
      # Prevent selection
      webkitTouchCallout: 'none'
      webkitUserSelect: 'none'
      userSelect: 'none'
      outline: CSSC.x 0

    css.add '.items',
      lineHeight: CSSC.x 40

    css.add '.selected',
      margin: CSSC.x 3
      border: "3px solid #{CSSC.yellow}"
      borderRadius: CSSC.x 5
    css.add '.unselected',
      color: CSSC.yellow

    css.add '@font-face',
      fontFamily: 'Limelight'
      src: "url('Limelight.ttf')"

    css.add 'html',
      background: 'radial-gradient(ellipse at center, #0e9100 0%,#005d22 100%)'
      color: CSSC.yellow
      textAlign: 'center'
      fontFamily: 'Limelight'

    css.add 'card', ->
      webkitBoxShadow: '10px 10px 5px #656565'

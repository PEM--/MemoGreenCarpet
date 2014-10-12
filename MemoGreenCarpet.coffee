if Meteor.isClient

  Meteor.startup ->
    console.log 'Client started'

    Template.home.rendered = ->
      card_1c = FView.byId 'card_1c'
      card_1c.surface.on 'click', ->
        FView.mainCtx.setPerspective 500
        card_1c.parent.view.setAngle Math.PI,
          curve: "easeOutBounce"
          duration: 500
        , -> FView.mainCtx.setPerspective 0

      card_back = FView.byId 'card_back'
      card_back.surface.on 'click', ->
        FView.mainCtx.setPerspective 500
        card_back.parent.view.setAngle 0,
          curve: "easeOutBounce"
          duration: 500
        , -> FView.mainCtx.setPerspective 0

    Template.navbar.helpers
      routes: -> Router.routes

    Template.navbar.rendered = ->
      fMenuItems = FView.byId 'menuItems'
      # Attach events to navbar elements
      for fMenuItem in fMenuItems.children
        do (fMenuItem) ->
          fMenuItem.surface.on 'click', ->
            Router.go fMenuItem.id
      (FView.byId Router.current().route.name).surface
        .removeClass 'unselected'
        .addClass 'selected'

    Router.onBeforeAction ->
      unless Router.history?
        Router.history = Router.current().route.name

    Router.onAfterAction ->
      (FView.byId Router.history)?.surface
        .removeClass 'selected'
        .addClass 'unselected'
      Router.history = Router.current().route.name
      (FView.byId Router.current().route.name)?.surface
        .removeClass 'unselected'
        .addClass 'selected'

if Meteor.isServer
  Meteor.startup ->
    console.log 'Server started'

Meteor.startup ->
  Router.configure
    layoutTemplate: 'layout'

  Router.map ->
    @route 'home',
      path: '/'
      menuName: 'Home'
    @route 'link2',
      menuName: 'Link 2'

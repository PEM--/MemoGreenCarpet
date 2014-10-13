Template.navbar.helpers
  routes: -> Router.routes

Template.navbar.rendered = ->
  fMenuItems = FView.byId 'menuItems'
  # Attach events to navbar elements
  for fMenuItem in fMenuItems.children
    do (fMenuItem) ->
      fMenuItem.surface.on CLICK_EVT, ->
        Router.go fMenuItem.id
  (FView.byId Router.current().route.name).surface
    .removeClass 'unselected'
    .addClass 'selected'

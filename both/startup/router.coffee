Router.configure
  layoutTemplate: 'layout'

Router.map ->
  @route 'home',
    path: '/'
    menuName: 'Home'
  @route 'game',
    menuName: 'Game'

if Meteor.isClient
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

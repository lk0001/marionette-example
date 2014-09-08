class MarionetteExample.Views.LongestPost extends Marionette.ItemView
  template: JST['backbone/templates/posts/longest_post']

  collectionEvents:
    'add':    'recalculatePost'
    'change': 'recalculatePost'
    'remove': 'recalculatePost'

  initialize: =>
    @resetModel()

  resetModel: =>
    @model = @collection.longestPost() || new @collection.model()

  recalculatePost: =>
    @resetModel()
    @render()

  onRender: =>
    if !@model.get('content')
      @$el.hide()

class MarionetteExample.Views.LongestPost extends Marionette.ItemView
  template: JST['backbone/templates/posts/longest_post']

  collectionEvents:
    'add':    'recalculatePost'
    'change': 'recalculatePost'
    'remove': 'recalculatePost'

  initialize: =>
    @model = @collection.longestPost()

  recalculatePost: =>
    @model = @collection.longestPost()
    @render()

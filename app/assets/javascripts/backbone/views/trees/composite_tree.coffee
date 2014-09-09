class MarionetteExample.Views.CompositeTree extends Marionette.CompositeView
  template: JST['backbone/templates/trees/composite_tree']

  childViewContainer: 'ul'
  tagName: 'li'

  initialize: =>
    @collection = new Backbone.Collection(@model.get('nodes'))

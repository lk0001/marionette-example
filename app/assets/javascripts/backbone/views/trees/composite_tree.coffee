class MarionetteExample.Views.CompositeTree extends Marionette.CompositeView
  template: JST['backbone/templates/trees/composite_tree']

  childViewContainer: 'ul'
  tagName: 'li'

  ui:
    name:  '.js-name'

  events:
    'click @ui.name': 'toggleSubtree'

  initialize: =>
    @collection = new Backbone.Collection(@model.get('nodes'))

  toggleSubtree: (e) ->
    e.stopPropagation()
    $(e.target).next().toggle()

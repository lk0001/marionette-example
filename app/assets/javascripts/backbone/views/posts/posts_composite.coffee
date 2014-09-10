class MarionetteExample.Views.PostsComposite extends Marionette.CompositeView
  template: JST['backbone/templates/posts/posts_composite']

  childView: MarionetteExample.Views.Post
  childViewContainer: '#posts'

  ui:
    lastClicked: '.js-last-clicked'

  childEvents:
    'post:clicked': 'updateLastClicked'

  updateLastClicked: (view, triggerHash) =>
    $(@ui.lastClicked).text(view.model.get('content'))

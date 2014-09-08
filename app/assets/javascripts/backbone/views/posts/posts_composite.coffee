class MarionetteExample.Views.PostsComposite extends Marionette.CompositeView
  template: JST['backbone/templates/posts/posts_composite']

  childView: MarionetteExample.Views.Post
  childViewContainer: '#posts'

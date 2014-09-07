class MarionetteExample.Views.PostsLayout extends Marionette.LayoutView
  template: JST['backbone/templates/posts/posts_layout']

  regions:
    postsRegion: '#posts'

  onShow: =>
    view = new MarionetteExample.Views.Posts(collection: @collection)
    @postsRegion.show(view)

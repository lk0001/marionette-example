class MarionetteExample.Views.PostsLayout extends Marionette.LayoutView
  template: JST['backbone/templates/posts/posts_layout']

  regions:
    postsRegion: '#posts'
    longestPostRegion: '#longest-post'

  onShow: =>
    @displayPosts()
    @displayLongestPost()

  displayPosts: =>
    view = new MarionetteExample.Views.Posts(collection: @collection)
    @postsRegion.show(view)

  displayLongestPost: =>
    view = new MarionetteExample.Views.LongestPost(collection: @collection)
    @longestPostRegion.show(view)

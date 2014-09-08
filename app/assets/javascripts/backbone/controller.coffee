class @MarionetteExample.Controller
  constructor: (@app) ->

  # helpers

  currentView: =>
    @app.mainContent.currentView

  navigate: (view, address, opts = {}) =>
    Backbone.history.navigate(address, opts) if address
    @app.mainContent.show(view)

  start: =>
    @posts()

  # routing methods

  posts: =>
    view = new MarionetteExample.Views.PostsLayout(collection: @app.posts)
    @navigate(view, '/posts')

  postsComposite: =>
    view = new MarionetteExample.Views.PostsComposite(collection: @app.posts)
    @navigate(view, '/posts_composite')

  postsWithFetch: =>
    backendPosts = new MarionetteExample.Collections.Posts
    backendPosts.fetch()
    view = new MarionetteExample.Views.PostsLayout(collection: backendPosts)
    @navigate(view, '/posts_with_fetch')

  post: (id) =>
    id = _.flatten([id])[0]
    post = @app.posts.get(id)
    view = new MarionetteExample.Views.SinglePost(model: post)
    @navigate(view, "/post/#{id}")

  newPost: =>
    view = new MarionetteExample.Views.PostForm
    @navigate(view, '/posts/new')

  editPost: (id) =>
    post = @app.posts.get(id)
    view = new MarionetteExample.Views.PostForm(model: post)
    @navigate(view, "/posts/#{id}/edit")

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

  compositeTree: =>
    treeData = \
      {nodeName: 'root', nodes: [
        {nodeName: 'top 1', nodes: [
          {nodeName: 'mid 1', nodes: [
            {nodeName: 'bot 1'},
            {nodeName: 'bot 2'},
            {nodeName: 'bot 3'},
          ]},
          {nodeName: 'mid 2', nodes: [
            {nodeName: 'bot 1'},
            {nodeName: 'bot 2'},
            {nodeName: 'bot 3'},
          ]},
          {nodeName: 'mid 3'},
        ]},
        {nodeName: 'top 2'},
        {nodeName: 'top 3', nodes: [
          {nodeName: 'mid 1', nodes: [
            {nodeName: 'bot 1'},
            {nodeName: 'bot 2'},
            {nodeName: 'bot 3'},
          ]},
        ]},
      ]}
    model = new Backbone.Model(treeData)
    view = new MarionetteExample.Views.CompositeTree(model: model)
    @navigate(view, '/tree')

class MarionetteExample.Routers.PostsRouter extends Backbone.Router
  initialize: (options) ->
    @posts = new MarionetteExample.Collections.PostsCollection()
    @posts.reset options.posts

  routes:
    "new"      : "newPost"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newPost: ->
    @view = new MarionetteExample.Views.Posts.NewView(collection: @posts)
    $("#posts").html(@view.render().el)

  index: ->
    @view = new MarionetteExample.Views.Posts.IndexView(collection: @posts)
    $("#posts").html(@view.render().el)

  show: (id) ->
    post = @posts.get(id)

    @view = new MarionetteExample.Views.Posts.ShowView(model: post)
    $("#posts").html(@view.render().el)

  edit: (id) ->
    post = @posts.get(id)

    @view = new MarionetteExample.Views.Posts.EditView(model: post)
    $("#posts").html(@view.render().el)

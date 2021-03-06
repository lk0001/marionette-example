class MarionetteExample.Models.Post extends Backbone.Model
  urlRoot: '/api/posts'
  # paramRoot: 'post'

  defaults:
    author: null
    content: null


class MarionetteExample.Collections.Posts extends Backbone.Collection
  model: MarionetteExample.Models.Post
  url: '/api/posts'

  longestPost: =>
    return if @isEmpty() # would return -Infinity
    @max (post) =>
      post.get('content').length

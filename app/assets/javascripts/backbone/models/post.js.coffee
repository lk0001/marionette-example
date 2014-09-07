class MarionetteExample.Models.Post extends Backbone.Model
  paramRoot: 'post'

  defaults:
    author: null
    content: null

class MarionetteExample.Collections.PostsCollection extends Backbone.Collection
  model: MarionetteExample.Models.Post
  url: '/posts'

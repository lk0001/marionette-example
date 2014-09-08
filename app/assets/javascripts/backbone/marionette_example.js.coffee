#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

@MarionetteExample =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

class @MarionetteExample.Application extends Backbone.Marionette.Application

  constructor: ->
    super

    @addRegions
      mainContent: '#main-content'

    @Router = Backbone.Marionette.AppRouter.extend
      appRoutes:
        '(/)':              'start'
        'posts':            'posts'
        'posts_composite':  'postsComposite'
        'posts_with_fetch': 'postsWithFetch'
        'post/:id':         'post'
        'posts/new':        'newPost'
        'posts/:id/edit':   'editPost'

    @Controller = new MarionetteExample.Controller(@)
    @addInitializer =>
      new @Router(controller: @Controller)

    @setupRoutingEvents()
    @setupNavLinks()

    @on 'start', ->
      @bootstrapData()
      Backbone.history.start(pushState: true, root: '/')

  bootstrapData: ->
    @posts = new MarionetteExample.Collections.Posts(window.posts)

  setupRoutingEvents: ->
    @listenTo @, 'route:posts:new', @Controller.newPost
    @listenTo @, 'route:posts:edit', @Controller.editPost
    @listenTo @, 'route:posts:index', @Controller.posts
    @listenTo @, 'route:posts:index:composite', @Controller.postsComposite
    @listenTo @, 'route:posts:index:with_fetch', @Controller.postsWithFetch
    @listenTo @, 'route:posts:show', @Controller.post
    @listenTo @, 'post:saved', @handlePostAdded
    @listenTo @, 'post:destroyed', @handlePostDestroyed

  handlePostAdded: (post) =>
    @posts.add(post)
    @trigger('route:posts:show', post.get('id'))

  handlePostDestroyed: =>
    @trigger('route:posts:index')

  setupNavLinks: ->
    $(document).on 'click', '.nav-link', (e) =>
      target = $(e.target)
      until target.data('route') # clicked element might not be the link itself, but a child thereof (e.g. img)
        target = target.parent()
        return unless target.length # no parent with data-route found, bail out
      [route, data...] = target.data('route').split('/')
      if (!e.altKey && !e.ctrlKey && !e.metaKey && !e.shiftKey)
        e.preventDefault()
        @trigger 'route', target.data('route')
        @trigger "route:" + route, data

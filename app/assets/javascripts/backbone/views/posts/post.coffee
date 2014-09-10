class MarionetteExample.Views.Post extends Marionette.LayoutView
  template: JST['backbone/templates/posts/post']

  tagName: 'li'

  events:
    'click .js-edit':    'displayEditForm'
    'click .js-destroy': 'destroyPost'

  regions:
    editForm: '.js-edit-form'

  modelEvents:
    'sync': 'render'

  triggers:
    'click .js-post': 'post:clicked'

  displayEditForm: =>
    view = new MarionetteExample.Views.PostForm(model: @model)
    @editForm.show(view)

  destroyPost: (e) =>
    e.preventDefault()
    @model.destroy(success: (model) ->
      theApp.trigger('post:destroyed', model)
    )

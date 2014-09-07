class MarionetteExample.Views.Post extends Marionette.ItemView
  template: JST['backbone/templates/posts/post']

  tagName: 'li'

  events:
    'click .js-destroy': 'destroyPost'

  destroyPost: (e) =>
    e.preventDefault()
    @model.destroy(success: (model) ->
      theApp.trigger('post:destroyed', model)
    )

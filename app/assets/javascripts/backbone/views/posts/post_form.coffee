class MarionetteExample.Views.PostForm extends Marionette.ItemView
  template: JST['backbone/templates/posts/post_form']

  events:
    'submit form.js-post-form': 'savePost'

  initialize: =>
    @model ||= new MarionetteExample.Models.Post

  savePost: (e) =>
    e.preventDefault()
    @model.save(null,
      success: (post) ->
        theApp.trigger('post:saved', post)
      error: =>
        @model.set(@model.previousAttributes())
    )

  onRender: =>
    @$("form").backboneLink(@model)

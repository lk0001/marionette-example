class MarionetteExample.Views.PostForm extends Marionette.ItemView
  template: JST['backbone/templates/posts/post_form']

  events:
    'submit form.js-post-form': 'savePost'

  initialize: =>
    @model ||= new MarionetteExample.Models.Post

  savePost: (e) =>
    e.preventDefault()
    attrs = {author: @$('input[name=author]').val(), \
             content: @$('input[name=content]').val()}
    @model.save(attrs,
      success: (post) ->
        theApp.trigger('post:saved', post)
      wait: true
    )

  # onRender: =>
  #   @$("form").backboneLink(@model)

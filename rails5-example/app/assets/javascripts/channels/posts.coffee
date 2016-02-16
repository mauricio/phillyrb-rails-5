App.posts = App.cable.subscriptions.create 'PostsChannel',

  connected: ->
    @perform 'follow'

  postCreated: (post) ->
    content = """
        <div id="post_#{post.id}" class="posts">
          <h1>#{post.title}</h1>
          <p>#{post.contents}</p>
        </div>
        """
    jQuery("#posts").append(content);

  postDestroyed: (post) ->
    jQuery("#post_#{post.id}").remove()

  received: (data) ->
    switch data.action
      when "created" then @postCreated(data.post)
      when "destroyed" then @postDestroyed(data.post)
      else console.log("no idea what to do with #{data.action}")

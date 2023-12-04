class UsersController < ApplicationController
  
    def index
        @users = User.all
    end
  def show
    @user = User.find(params[:id])
    # @posts = @user.posts
  end
end

# Path: app/views/users/show.html.erb
<%= render @posts %>

# Path: app/views/posts/_post.html.erb
<%= post.title %>
<%= post.body %>
```

###
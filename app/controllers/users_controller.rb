class UsersController < ApplicationController
  
    def index
        
    end
  def show
    @user = User.find(params[:id])
  
  end
end

# Path: app/views/users/show.html.erb
<%= render @posts %>

# Path: app/views/posts/_post.html.erb
<%= post.title %>
<%= post.body %>
```

###
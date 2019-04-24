# rebuild twitter 
# Database 
# tables: users, posts, comments, 

# users (id, username, pass_encr, session_token)
# posts (id, user_id, body, retweet)
# likes (id, user_id, post_id) unique on user_id and post_id
# comments (id, user_id, post_id, body)

# Model
# controller: post, get, update, delete
# @params
def add
  user = Comment.new(params[user_id], params[post_id], params[body])
  
end

def params
  
end
http://localhost.com/posts/12/comments/new

# forms 

# users seeds
puts 'Seeding users...'
first_user = User.create(name: 'Shahadat Hossain', photo: 'https://images.unsplash.com/photo-1651684215020-f7a5b6610f23?&fit=crop&w=640', bio: 'A skilled carpenter with over 15 years of experience, specializing in custom furniture design and installation.')
second_user = User.create(name: 'Rakibul Islam', photo: 'https://images.unsplash.com/photo-1530268729831-4b0b9e170218?&fit=crop&w=640', bio: 'A licensed therapist with expertise in cognitive-behavioral therapy and trauma-informed care.')
third_user = User.create(name: 'Monir Hossain', photo: 'https://images.unsplash.com/photo-1583692331507-fc0bd348695d?&fit=crop&w=640', bio: 'A seasoned project manager with experience in managing complex projects across multiple industries.')
fourth_user = User.create(name: 'Siful Islam', photo: 'https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?&fit=crop&w=640', bio: 'A seasoned project manager with experience in managing complex projects across multiple industries.')
fifth_user = User.create(name: 'Sohidul Islam', photo: 'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?&fit=crop&w=640', bio: 'An experienced marketing specialist with expertise in digital marketing, branding, and social media management.')

# post seeds
first_post = Post.create(author_id: first_user.id, title: 'First seed post', text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.')
second_post = Post.create(author_id: first_user.id, title: 'Second seed post', text: 'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.')
third_post = Post.create(author_id: first_user.id, title: 'Third seed post', text: 'This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32 Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock.')
fourth_post = Post.create(author_id: first_user.id, title: 'Fourth seed post', text: 'All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.')
fifth_post = Post.create(author_id: second_user.id, title: 'Fifth seed post', text: 'Aenean vitae volutpat nisl, sed hendrerit arcu. Proin quis mi eu dolor scelerisque volutpat. Nulla ultricies sollicitudin erat, nec tincidunt libero vehicula pharetra. Nunc risus nulla, commodo ut ex ut, elementum vestibulum ligula. Cras eleifend faucibus tortor a porttitor Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tristique quis lacus ut dictum.')
# ... (continue with the rest of your post seeds)

# comment seeds
first_comment = Comment.create(post_id: first_post.id, user_id: first_user.id, text: 'Sed auctor augue euismod est faucibus ultrices.')
second_comment = Comment.create(post_id: first_post.id, user_id: second_user.id, text: 'Suspendisse at magna elit.')
third_comment = Comment.create(post_id: first_post.id, user_id: third_user.id, text: 'Nam consectetur urna eu risus cursus venenatis.')
fourth_comment = Comment.create(post_id: first_post.id, user_id: fourth_user.id, text: 'Maecenas finibus, ante eu tincidunt auctor.')
fifth_comment = Comment.create(post_id: first_post.id, user_id: fifth_user.id, text: 'Vivamus libero libero, elementum in rhoncus in.')
sixth_comment = Comment.create(post_id: first_post.id, user_id: first_user.id, text: 'Donec eleifend lacus vel tortor pharetra.')
# ... (continue with the rest of your comment seeds)

# like seeds 
first_like = Like.create(post_id: first_post.id, user_id: first_user.id)
second_like = Like.create(post_id: first_post.id, user_id: second_user.id)
third_like = Like.create(post_id: first_post.id, user_id: third_user.id)
fourth_like = Like.create(post_id: first_post.id, user_id: fourth_user.id)
fifth_like = Like.create(post_id: first_post.id, user_id: fifth_user.id)
# ... (continue with the rest of your like seeds)
puts 'Done seeding!'
include RandomData

#Create Unique Post
1.times do
  Post.find_or_create_by!(

  title: "Unique Post Title",
  body: "Unique Post Body"
  )
end


#Create Posts
50.times do
  Post.create!(

    title: RandomData.random_sentence,
    body:  RandomData.random_paragraph
  )
end
posts = Post.all

#Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "Seeds finished"
puts "#{Post.count} posts created!"
puts "#{Comment.count} comments created!"

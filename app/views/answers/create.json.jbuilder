if @answer.persisted?
  json.form json.partial!('reviews/form.html.erb', reading_group: @reading_group, answer: Answer.new)
  json.inserted_item json.partial!('restaurants/review.html.erb', answer: @answer)
else
  json.form json.partial!('reviews/form.html.erb', reading_group: @reading_group, answer: @answer)
end

Given(/^there are two comments$/) do
  @commenter = FactoryGirl.create :user
  @group.add_member! @commenter
  @first_comment = @discussion.add_comment @commenter, "hey there", uses_markdown: false
  @second_comment = @discussion.add_comment @commenter, "I said hello", uses_markdown: false
end

Then(/^I should see the comments in order of creation$/) do
  page.should have_css(".activity-item-container:first-child > div > #comment-#{@first_comment.id}")
end

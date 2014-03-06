module QuestionsHelper

  def are_u_on_yr_questions_page?
    action_name == 'your_questions'
  end

end
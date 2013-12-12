module ApplicationHelper  
  
  # Based on the current page will return the path for the next page
  def page_to_pageable_path(user, page) 
    if page.pageable_type == "Question"    
      return user_subject_question_path(user.id, page.subject_id, page.pageable.id)
    elsif page.pageable_type == "Instruction"
      return user_subject_instruction_path(user.id, page.subject_id, page.pageable.id)
    else
      return user_subjects_path
    end
  end
  
  # Progress Bar will return a visual representation of the student's progress (currently not using but will for when we introduce the test models)
  def progress_bar(width)
    if width > 0
      string = '<h3 class="progress large-6 success round"><span class="meter" style="width: ' + width.to_s + '%"></span></h3>'
    else 
      string = '<div></div>'      
    end
    string.html_safe
  end

  def admin?
  current_user.admin == true
  end
end




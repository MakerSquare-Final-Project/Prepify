module Admin::UsersHelper

  def admin_progress_report(courses)    
    report = ""
    courses.sort.each do |course|
      if course.completed_at.nil?        
        last_page_user_completed = course.page_id
        total_pages = course.subject.pages.count
        user_progress = last_page_user_completed / total_pages * 10
        report += content_tag(:h3, class: 'report panel incomplete') { "#{course.subject.name}: #{user_progress.round}% Completed"}
        report += progress_bar(user_progress)
      else
        report += content_tag(:h3, class: 'report panel complete') {  "#{course.subject.name}: Completed!" }
      end
    end
    report.html_safe
  end
end
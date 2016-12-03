<%= simple_form_for(@syllabus) do |f| %>
  <%= f.error_notification %>

  <div class="form-inputs">
    <%= f.association :training_course %>
    <%= f.association :school %>
    <%= f.input :course_time %>
    <%= f.input :title %>
    <%= f.input :content %>
  </div>

  <div class="form-actions">
    <%= f.button :submit %>
  </div>
<% end %>

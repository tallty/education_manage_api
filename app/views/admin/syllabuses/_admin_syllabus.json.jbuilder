<%= simple_form_for(@admin_syllabus) do |f| %>
  <%= f.error_notification %>

  <div class="form-inputs">
  </div>

  <div class="form-actions">
    <%= f.button :submit %>
  </div>
<% end %>

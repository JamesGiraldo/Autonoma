crumb :root do
  link " Home ", root_path
end
#users
crumb :users do
  link "Usuarios ", users_path
end
crumb :user_edit do |user|
  link "Editar Perfil: #{user.email}", edit_user_path(user)
end
crumb :user_password_edit do |user|
  link "Cambiar contraseña", edit_user_path(user)
end
#fin Users
#novedad
crumb :cursos do
  link "Cursos ", cursos_path
end

crumb :cursos_new do
   link "Nuevo Curso ", cursos_path
   parent :novedades
end

crumb :curso_show do |curso|
   link "#{curso.nombre}", curso_path(curso)
   parent :curso, curso
end

crumb :curso_edit do |curso|
  link "Editar Curso: #{curso.nombre}", edit_curso_path(curso)
  parent :curso_show, curso
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).

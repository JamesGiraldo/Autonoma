crumb :root do
  link " Home ", root_path
end
#users
crumb :users do
  link "Usuarios ", users_path
end
crumb :users_instructores do
  link "Docentes ", index_instructores_users_path
end
crumb :user_edit do |user|
  link "Editar Perfil: #{user.email}", edit_user_path(user)
end
crumb :user_password_edit do |user|
  link "Cambiar contraseña", edit_user_path(user)
end
#fin Users
#curso
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
#fin curso
#lineas
crumb :lineas do
  link "Lineas ", lineas_path
end

crumb :linea_new do
   link " Nueva Linea ", lineas_path
   parent :lineas
end

crumb :linea_show do |linea|
   link "#{linea.nombre}", linea_path(linea)
   parent :lineas
end

crumb :linea_edit do |linea|
  link " Editar Linea: #{linea.nombre} ", edit_linea_path(linea)
  parent :linea_show, linea
end
#fin lineas
#cursos
crumb :cursos do
  link "Cursos ", cursos_path
end

crumb :curso_new do
   link " Nuevo Curso ", cursos_path
   parent :cursos
end

crumb :curso_show do |curso|
   link "#{curso.nombre}", curso_path(curso)
   parent :cursos
end

crumb :curso_edit do |curso|
  link " Editar Curso: #{curso.nombre} ", edit_curso_path(curso)
  parent :curso_show, curso
end
#fin cursos
#programas
crumb :programas do
  link "Programas ", programas_path
end

crumb :programa_new do
   link " Nuevo Programa ", programas_path
   parent :programas
end

crumb :programa_show do |programa|
   link "#{programa.nombre}", programa_path(programa)
   parent :programas
end

crumb :programa_edit do |programa|
  link " Editar Programa: #{programa.nombre} ", edit_programa_path(programa)
  parent :programa_show, programa
end
#fin programas
#facultades
crumb :facultades do
  link "Facultades ", facultades_path
end

crumb :facultad_new do
   link " Nueva Facultad ", facultades_path
   parent :facultades
end

crumb :facultad_show do |facultad|
   link "#{facultad.nombre}", facultad_path(facultad)
   parent :facultades
end

crumb :facultad_edit do |facultad|
  link " Editar Facultad: #{facultad.nombre} ", edit_facultad_path(facultad)
  parent :facultad_show, facultad
end
#fin facultades
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

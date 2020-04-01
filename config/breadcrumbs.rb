# frozen_string_literal: true
crumb :root do
  link ' Home ', root_path
end
# users
crumb :users do
  link 'Usuarios ', users_path
end
crumb :users_instructores do
  link 'Docentes ', instructores_users_path
end
crumb :users_vicerrectores do
  link 'Directores ', directores_users_path
end
crumb :users_vicerrectores do
  link 'Vicerrectores ', vicerrectores_users_path
end
crumb :users_decanos do
  link 'Decanos ', decanos_users_path
end
crumb :usuarios_show do |user|
  if user.nombre.present?
    link "Informacion: #{user.nombre}", ver_datos_user_path(user)
  else
    link "Informacion: #{user.email}", ver_datos_user_path(user)
  end
end
crumb :user_edit do |user|
  if user.nombre.present?
    link "Editar Perfil: #{user.nombre}", edit_user_path(user)
  else
    link "Editar Perfil: #{user.email}", edit_user_path(user)
  end
end
crumb :user_password_edit do |user|
  link 'Cambiar contraseña', edit_user_path(user)
  parent :user_edit, user
end
# fin Users
# curso
crumb :cursos do
  link 'Cursos ', cursos_path
end

crumb :cursos_new do
  link 'Nuevo Curso ', cursos_path
  parent :novedades
end

crumb :curso_show do |curso|
  link curso.nombre.to_s, curso_path(curso)
  parent :curso, curso
end

crumb :curso_edit do |curso|
  link "Editar Curso: #{curso.nombre}", edit_curso_path(curso)
  parent :curso_show, curso
end
# fin curso
# lineas
crumb :lineas do
  link 'Lineas ', lineas_path
end

crumb :linea_new do
  link ' Nueva Linea ', lineas_path
  parent :lineas
end

crumb :cursos_usuarios_linea do |_linea|
  link 'Mis Cursos', linea_cursos_usuarios_path
  parent :lineas
end

crumb :cursos_linea do |_linea|
  link 'Cursos', linea_cursos_path
  parent :lineas
end

crumb :linea_show do |linea|
  link linea.nombre.to_s, linea_path(linea)
  parent :lineas
end

crumb :linea_edit do |linea|
  link " Editar Linea: #{linea.nombre} ", edit_linea_path(linea)
  parent :linea_show, linea
end
# fin lineas
# cursos
crumb :cursos do
  link 'Cursos ', cursos_path
  parent :lineas
end

crumb :cursos_usuarios do
  link ' Mis Cursos ', cursos_usuarios_path
  parent :lineas
end

crumb :curso_new do
  link ' Nuevo Curso ', cursos_path
  parent :cursos
end

crumb :curso_show do |curso|
  link curso.nombre.to_s, curso_path(curso)
  parent :cursos
end

crumb :curso_edit do |curso|
  link " Editar Curso: #{curso.nombre} ", edit_curso_path(curso)
  parent :curso_show, curso
end
# fin cursos
# programas
crumb :programas do
  link 'Programas ', programas_path
  parent :facultades
end

crumb :programa_new do
  link ' Nuevo Programa ', programas_path
  parent :programas
end

crumb :programa_show do |programa|
  link programa.nombre.to_s, programa_path(programa)
  parent :programas
end

crumb :programa_edit do |programa|
  link " Editar Programa: #{programa.nombre} ", edit_programa_path(programa)
  parent :programa_show, programa
end
crumb :programa_users do |programa|
  link " Docentes del Programa: #{programa.nombre} ", programa_users_path(programa)
  parent :programas, programa
end
# fin programas
# facultades
crumb :facultades do
  link 'Facultades ', facultades_path
end

crumb :facultad_new do
  link ' Nueva Facultad ', facultades_path
  parent :facultades
end

crumb :facultad_show do |facultad|
  link facultad.nombre.to_s, facultad_path(facultad)
  parent :facultades
end

crumb :facultad_edit do |facultad|
  link " Editar Facultad: #{facultad.nombre} ", edit_facultad_path(facultad)
  parent :facultad_show, facultad
end

crumb :facultad_programas do |facultad|
  link " Programas de la Facultad: #{facultad.nombre} ", facultad_programas_path(facultad)
  parent :facultades, facultad
end
# fin facultades
crumb :comentarios do
  link ' Comentarios ', comentarios_path
end

crumb :comentario_show do |comentario|
  link comentario.titulo.to_s, comentario_path(comentario)
  parent :comentarios
end

crumb :proyecciones do
  link ' Proyecciones', proyecciones_path
end

crumb :proyeccion_show do |proyeccion|
  link proyeccion.nombre, proyeccion_path(proyeccion)
  parent :proyecciones
end
# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).

# frozen_string_literal: true
crumb :root do
  link ' HOME ', root_path
end
# users
crumb :users do
  link 'USUARIOS ', users_path
end
crumb :users_instructores do
  link 'DOCENTES ', instructores_users_path
end
crumb :users_vicerrectores do
  link 'DIRECTORES ', directores_users_path
end
crumb :users_vicerrectores do
  link 'VICERRECTORES ', vicerrectores_users_path
end
crumb :users_decanos do
  link 'DECANOS ', decanos_users_path
end
crumb :usuarios_show do |user|
  if user.nombre.present?
    link "#{user.nombre.upcase}", ver_datos_user_path(user)
  else
    link "#{user.email.upcase}", ver_datos_user_path(user)
  end
end
crumb :user_edit do |user|
  if user.nombre.present?
    link "PERFIL: #{user.nombre.upcase}", edit_user_path(user)
  else
    link "PERFIL: #{user.email.upcase}", edit_user_path(user)
  end
end
crumb :user_password_edit do |user|
  link 'CAMBIAR CONTRASEÑA', edit_user_path(user)
  parent :user_edit, user
end
# fin Users
# curso
crumb :cursos do
  link 'CURSOS ', cursos_path
end

crumb :cursos_new do
  link 'NUEVO CURSO ', cursos_path
  parent :novedades
end

crumb :curso_show do |curso|
  link curso.nombre.to_s.upcase, curso_path(curso)
  parent :curso, curso
end

crumb :curso_edit do |curso|
  link "EDITAR CURSO: #{curso.nombre.upcase}", edit_curso_path(curso)
  parent :curso_show, curso
end
# fin curso
# lineas
crumb :lineas do
  link 'LINEAS ', lineas_path
end

crumb :linea_new do
  link ' NUEVA LINEA ', lineas_path
  parent :lineas
end

crumb :cursos_usuarios_linea do |_linea|
  link 'MIS CURSOS', linea_cursos_usuarios_path
  parent :lineas
end

crumb :cursos_linea do |_linea|
  link 'CURSOS', linea_cursos_path
  parent :lineas
end

crumb :linea_show do |linea|
  link linea.nombre.to_s.upcase, linea_path(linea)
  parent :lineas
end

crumb :linea_edit do |linea|
  link " EDITAR LINEA: #{linea.nombre.upcase} ", edit_linea_path(linea)
  parent :linea_show, linea
end
# fin lineas
# cursos
crumb :cursos do
  link 'CURSOS ', cursos_path
  parent :lineas
end

crumb :cursos_usuarios do
  link ' MIS CURSOS ', cursos_usuarios_path
  parent :lineas
end

crumb :curso_new do
  link ' NUEVO CURSO ', cursos_path
  parent :cursos
end

crumb :curso_show do |curso|
  link curso.nombre.to_s.upcase, curso_path(curso)
  parent :cursos
end

crumb :curso_edit do |curso|
  link " EDITAR CURSO: #{curso.nombre.upcase} ", edit_curso_path(curso)
  parent :curso_show, curso
end
# fin cursos
# programas
crumb :programas do
  link 'PROGRAMAS ', programas_path
  parent :facultades
end

crumb :programa_new do
  link ' NUEVO PROGRAMA ', programas_path
  parent :programas
end

crumb :programa_show do |programa|
  link programa.nombre.to_s.upcase, programa_path(programa)
  parent :programas
end

crumb :programa_edit do |programa|
  link " EDITAR PROGRAMA: #{programa.nombre.upcase} ", edit_programa_path(programa)
  parent :programa_show, programa
end
crumb :programa_users do |programa|
  link " DOCENTES DE PROGRAMA: #{programa.nombre.upcase} ", programa_users_path(programa)
  parent :facultad_programas, programa
end
# fin programas
# facultades
crumb :facultades do
  link 'FACULTADES ', facultades_path
end

crumb :facultad_new do
  link ' NUEVA FACULTAD ', facultades_path
  parent :facultades
end

crumb :facultad_show do |facultad|
  link facultad.nombre.to_s.upcase, facultad_path(facultad)
  parent :facultades
end

crumb :facultad_edit do |facultad|
  link " EDITAR FACULTAD: #{facultad.nombre} ", edit_facultad_path(facultad)
  parent :facultad_show, facultad
end

crumb :facultad_programas do |facultad|
  link "#{facultad.nombre.upcase}" , facultades_path
  parent :facultades, facultad
end
# fin facultades
crumb :comentarios do
  link ' COMENTARIOS ', comentarios_path
end

crumb :comentario_show do |comentario|
  link comentario.titulo.to_s.upcase, comentario_path(comentario)
  parent :comentarios
end

crumb :proyecciones do
  link ' PROYECCIONES', proyecciones_path
end

crumb :proyeccion_show do |proyeccion|
  link proyeccion.nombre.upcase, proyeccion_path(proyeccion)
  parent :proyecciones
end
# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).

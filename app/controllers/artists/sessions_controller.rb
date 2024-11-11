# app/controllers/artists/sessions_controller.rb
class Artists::SessionsController < Devise::SessionsController
    # Redirigir a los artistas después del inicio de sesión
    def after_sign_in_path_for(resource)
      admin_dashboard_index_path # Cambia a la ruta que prefieras
    end
  
    # Redirigir a los artistas después de cerrar sesión
    def after_sign_out_path_for(resource)
      new_artist_session_path
    end
  end
  
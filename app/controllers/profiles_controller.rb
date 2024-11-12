class ProfilesController < ApplicationController
    before_action :authenticate_user!  # Asegura que el usuario esté autenticado
  
    def show
      @user = current_user  # Cargar el usuario actual
    end
  
    def edit
      @user = current_user  # Cargar el usuario actual
    end
  
    def update
      @user = current_user  # Cargar el usuario actual
      if @user.update(user_params)
        redirect_to profile_path, notice: 'Perfil actualizado con éxito.'
      else
        render :edit
      end
    end
  
    private
  
    def user_params
      # Permitir los parámetros adicionales
      params.require(:user).permit(:username, :biography, :facebook, :x, :instagram)
    end
  end
  
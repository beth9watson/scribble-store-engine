require_dependency "scribble_store/application_controller"

module ScribbleStore
  class ScribblesController < ApplicationController
    before_action :set_scribble, only: [:show, :edit, :update, :destroy]

    # GET /scribbles
    def index
      @scribbles = Scribble.all
    end

    # GET /scribbles/1
    def show
    end

    # GET /scribbles/new
    def new
      @scribble = Scribble.new
    end

    # GET /scribbles/1/edit
    def edit
    end

    # POST /scribbles
    def create
      @scribble = Scribble.new(scribble_params)

      if @scribble.save
        redirect_to @scribble, notice: 'Scribble was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /scribbles/1
    def update
      if @scribble.update(scribble_params)
        redirect_to @scribble, notice: 'Scribble was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /scribbles/1
    def destroy
      @scribble.destroy
      redirect_to scribbles_url, notice: 'Scribble was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_scribble
        @scribble = Scribble.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def scribble_params
        params.require(:scribble).permit(:image, :artist_email)
      end
  end
end

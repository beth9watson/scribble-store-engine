require_dependency "scribble_store/application_controller"

module ScribbleStore
  class ScribblesController < ApplicationController
    before_action :set_scribble, only: [:show]

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

    # POST /scribbles
    def create
      @scribble = Scribble.new(scribble_params)
      
      if @scribble.save
        if scribble_params[:image].present?
          render :crop
        else
          redirect_to @scribble, notice: 'Scribble was successfully created.'
        end
      else
        render :new, status: 400
      end
    end

    def update
      @scribble = Scribble.find(params[:id])
      
      if @scribble.update(scribble_params)
        if scribble_params[:image].present?
          render :crop
        else
          redirect_to @scribble, notice: 'Scribble was successfully updated.'
        end
      else
        redirect_to @scribble, error: @scribble.errors.full_messages.join(', ')
      end
    end

    private

      def crop_params
        %i(crop_x crop_y crop_w crop_h)
      end
      # Use callbacks to share common setup or constraints between actions.
      def set_scribble
        @scribble = Scribble.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def scribble_params
        params.require(:scribble).permit(:image, :artist_email, :source_scribble_id, *crop_params)
      end
  end
end

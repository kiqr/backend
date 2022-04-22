# frozen_string_literal: true

module Backend
  class ResourcesController < ApplicationController
    include Pagy::Backend

    helper_method :backend
    helper_method :resources_path, :resource_path, :edit_resource_path, :new_resource_path

    def index
      @pagy, @resources = pagy(find_resources)
    end

    def edit
      @resource = find_resource
    end

    def update
      @resource = find_resource
      if @resource.update(resource_params)
        redirect_to edit_resource_path(@resource), notice: "#{backend.model.name.humanize} was successfully updated."
      else
        render :edit
      end
    end

    def new
      @resource = backend.model.new
    end

    def create
      @resource = backend.model.create(resource_params)
      if @resource.save
        redirect_to edit_resource_path(@resource), notice: "#{backend.model.name.humanize} was successfully created."
      else
        render :new
      end
    end

    def destroy
      @resource = find_resource
      if @resource.destroy
        redirect_to resources_path, notice: "#{backend.model.name.humanize} was successfully deleted."
      else
        redirect_to edit_resource_path(@resource), alert: "Could not delete #{backend.model.name.humanize}."
      end
    end

    private

    # :api: public
    def backend
      params[:backend]
    end

    # Find specific resource by ID.
    # This method can be overwritten in a subclass.
    # :api: public
    def find_resource
      backend.model.find(params[:id])
    end

    # Find all resources.
    # :api: public
    def find_resources
      backend.model.all
    end

    # Generates a path to index of resources.
    def resources_path
      backend.full_path
    end

    # Generates a path to show a resource.
    def resource_path(resource)
      id = resource.id
      "#{resources_path}/#{id}"
    end

    # Generates a path to edit a resource.
    def edit_resource_path(resource)
      id = resource.id
      "#{resources_path}/#{id}/edit"
    end

    # Generates a path to show a resource.
    def new_resource_path
      "#{resources_path}/new"
    end

    def resource_params
      permitted_attributes = backend.fields.map(&:permitted_params).flatten
      params.require(backend.params_key).permit(permitted_attributes)
    end

    # # Find resource by id. This method can be overridden in a custom subcontroller.
    # def find_resource
    #   klass.find(params[:id])
    # end

    # Get an array with editable column fields/attributes.
    # def resource_fields
    #   backend_resource.fields
    # end
  end
end

class Api::V1::PackagesController < ApplicationController
  def index
    @packages = Package.all
    render jsonapi: @packages
  end
end

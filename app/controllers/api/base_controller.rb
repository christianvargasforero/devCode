class Api::BaseController < InheritedResources::Base
  respond_to :xml, :json
end

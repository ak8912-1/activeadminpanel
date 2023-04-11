class AssetsController < InheritedResources::Base

  private

    def asset_params
      params.require(:asset).permit(:name, :condition)
    end

end

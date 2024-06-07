# frozen_string_literal: true

# Base controller for the application.
class ApplicationController < ActionController::Base
  private

  # Renders a Turbo Stream response based on the action and parameters.
  #
  # Parameters:
  # - action (String): The Turbo Stream action ('replace', 'append', 'prepend', etc.).
  # - target (String): The Turbo Stream target element ID or name.
  # - partial (String, optional): The name of the partial to render.
  # - locals (Hash, optional): Local variables to pass to the partial.
  def render_turbo_stream(action, target, partial = nil, locals = {})
    respond_to do |format|
      format.turbo_stream do
        case action
        when 'replace'
          render turbo_stream: turbo_stream.replace(target, partial:, locals:)
        end
      end
    end
  end
end

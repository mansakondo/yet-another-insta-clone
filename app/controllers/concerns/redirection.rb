module Redirection
  extend ActiveSupport::Concern

  included do
    include ActionView::RecordIdentifier

    def redirect_back_to_anchor(anchor, fallback_location:, allow_other_host: _allow_other_host, **options)
      if request.referer && (allow_other_host || _url_host_allowed?(request.referer))
        if anchor.respond_to? :to_key
          redirect_to dom_path(anchor), allow_other_host: allow_other_host, **options
        else
          redirect_to back_to_anchor_path(anchor), allow_other_host: allow_other_host, **options
        end
      else
        # The method level `allow_other_host` doesn't apply in the fallback case, omit and let the `redirect_to` handling take over.
        redirect_to fallback_location, **options
      end
    end

    def dom_path(record)
      back_to_anchor_path(dom_id(record))
    end

    def back_to_anchor_path(anchor)
      "#{request.referer}##{anchor.sub(/^#/, "")}"
    end
  end
end

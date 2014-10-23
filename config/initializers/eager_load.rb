# This file is required so that we can call `Post.formats` and know about all
# of the sublcasses for `Post`.
#
# https://github.com/rails/rails/issues/3364

ActionDispatch::Reloader.to_prepare do
  Rails.application.eager_load!
end

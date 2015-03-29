class Admin::AdminController < AuthorizedController
  include AdminOnly
end

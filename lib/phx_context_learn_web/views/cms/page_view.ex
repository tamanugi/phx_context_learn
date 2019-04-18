defmodule PhxContextLearnWeb.CMS.PageView do
  use PhxContextLearnWeb, :view

  alias PhxContextLearn.CMS

  def author_name(%CMS.Page{author: author}) do
    author.user.name
  end
end

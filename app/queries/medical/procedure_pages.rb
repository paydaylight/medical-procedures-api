class Queries::Medical::ProcedurePages
  DATA_PER_PAGE = 10

  def self.fetch(page:)
    ::Medical::Procedure.page(page).per(DATA_PER_PAGE)
  end
end
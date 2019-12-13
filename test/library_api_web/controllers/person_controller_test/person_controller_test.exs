defmodule LibraryApiWeb.PersonControllerTest do
  use LibraryApiWeb.ConnCase

  describe "create person" do
    test "with valid parameters" do
      params = %{
        	"first_name": "Jon",
	        "middle_name": "Sand",
	        "last_name": "Snow",
	        "suffix": "",
	        "birth_date": "1995-01-01",
	        "id_type": "SSSID",
	        "id_no": "123test",
	        "address": "Makati",
	        "contact_no": "09126548798"
      }

      conn = post(build_conn(), "/api/library/create_person", params)
      assert json_response(conn, 200) == %{"success" => true}
    end
  end
end
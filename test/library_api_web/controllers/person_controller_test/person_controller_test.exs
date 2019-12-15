defmodule LibraryApiWeb.PersonControllerTest do
  use LibraryApiWeb.ConnCase

  setup do
    insert(:person, %{
      first_name: "#{Faker.Name.first_name}",
      middle_name: "#{Faker.Name.last_name}",
      last_name: "#{Faker.Name.last_name}",
      suffix: "#{Faker.Name.suffix}",
      birth_date: "1992-01-01",
      id_type: "Drivers License",
      id_no: "123AVCX123",
      address: "Quezon City",
      contact_no: "09201234567"
    })

    {:ok, %{}}
  end

  defp request_params(key, val) do
    Map.put(%{
      "first_name": "#{Faker.Name.first_name}",
	    "middle_name": "#{Faker.Name.last_name}",
	    "last_name": "#{Faker.Name.last_name}",
	    "suffix": "#{Faker.Name.suffix}",
	    "birth_date": "1995-01-01",
	    "id_type": "SSSID",
	    "id_no": "123AVCX123",
	    "address": "",
	    "contact_no": "09126548798"
    }, key, val)
  end

  describe "create person" do
    test "with valid parameters" do
      conn = post(build_conn(), "/api/library/create_person", request_params(:id_no, "123XXX22"))
      assert json_response(conn, 200) == %{"success" => true}
    end

    test "with empty parameters" do
      params = %{
        	"first_name": "",
	        "middle_name": "",
	        "last_name": "",
	        "suffix": "",
	        "birth_date": "",
	        "id_type": "",
	        "id_no": "",
	        "address": "",
	        "contact_no": ""
      }

      conn = post(build_conn(), "/api/library/create_person", params)
      assert json_response(conn, 200)["errors"]["birth_date"] == "Enter birth date"
      assert json_response(conn, 200)["errors"]["contact_no"] == "Enter contact no"
      assert json_response(conn, 200)["errors"]["first_name"] == "Enter first name"
      assert json_response(conn, 200)["errors"]["id_no"] == "Enter id no"
      assert json_response(conn, 200)["errors"]["last_name"] == "Enter last name"
    end

    test "with person already exist" do
      conn = post(build_conn(), "/api/library/create_person", request_params(:id_no, "123AVCX123"))
      assert json_response(conn, 200)["errors"]["id_no"] == "Person already exist."
    end
  end

  describe "get person" do
    test "with valid parameters" do
      params = %{
        id_no: "123AVCX123",
        contact_no: "09201234567"
      }
      conn = post(build_conn(), "/api/library/get_person", params)
      assert json_response(conn, 200)["id_no"] == "123AVCX123"
    end

    test "with empty parameters" do
      params = %{
        id_no: "",
        contact_no: ""
      }
      conn = post(build_conn(), "/api/library/get_person", params)
      assert json_response(conn, 200)["errors"]["id_no"] == "Enter id no"
      assert json_response(conn, 200)["errors"]["contact_no"] == "Enter contact no"
    end

    test "with person does not exist" do
      params = %{
        id_no: "invalid",
        contact_no: "98746541"
      }
      conn = post(build_conn(), "/api/library/get_person", params)
      assert json_response(conn, 200)["errors"]["id_no"] == "Person does not exist."
    end        
  end

  describe "delete person" do
    test "with valid parameter" do
      params = %{
        id_no: "123AVCX123"
      }
      conn = post(build_conn(), "/api/library/delete_person", params)
      assert json_response(conn, 200) == %{"success" => true}
    end

    test "with person does not exist" do
      params = %{
        id_no: "not-exist"
      }
      conn = post(build_conn(), "/api/library/delete_person", params)
      assert json_response(conn, 200)["errors"]["id_no"] == "Person does not exist."
    end
  end
end
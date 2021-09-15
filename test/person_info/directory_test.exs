defmodule PersonInfo.DirectoryTest do
  use PersonInfo.DataCase

  alias PersonInfo.Directory

  describe "persons" do
    alias PersonInfo.Directory.Person

    @valid_attrs %{avatar: "some avatar", name: "some name", role: "some role"}
    @update_attrs %{avatar: "some updated avatar", name: "some updated name", role: "some updated role"}
    @invalid_attrs %{avatar: nil, name: nil, role: nil}

    def person_fixture(attrs \\ %{}) do
      {:ok, person} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_person()

      person
    end

    test "list_persons/0 returns all persons" do
      person = person_fixture()
      assert Directory.list_persons() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert Directory.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      assert {:ok, %Person{} = person} = Directory.create_person(@valid_attrs)
      assert person.avatar == "some avatar"
      assert person.name == "some name"
      assert person.role == "some role"
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      assert {:ok, %Person{} = person} = Directory.update_person(person, @update_attrs)
      assert person.avatar == "some updated avatar"
      assert person.name == "some updated name"
      assert person.role == "some updated role"
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_person(person, @invalid_attrs)
      assert person == Directory.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = Directory.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = Directory.change_person(person)
    end
  end
end

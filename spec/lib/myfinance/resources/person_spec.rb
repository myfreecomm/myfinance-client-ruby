require 'spec_helper'

describe Myfinance::Resources::Person, vcr: true do
  let(:entity_klass) { Myfinance::Entities::Person }

  describe "#find_all" do
    context "with success" do
      subject { client.people.find_all }

      it "show all people successfully" do
        expect(subject).to be_a(Myfinance::Entities::PersonCollection)
        expect(subject.collection.first).to be_a(entity_klass)
        expect(subject.collection.first.name).to eq("João das neves")
      end

      context "with params" do
        it "find people by attributte name_equals" do
          result = client.people.find_all( name_equals: "Myfreecomm", person_type_in: "JuridicalPerson")
          expect(result).to be_a(Myfinance::Entities::PersonCollection)
          expect(result.collection.first.name).to eq("Myfreecomm")
        end

        it "find people by attributte with special characters" do
          result = client.people.find_all(name_equals: "João das neves")
          expect(result).to be_a(Myfinance::Entities::PersonCollection)
          expect(result.collection.first.name).to eq("João das neves")
        end

        it "find people by attributte federation_subscription_number_equals" do
          result = client.people.find_all(
            { federation_subscription_number_equals: "42.308.611/0001-41" }
          )
          expect(result).to be_a(Myfinance::Entities::PersonCollection)
          expect(result.collection.first.name).to eq("Myfreecomm")
        end
        context "with error" do
          let(:client) { Myfinance.client("") }

          it "raises Myfinance::RequestError with 401 status code" do
            params = { name_equals: "Myfreecomm" }
            expect { client.people.find_all(params) }.to raise_error(Myfinance::RequestError) do |error|
              expect(error.code).to eq(401)
            end
          end
        end
      end
    end
  end

  context "when not found" do
    let(:client) { Myfinance.client("") }

    it "raises Myfinance::RequestError with 401 status code" do
      expect { client.people.find_all }.to raise_error(Myfinance::RequestError) do |error|
        expect(error.code).to eq(401)
      end
    end
  end

  describe "#find" do
    context "with success" do
      subject { client.people.find(199424) }

      it "show a person successfully" do
        expect(subject).to be_a(entity_klass)
        expect(subject.name).to eq("Myfreecomm")
        expect(subject.person_type).to eq("JuridicalPerson")
      end
    end

    context "when not found" do
      it "raises Myfinance::RequestError with 404 status code" do
        expect {
          client.people.find(8888888)
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end
    end
  end

  describe "#create" do
    context "with success" do
      let(:person) { { name: "Person 1" } }

      it "creates a person successfully" do
        result = client.people.create(person)
        expect(result).to be_a(entity_klass)
        expect(result.name).to eq("Person 1")
      end
    end

    context "with error" do
      let(:person) { { name: "" } }

      it "raises Myfinance::RequestError with 422 status code" do
        expect {
          client.people.create(person)
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(422)
        end
      end
    end
  end

  describe "#update" do
    context "with success" do
      it "updates a person successfully" do
        expect(
          client.people.update(207486, { name: "Person updated" })
        ).to be_a(entity_klass)
      end
    end

    context "with error" do
      it "raises Myfinance::RequestError with 422 status code" do
        expect {
          client.people.update(207486, { name: "" })
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(422)
        end
      end
    end
  end

  describe "#destroy" do
    context "with success" do
      it "destroy a person successfully" do
        expect(client.people.destroy(207486)).to be_truthy
      end
    end

    context "with error" do
      it "raises Myfinance::RequestError with 404 status code" do
        expect {
          client.people.destroy(123456)
        }.to raise_error(Myfinance::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end
    end
  end
end

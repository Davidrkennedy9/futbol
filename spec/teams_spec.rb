require "spec_helper"

RSpec.describe Team do

    before :each do

        @team = Team.new({ team_id: "1", franchiseid: "23", teamname: "Atlanta United", abbreviation: "ATL", stadium: "Mercedes-Benz Stadium", link: "/api/v1/teams/1" })

    end

    describe "initialize" do

        it "exist" do

         expect(@team).to be_a(Team)

        end

    end

    describe "attributes" do

        it "has attributes" do

         expect(@team.team_id).to eq(1)
         expect(@team.franchiseid).to eq(23)
         expect(@team.teamname).to eq("Atlanta United")
         expect(@team.abbreviation).to eq("ATL")
         expect(@team.stadium).to eq("Mercedes-Benz Stadium")
         expect(@team.link).to eq("/api/v1/teams/1")

        end
        
    end
end       
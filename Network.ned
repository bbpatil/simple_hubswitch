//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

//
// TODO auto-generated type
//
channel ch extends ned.DatarateChannel
{
    datarate = 1Gbps;
    delay = 500ns;	
}

network Network
{
    @display("bgb=561,362");
    submodules:
        computer[4]: Computer {
            @display("p=68,246,r,100");
        }
        hubSwitch: HubSwitch {
            @display("p=230,83");
        }
    connections:
        for i=0..3 {
            computer[i].out -->ch--> hubSwitch.in++;
            hubSwitch.out++ -->ch--> computer[i].in;
        }
}

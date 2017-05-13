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
module HubSwitch
{
    parameters:
        @display("i=device/hub;bgb=417,324");
    gates:
        input in[];
        output out[];

    submodules:
        classifier: Classifier {
            @display("p=44,86");
        }
        queue: Queue {
            @display("p=220,47");
        }
        queue1: Queue {
            @display("p=220,114");
        }
        queue2: Queue {
            @display("p=220,177");
        }
        queue3: Queue {
            @display("p=220,261");
        }
    connections:
        classifier.out++ --> queue.in;
        classifier.out++ --> queue1.in;
        classifier.out++ --> queue2.in;
        classifier.out++ --> queue3.in;
        queue.out --> out++;
        queue1.out --> out++;
        queue2.out --> out++;
        queue3.out --> out++;
        
        for i = 0..3{
            in++ --> classifier.in++;
        }
}

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
module Computer
{
    parameters:
        @display("i=device/laptop;bgb=326,216");
    gates:
        input in;
        output out;

    submodules:
        handler: Handler {
            @display("p=158,119");
        }
        queue: Queue {
            @display("p=238,117");
            capacity = 2;
        }
    connections:
        handler.out --> queue.in;
        queue.out --> out;
        in --> handler.in;
}

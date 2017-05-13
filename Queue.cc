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

#include "Queue.h"

Define_Module(Queue);

void Queue::initialize(){
    capacity = par("capacity");
}

void Queue::handleMessage(cMessage *msg){
    cMessage *temp;

    if(capacity <= 0){
        delete msg;
        EV << "Dropped packet*********!" << endl;
    }else{
        queue.insert(msg);
        capacity--;

    }
    if (!gate("out")->getTransmissionChannel()->isBusy()){

        temp = (cMessage*)queue.pop();
        capacity++;
        send(temp, "out");
    }
}

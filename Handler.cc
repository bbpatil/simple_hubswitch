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

#include "Handler.h"
#include<string.h>


Define_Module(Handler);


void Handler::initialize(){

    cMessage *msg = new cMessage ("Message");
    cMessage *cmsg[4];
    numMsg = registerSignal("numMsg");
    for(int i =0; i<4; i++){
        cmsg[i] = msg->dup();
        scheduleAt(0.0, cmsg[i]);
        numMessages++;
        emit(numMsg, numMessages);
    }

}

void Handler::handleMessage(cMessage *msg){
    delete msg;
    numMessages++;
    emit(numMsg, numMessages);
    cMessage *new_msg = new cMessage ("Message");
    send(new_msg, "out");
}

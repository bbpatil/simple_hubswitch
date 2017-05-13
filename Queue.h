#import "omnetpp.h"
using namespace omnetpp;
class Queue : public cSimpleModule
{
    private:
        long capacity;
        cQueue queue;
    protected:
        virtual void initialize();
        virtual void handleMessage(cMessage *msg);
};

# ComebackApp

Application that notify you when, on a walking trip, you need to come back in order to arrive at a specific time.
My idea is to use it when, on lunch break I do a walk around the neighbourhood. 
If I set that I want to comeback to my place of work at 2 pm, I will be notified when I need to come back.

Objects currently being developed:

## PositionTracker
A class that gets the user position.
This way I can pass the “TimeDistanceCalculator” the position to compute the time.
I can use the system location getter but also an extenral library -> it's a protocol.

## TimeDistanceCalculator
A class that computes the time distance between the current location (source) and the destination place 

## ComebackTracker / ComebackChecker
A class that alerts the user when it needs to come back.
It needs to check the current time with the computed distance time.
When the set time minus the computed distance time equals the current time -> alert user


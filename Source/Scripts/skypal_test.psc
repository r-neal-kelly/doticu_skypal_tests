; Copyright © 2020 r-neal-kelly, aka doticu

Scriptname skypal_test extends ReferenceAlias

event OnInit()
    RegisterForSingleUpdate(2)
endEvent

event OnPlayerLoadGame()
    RegisterForSingleUpdate(2)
endEvent

event OnUpdate()
    Debug.Notification("SkyPal Tests: Starting...")
    (GetOwningQuest() as skypal_references_test).Test()
    (GetOwningQuest() as skypal_bases_test).Test()
    Debug.MessageBox("SkyPal Tests: Finished!")
endEvent

; Copyright © 2020 r-neal-kelly, aka doticu

Scriptname SkyPal_Test extends ReferenceAlias

event OnInit()
    RegisterForSingleUpdate(2)
endEvent

event OnPlayerLoadGame()
    RegisterForSingleUpdate(2)
endEvent

event OnUpdate()
    Debug.Notification("SkyPal Tests: Starting...")
    Test()
    (GetOwningQuest() as SkyPal_References_Test).Test()
    (GetOwningQuest() as SkyPal_Bases_Test).Test()
    Debug.MessageBox("SkyPal Tests: Finished!")
endEvent

function Test()
    Test_Has_Version()
endFunction

function Test_Has_Version()
    if SkyPal.Has_Version(1, 0, 0, "==") == false
        Debug.Trace("    Has_Version failed ==.")
    endIf
    if SkyPal.Has_Version(1, 0, 0, "!=") == true
        Debug.Trace("    Has_Version failed !=.")
    endIf
    if SkyPal.Has_Version(1, 0, 0, "<") == true
        Debug.Trace("    Has_Version failed <.")
    endIf
    if SkyPal.Has_Version(1, 0, 0, ">") == true
        Debug.Trace("    Has_Version failed >.")
    endIf
    if SkyPal.Has_Version(1, 0, 0, "<=") == false
        Debug.Trace("    Has_Version failed <=.")
    endIf
    if SkyPal.Has_Version(1, 0, 0, ">=") == false
        Debug.Trace("    Has_Version failed >=.")
    endIf
    Debug.Trace("    Completed Has_Version tests.")
endFunction

; Copyright © 2020 r-neal-kelly, aka doticu

Scriptname skypal_test extends Quest

; Runs only once.
event OnInit()
    RegisterForSingleUpdate(1)
endEvent

event OnUpdate()
    ((self as Quest) as skypal_references_test).Test()
    ((self as Quest) as skypal_bases_test).Test()
endEvent

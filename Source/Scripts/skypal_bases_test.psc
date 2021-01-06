; Copyright © 2020 r-neal-kelly, aka doticu

Scriptname skypal_bases_test extends Quest

function Test()
    if (skypal.Has_DLL())
        Test_From_References()
    endIf
endFunction

; tests
function Test_From_References()
    float start_time

    Debug.Trace("Begin: skypal_bases.From_References")
    Debug.Trace("")

    ObjectReference[] grid_refs = skypal_references.Grid()

    Debug.Trace("    (grid_refs, .)")
    start_time = skypal.Milliseconds()
    Form[] bases_b = skypal_bases.From_References(grid_refs, ".")
    Trace_Bases(bases_b, skypal.Milliseconds() - start_time, 15)
    Debug.Trace("")

    Debug.Trace("    (grid_refs, ...)")
    start_time = skypal.Milliseconds()
    Form[] bases_a = skypal_bases.From_References(grid_refs, "...")
    Trace_Bases(bases_a, skypal.Milliseconds() - start_time, 15)
    Debug.Trace("")
    
    Debug.Trace("End: skypal_bases.From_References")
    Debug.Trace("")
endFunction

; helpers
function Trace_Bases(Form[] bases, float milliseconds, int MAX_TO_DISPLAY = 50)
    Debug.Trace("    total: " + bases.length + ", milliseconds: " + milliseconds + ". (Showing up to " + MAX_TO_DISPLAY + ".)")

    int end = 0
    if (bases.length > MAX_TO_DISPLAY)
        end = MAX_TO_DISPLAY
    else
        end = bases.length
    endIf

    int idx = 0
    while (idx < end)
        Debug.Trace("    idx:" + idx + ", form_id: " + bases[idx].GetFormID() + ", name: " + bases[idx].GetName())
        idx += 1
    endWhile
endFunction

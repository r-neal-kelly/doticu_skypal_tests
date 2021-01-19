; Copyright © 2020 r-neal-kelly, aka doticu

Scriptname SkyPal_References_Test extends Quest

Actor property actor_player auto

FormList property form_list_temp auto
FormList property form_list_SoulGemsAll auto

Keyword property keyword_JobMerchant auto
Keyword property keyword_unique_dragonborn auto
Keyword property keyword_unique_player auto
Keyword property keyword_WeapTypeSword auto

function Test()
    if (skypal.Has_DLL())
        Test_Grid()

        Test_Filter_Potential_Thieves()

        ;Test_Count_Disabled()
        ;Test_Count_Enabled()

        ;Test_Disable()
        ;Test_Enable()

        ;Test_Filter_Deleted()
        ;Test_Filter_Enabled()

        ;Test_Sort_Distance()
        
        ;Test_Filter_Bases_Form_List()
        ;Test_Filter_Keywords()
        ;Test_Filter_Distance()
        ;Test_Filter()
        ;Test_Filter_Grid()
        ;Test_Filter_Grid_Actor()
        ;Test_Filter_Grid_Flora()
        ;Test_Filter_Grid_Actor_Flora()
    endIf
endFunction

; tests
function Test_Grid()
    int i
    int trials
    int result_count
    float total_time
    float start_time
    float stop_time

    Debug.Trace("Begin: skypal_references.Grid")
    Debug.Trace("")

    if true
        i = 0
        trials = 100
        total_time = 0
        while i < trials
            start_time = skypal.Milliseconds()
            skypal_references.Grid()
            stop_time = skypal.Milliseconds()
            total_time += stop_time - start_time
            i += 1
        endWhile
        result_count = skypal_references.Grid().length
        Trace_Test("()", result_count, trials, total_time)
    endIf

    Debug.Trace("")

    Debug.Trace("End: skypal_references.Grid")
    Debug.Trace("")
endFunction

function Test_Filter_Potential_Thieves()
    int i
    int trials
    int result_count
    float total_time
    float start_time
    float stop_time

    Debug.Trace("Begin: skypal_references.Filter_Potential_Thieves")
    Debug.Trace("")

    ObjectReference[] grid_refs = skypal_references.Grid()
    Actor[] thieves = new Actor[1]
    thieves[0] = actor_player

    if true
        i = 0
        trials = 100
        total_time = 0
        while i < trials
            start_time = skypal.Milliseconds()
            skypal_references.Filter_Potential_Thieves(grid_refs, thieves, "|")
            stop_time = skypal.Milliseconds()
            total_time += stop_time - start_time
            i += 1
        endWhile
        result_count = skypal_references.Filter_Potential_Thieves(grid_refs, thieves, "|").length
        Trace_Test("(grid, [player], '|')", result_count, trials, total_time)
    endIf
    if true
        i = 0
        trials = 100
        total_time = 0
        while i < trials
            start_time = skypal.Milliseconds()
            skypal_references.Filter_Potential_Thieves(grid_refs, thieves, "&")
            stop_time = skypal.Milliseconds()
            total_time += stop_time - start_time
            i += 1
        endWhile
        result_count = skypal_references.Filter_Potential_Thieves(grid_refs, thieves, "&").length
        Trace_Test("(grid, [player], '&')", result_count, trials, total_time)
    endIf
    if true
        i = 0
        trials = 100
        total_time = 0
        while i < trials
            start_time = skypal.Milliseconds()
            skypal_references.Filter_Potential_Thieves(grid_refs, thieves, "^")
            stop_time = skypal.Milliseconds()
            total_time += stop_time - start_time
            i += 1
        endWhile
        result_count = skypal_references.Filter_Potential_Thieves(grid_refs, thieves, "^").length
        Trace_Test("(grid, [player], '^')", result_count, trials, total_time)
    endIf
    if true
        i = 0
        trials = 100
        total_time = 0
        while i < trials
            start_time = skypal.Milliseconds()
            skypal_references.Filter_Potential_Thieves(grid_refs, thieves, "!|")
            stop_time = skypal.Milliseconds()
            total_time += stop_time - start_time
            i += 1
        endWhile
        result_count = skypal_references.Filter_Potential_Thieves(grid_refs, thieves, "!|").length
        Trace_Test("(grid, [player], '!|')", result_count, trials, total_time)
    endIf
    if true
        i = 0
        trials = 100
        total_time = 0
        while i < trials
            start_time = skypal.Milliseconds()
            skypal_references.Filter_Potential_Thieves(grid_refs, thieves, "!&")
            stop_time = skypal.Milliseconds()
            total_time += stop_time - start_time
            i += 1
        endWhile
        result_count = skypal_references.Filter_Potential_Thieves(grid_refs, thieves, "!&").length
        Trace_Test("(grid, [player], '!&')", result_count, trials, total_time)
    endIf
    if true
        i = 0
        trials = 100
        total_time = 0
        while i < trials
            start_time = skypal.Milliseconds()
            skypal_references.Filter_Potential_Thieves(grid_refs, thieves, "!^")
            stop_time = skypal.Milliseconds()
            total_time += stop_time - start_time
            i += 1
        endWhile
        result_count = skypal_references.Filter_Potential_Thieves(grid_refs, thieves, "!^").length
        Trace_Test("(grid, [player], '!^')", result_count, trials, total_time)
    endIf

    Debug.Trace("")

    Debug.Trace("End: skypal_references.Filter_Potential_Thieves")
    Debug.Trace("")
endFunction

;/function Test_Count_Disabled()
    float start_time
    float stop_time

    Debug.Trace("Begin: skypal_references.Count_Disabled")
    Debug.Trace("")

    ObjectReference[] grid_refs = skypal_references.Grid()
    Debug.Trace("    (grid_ref_count: " + grid_refs.length + ")")
    Debug.Trace("")

    Debug.Trace("    (grid_refs)")
    start_time = skypal.Milliseconds()
    int count = skypal_references.Count_Disabled(grid_refs)
    stop_time = skypal.Milliseconds()
    Debug.Trace("    (count: " + count + ", milliseconds: " + (stop_time - start_time) + ".)")
    Debug.Trace("")

    Debug.Trace("End: skypal_references.Count_Disabled")
    Debug.Trace("")
endFunction

function Test_Count_Enabled()
    float start_time
    float stop_time

    Debug.Trace("Begin: skypal_references.Count_Enabled")
    Debug.Trace("")

    ObjectReference[] grid_refs = skypal_references.Grid()
    Debug.Trace("    (grid_ref_count: " + grid_refs.length + ")")
    Debug.Trace("")

    Debug.Trace("    (grid_refs)")
    start_time = skypal.Milliseconds()
    int count = skypal_references.Count_Enabled(grid_refs)
    stop_time = skypal.Milliseconds()
    Debug.Trace("    (count: " + count + ", milliseconds: " + (stop_time - start_time) + ".)")
    Debug.Trace("")

    Debug.Trace("End: skypal_references.Count_Enabled")
    Debug.Trace("")
endFunction

function Test_Disable()
    float start_time
    float stop_time

    Debug.Trace("Begin: skypal_references.Disable")
    Debug.Trace("")

    ObjectReference[] grid_refs = skypal_references.Grid()
    Debug.Trace("    (grid_ref_count: " + grid_refs.length + ")")
    Debug.Trace("")

    Debug.Trace("    (disabled_count: " + skypal_references.Count_Disabled(grid_refs) + ")")
    Debug.Trace("    (enabled_count: " + skypal_references.Count_Enabled(grid_refs) + ")")
    Debug.Trace("")

    Debug.Trace("    (grid_refs)")
    start_time = skypal.Milliseconds()
    skypal_references.Disable(grid_refs)
    stop_time = skypal.Milliseconds()
    Debug.Trace("    (milliseconds: " + (stop_time - start_time) + ".)")
    Debug.Trace("")

    Debug.Trace("    (disabled_count: " + skypal_references.Count_Disabled(grid_refs) + ")")
    Debug.Trace("    (enabled_count: " + skypal_references.Count_Enabled(grid_refs) + ")")
    Debug.Trace("")

    Debug.Trace("End: skypal_references.Disable")
    Debug.Trace("")
endFunction

function Test_Enable()
    float start_time
    float stop_time

    Debug.Trace("Begin: skypal_references.Enable")
    Debug.Trace("")

    ObjectReference[] grid_refs = skypal_references.Grid()
    Debug.Trace("    (grid_ref_count: " + grid_refs.length + ")")
    Debug.Trace("")

    Debug.Trace("    (disabled_count: " + skypal_references.Count_Disabled(grid_refs) + ")")
    Debug.Trace("    (enabled_count: " + skypal_references.Count_Enabled(grid_refs) + ")")
    Debug.Trace("")

    Debug.Trace("    (grid_refs)")
    start_time = skypal.Milliseconds()
    skypal_references.Enable(grid_refs)
    stop_time = skypal.Milliseconds()
    Debug.Trace("    (milliseconds: " + (stop_time - start_time) + ".)")
    Debug.Trace("")

    Debug.Trace("    (disabled_count: " + skypal_references.Count_Disabled(grid_refs) + ")")
    Debug.Trace("    (enabled_count: " + skypal_references.Count_Enabled(grid_refs) + ")")
    Debug.Trace("")

    Debug.Trace("End: skypal_references.Enable")
    Debug.Trace("")
endFunction

function Test_Filter_Deleted()
    float start_time

    Debug.Trace("Begin: skypal_references.Filter_Deleted")
    Debug.Trace("")

    ObjectReference[] grid_refs = skypal_references.Grid()
    Debug.Trace("    (grid_ref_count: " + grid_refs.length + ")")
    Debug.Trace("")

    Debug.Trace("    (grid_refs, '')")
    start_time = skypal.Milliseconds()
    ObjectReference[] refs_a = skypal_references.Filter_Deleted(grid_refs, "")
    Trace_References(refs_a, skypal.Milliseconds() - start_time, 15)
    Debug.Trace("")

    Debug.Trace("    (grid_refs, '!')")
    start_time = skypal.Milliseconds()
    ObjectReference[] refs_b = skypal_references.Filter_Deleted(grid_refs, "!")
    Trace_References(refs_b, skypal.Milliseconds() - start_time, 15)
    Debug.Trace("")

    Debug.Trace("    (grid_refs, 'blah')")
    start_time = skypal.Milliseconds()
    ObjectReference[] refs_c = skypal_references.Filter_Deleted(grid_refs, "blah")
    Trace_References(refs_c, skypal.Milliseconds() - start_time, 15)
    Debug.Trace("")

    Debug.Trace("End: skypal_references.Filter_Deleted")
    Debug.Trace("")
endFunction

function Test_Filter_Enabled()
    float start_time

    Debug.Trace("Begin: skypal_references.Filter_Enabled")
    Debug.Trace("")

    ObjectReference[] grid_refs = skypal_references.Grid()
    Debug.Trace("    (grid_ref_count: " + grid_refs.length + ")")
    Debug.Trace("")

    Debug.Trace("    (grid_refs, '')")
    start_time = skypal.Milliseconds()
    ObjectReference[] refs_a = skypal_references.Filter_Enabled(grid_refs, "")
    Trace_References(refs_a, skypal.Milliseconds() - start_time, 15)
    Debug.Trace("")

    Debug.Trace("    (grid_refs, '!')")
    start_time = skypal.Milliseconds()
    ObjectReference[] refs_b = skypal_references.Filter_Enabled(grid_refs, "!")
    Trace_References(refs_b, skypal.Milliseconds() - start_time, 15)
    Debug.Trace("")

    Debug.Trace("    (grid_refs, 'blah')")
    start_time = skypal.Milliseconds()
    ObjectReference[] refs_c = skypal_references.Filter_Enabled(grid_refs, "blah")
    Trace_References(refs_c, skypal.Milliseconds() - start_time, 15)
    Debug.Trace("")

    Debug.Trace("End: skypal_references.Filter_Enabled")
    Debug.Trace("")
endFunction

function Test_Sort_Distance()
    float start_time

    Debug.Trace("Begin: skypal_references.Sort_Distance")
    Debug.Trace("")

    ObjectReference[] grid_refs = skypal_references.Grid()

    Debug.Trace("    (grid_refs, 5000.0, none, <)")
    start_time = skypal.Milliseconds()
    ObjectReference[] filtered_refs1 = skypal_references.Filter_Distance(grid_refs, 5000.0, none, "<")
    Trace_References(filtered_refs1, skypal.Milliseconds() - start_time, 15)
    Debug.Trace("")

    Debug.Trace("    (sorted <)")
    start_time = skypal.Milliseconds()
    Trace_References(skypal_references.Sort_Distance(filtered_refs1, none, "<"), skypal.Milliseconds() - start_time, 15)
    Debug.Trace("")

    Debug.Trace("    (sorted >)")
    start_time = skypal.Milliseconds()
    Trace_References(skypal_references.Sort_Distance(filtered_refs1, none, ">"), skypal.Milliseconds() - start_time, 15)
    Debug.Trace("")

    Debug.Trace("    (grid_refs, 5000.0, none, >)")
    start_time = skypal.Milliseconds()
    ObjectReference[] filtered_refs2 = skypal_references.Filter_Distance(grid_refs, 5000.0, none, ">")
    Trace_References(filtered_refs2, skypal.Milliseconds() - start_time, 15)
    Debug.Trace("")

    Debug.Trace("    (sorted <)")
    start_time = skypal.Milliseconds()
    Trace_References(skypal_references.Sort_Distance(filtered_refs2, none, "<"), skypal.Milliseconds() - start_time, 15)
    Debug.Trace("")

    Debug.Trace("    (sorted >)")
    start_time = skypal.Milliseconds()
    Trace_References(skypal_references.Sort_Distance(filtered_refs2, none, ">"), skypal.Milliseconds() - start_time, 15)
    Debug.Trace("")

    Debug.Trace("End: skypal_references.Sort_Distance")
    Debug.Trace("")
endFunction

function Test_Filter_Bases_Form_List()
    Debug.Trace("Begin: Test_Filter_Bases_Form_List")
    Debug.Trace("")

    ObjectReference[] all_refs = skypal_references.All()

    Debug.Trace("    (all_refs, SoulGemsAll, dont_negate)")
    Trace_References(skypal_references.Filter_Bases_Form_List(all_refs, form_list_SoulGemsAll, false), 15)
    Debug.Trace("")
    ;Debug.Trace("    (all_refs, SoulGemsAll, do_negate)")
    ;Trace_References(skypal_references.Filter_Bases_Form_List(all_refs, form_list_SoulGemsAll, true), 15)
    ;Debug.Trace("")

    ObjectReference[] grid_refs = skypal_references.Grid()
    Debug.Trace("    (grid_refs, SoulGemsAll, dont_negate)")
    Trace_References(skypal_references.Filter_Bases_Form_List(grid_refs, form_list_SoulGemsAll, false), 15)
    Debug.Trace("")
    Debug.Trace("    (grid_refs, SoulGemsAll, do_negate)")
    Trace_References(skypal_references.Filter_Bases_Form_List(grid_refs, form_list_SoulGemsAll, true), 15)
    Debug.Trace("")

    Debug.Trace("End: Test_Filter_Bases_Form_List")
    Debug.Trace("")
endFunction

function Test_Filter_Keywords()
    Debug.Trace("Begin: Test_Filter_Keywords")
    Debug.Trace("")

    ObjectReference[] all_refs = skypal_references.All()
    ObjectReference[] grid_refs = skypal_references.Grid()
    Keyword[] keywords = new Keyword[2]

    keywords[0] = keyword_WeapTypeSword
    Debug.Trace("    (all_refs, WeapTypeSword, |)")
    Trace_References(skypal_references.Filter_Keywords(all_refs, keywords, "|"), 15)
    Debug.Trace("")
    Debug.Trace("    (all_refs, WeapTypeSword, !|)")
    Trace_References(skypal_references.Filter_Keywords(all_refs, keywords, "!|"), 15)
    Debug.Trace("")

    keywords[0] = keyword_unique_player
    Debug.Trace("    (grid_refs, keyword_unique_player, |)")
    Trace_References(skypal_references.Filter_Keywords(grid_refs, keywords, "|"), 15)
    Debug.Trace("")
    Debug.Trace("    (grid_refs, keyword_unique_player, !|)")
    Trace_References(skypal_references.Filter_Keywords(grid_refs, keywords, "!|"), 15)
    Debug.Trace("")

    keywords[0] = keyword_unique_player
    keywords[1] = keyword_unique_dragonborn
    Debug.Trace("    (grid_refs, keyword_unique_player + keyword_unique_dragonborn, |)")
    Trace_References(skypal_references.Filter_Keywords(grid_refs, keywords, "|"), 15)
    Debug.Trace("")
    Debug.Trace("    (grid_refs, keyword_unique_player + keyword_unique_dragonborn, !|)")
    Trace_References(skypal_references.Filter_Keywords(grid_refs, keywords, "!|"), 15)
    Debug.Trace("")

    keywords[0] = keyword_JobMerchant
    Debug.Trace("    (all_refs, JobMerchant, |)")
    Trace_References(skypal_references.Filter_Keywords(all_refs, keywords, "|"), 15)
    Debug.Trace("")
    Debug.Trace("    (all_refs, JobMerchant, !|)")
    Trace_References(skypal_references.Filter_Keywords(all_refs, keywords, "!|"), 15)
    Debug.Trace("")

    keywords[0] = keyword_WeapTypeSword
    keywords[1] = keyword_JobMerchant
    Debug.Trace("    (all_refs, WeapTypeSword + JobMerchant, |)")
    Trace_References(skypal_references.Filter_Keywords(all_refs, keywords, "|"), 15)
    Debug.Trace("")
    Debug.Trace("    (all_refs, WeapTypeSword + JobMerchant, &)")
    Trace_References(skypal_references.Filter_Keywords(all_refs, keywords, "&"), 15)
    Debug.Trace("")
    Debug.Trace("    (all_refs, WeapTypeSword + JobMerchant, !&)")
    Trace_References(skypal_references.Filter_Keywords(all_refs, keywords, "!&"), 15)
    Debug.Trace("")
    
    Debug.Trace("End: Test_Filter_Keywords")
    Debug.Trace("")
endFunction

function Test_Filter_Distance()
    Debug.Trace("Begin: Test_Filter_Distance")
    Debug.Trace("")

    ObjectReference[] grid_refs = skypal_references.Grid()

    Debug.Trace("    (grid_refs, 500.0, none, <)")
    Trace_References(skypal_references.Filter_Distance(grid_refs, 500.0, none, "<"), 15)
    Debug.Trace("")
    Debug.Trace("    (grid_refs, 500.0, none, >)")
    Trace_References(skypal_references.Filter_Distance(grid_refs, 500.0, none, ">"), 15)
    Debug.Trace("")
    Debug.Trace("    (grid_refs, 5000.0, none, <)")
    Trace_References(skypal_references.Filter_Distance(grid_refs, 5000.0, none, "<"), 15)
    Debug.Trace("")
    Debug.Trace("    (grid_refs, 5000.0, none, >)")
    Trace_References(skypal_references.Filter_Distance(grid_refs, 5000.0, none, ">"), 15)
    Debug.Trace("")

    Debug.Trace("End: Test_Filter_Distance")
    Debug.Trace("")
endFunction

function Test_Filter_Grid_Actor() global
    Debug.Trace("Begin: Test_Filter_Grid_Actor")

    int[] form_types = new int[1]
    form_types[0] = 62; FormType.kCharacter (this is a reference form_type)

    ObjectReference[] references = skypal_references.Filter_Grid(form_types)
    Trace_References(references)

    Debug.Trace("End: Test_Filter_Grid_Actor")
endFunction

function Test_Filter_Grid_Flora() global
    Debug.Trace("Begin: Test_Filter_Grid_Flora")

    int[] form_types = new int[1]
    form_types[0] = 39; FormType.kFlora (this is a base form_type)

    ObjectReference[] references = skypal_references.Filter_Grid(form_types)
    Trace_References(references)

    Debug.Trace("End: Test_Filter_Grid_Flora")
endFunction

function Test_Filter_Grid_Actor_Flora() global
    Debug.Trace("Begin: Test_Filter_Grid_Actor_Flora")

    int[] form_types = new int[2]
    form_types[0] = 62; FormType.kCharacter (this is a reference form_type)
    form_types[1] = 39; FormType.kFlora (this is a base form_type)

    ObjectReference[] references = skypal_references.Filter_Grid(form_types)
    Trace_References(references)

    Debug.Trace("End: Test_Filter_Grid_Actor_Flora")
endFunction/;

; helpers
float function Average_Milliseconds_Time(int trials)
    float total_time = 0.0
    float start_time
    float stop_time
    int i = 0
    while i < trials
        start_time = skypal.Milliseconds()
        skypal.Milliseconds()
        stop_time = skypal.Milliseconds()
        total_time += stop_time - start_time
        i += 1
    endWhile
    return total_time / trials
endFunction

function Trace_Test(string test_name, int result_count, int trials, float total_time)
    Debug.Trace("    " + test_name + " { " + \
                "result_count: " + result_count + ", " + \
                "trials: " + trials + ", " + \
                "average milliseconds: " + (total_time / trials - Average_Milliseconds_Time(trials)) + \
                " }")
endFunction

function Trace_References(ObjectReference[] references, float milliseconds, int MAX_TO_DISPLAY = 50)
    Debug.Trace("    total: " + references.length + ", milliseconds: " + milliseconds + ". (Showing up to " + MAX_TO_DISPLAY + ".)")

    int end = 0
    if (references.length > MAX_TO_DISPLAY)
        end = MAX_TO_DISPLAY
    else
        end = references.length
    endIf

    int idx = 0
    while (idx < end)
        Debug.Trace("    idx:" + idx + ", form_id: " + references[idx].GetFormID() + ", name: " + references[idx].GetName())
        idx += 1
    endWhile
endFunction

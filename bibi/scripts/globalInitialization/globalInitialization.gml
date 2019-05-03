gml_pragma("global", "globalInitialization();");

enum StateStep
{
    Setup,
    Update,
    Teardown
};

show_debug_message("=====================");
show_debug_message("Global Initialization");
show_debug_message("=====================");

// pixels by squared seconds
#macro mecGravity 587


gml_pragma("global", "globalInitialization();");

enum LogLevel
{
    Critical,
    Error,
    Warning,
    Message
};

#macro ENABLE_ASSERT true

#macro LOG_LEVEL LogLevel.Message
//#macro LOG_LEVEL LogLevel.Warning
//#macro LOG_LEVEL LogLevel.Error

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

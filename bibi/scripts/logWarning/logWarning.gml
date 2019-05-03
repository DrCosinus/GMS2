///@description log 
///@param message

gml_pragma("forceinline");

if (LogLevel.Warning <= LOG_LEVEL)
{
    show_debug_message("[WARNING]: " + string(argument0));
}
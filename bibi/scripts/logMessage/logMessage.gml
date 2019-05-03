///@description log 
///@param message

gml_pragma("forceinline");

if (LogLevel.Message <= LOG_LEVEL)
{
    show_debug_message("[MESSAGE]: " + string(argument0));
}
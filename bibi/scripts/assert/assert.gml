///@description check 
///@param condition
///@param message

gml_pragma("forceinline");

if (ENABLE_ASSERT)
{
    if (!argument0)
    {
        show_error(argument1, true);
    }
}
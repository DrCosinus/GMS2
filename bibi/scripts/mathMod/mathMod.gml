///@description real modulo
///@param {real} number
///@param {real} base
gml_pragma("forceinline");

return argument0 - floor(argument0/argument1) * argument1;

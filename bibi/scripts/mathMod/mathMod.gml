///@description real modulo
///@param {real} number
///@param {real} base
gml_pragma("forceinline");

var number = argument0;
var base = argument1;
var q = floor(number/base);
return number - q * base;

function [output_list] = tnb_power_split(power)
%TNB_POWER_SPLIT: takes in total consumed power, returns split up list of power
output_list = [];
if power <= 200
    output_list = [output_list, power]
elseif power >= 201 && power <= 300
    output_list = [output_list, 200, power - 200]
elseif power >= 301 && power <= 600
    output_list = [output_list, 200, 100, power - 300]
elseif power >= 601 && power <= 900
    output_list = [output_list, 200, 100, 300, power - 600]
else
    output_list = [output_list, 200, 100, 300, 300, power - 900]
end
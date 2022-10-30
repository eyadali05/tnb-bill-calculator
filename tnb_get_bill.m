function [bill] = tnb_get_bill(broken_power)
%TNB_GET_BILL:calculates estimated bill (with ICPT and ST) given power list
broken_power_len = length(broken_power);
disp(broken_power)
current_rates = [0.2180, 0.3340, 0.5160, 0.5460, 0.5710]
consumed_power = sum(broken_power)
icpt = consumed_power * -0.02

if consumed_power > 600
    money_tax = 0.526 * (consumed_power - 600);
    st = 0.06 * money_tax
else
    st = 0
end

if broken_power_len == 0
    final_bill = 3
else
    estimated_bill_list = [];
    for p=1:broken_power_len
        estimated_bill_list = [estimated_bill_list, broken_power(p) * current_rates(p)];
    end
    final_bill = sum(estimated_bill_list) + icpt + st
end

end

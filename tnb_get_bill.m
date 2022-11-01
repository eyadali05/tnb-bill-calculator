function [total_consumption_money, icpt, st, final_bill] = tnb_get_bill(broken_power)
%TNB_GET_BILL:calculates estimated bill (with ICPT and ST) given power list
broken_power_len = length(broken_power);
disp(broken_power)
current_rates = [0.2180, 0.3340, 0.5160, 0.5460, 0.5710]
consumed_power = sum(broken_power)
icpt = consumed_power * -0.02

if broken_power_len == 0
    final_bill = 3
else
    estimated_bill_list = [];
    for p=1:broken_power_len
        estimated_bill_list = [estimated_bill_list, broken_power(p) * current_rates(p)];
    end
    total_consumption_money = sum(estimated_bill_list);
    if consumed_power > 600
        st_applicable_list = [];
        for e=4:broken_power_len
            st_applicable_list = [st_applicable_list, estimated_bill_list(e)]
        end
        st_applicable_consumption = sum(st_applicable_list)
        st_applicable_consumption_post_icpt = st_applicable_consumption + (icpt + 12)
        st = 0.06 * st_applicable_consumption_post_icpt
        st_not_applicable_post_icpt = sum(estimated_bill_list(1:3)) - 12
        final_bill = st_not_applicable_post_icpt + st_applicable_consumption_post_icpt + st
    else
        st = 0
        final_bill= total_consumption_money + icpt + st
    end
       
end

end
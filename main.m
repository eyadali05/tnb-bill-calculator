consumed_power = input("Please Enter Your Consumed Power (KwH): ");

while consumed_power < 0
    disp("Invalid value for Consumed Power, Please try again.");
    consumed_power = input("Please Enter Your Consumed Power (KwH): ");
end

power_broken = tnb_power_split(consumed_power);

tnb_get_bill(power_broken)
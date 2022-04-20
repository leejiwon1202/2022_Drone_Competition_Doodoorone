kor = input("원화 단위의 돈을 입력하세요 : ");


dol_arr = [1 2 5 10 20 50 100];
dol_rate = 1234.13;

eur_arr = [5 10 20 50 100 200 500];
eur_rate = 1333.14;

yen_arr = [1000 2000 5000 10000];
yen_rate = 9.75;

yuan_arr = [1 5 10 20 50 100];
yuan_rate = 193.89;


dol = calcBill(kor, dol_arr, dol_rate)
eur = calcBill(kor, eur_arr, eur_rate)
yen = calcBill(kor, yen_arr, yen_rate)
yuan = calcBill(kor, yuan_arr, yuan_rate)


function c = calcBill(kor, bill_arr, ex_rate)
    money = fix(kor / ex_rate);
    dp = zeros(1,money);
    for i = 2:money
        dp(i) = 99999;
    end
    if bill_arr(1) ~= 1
        for z = 1:bill_arr(1)
            dp(z) = 0;
        end
    end

    for i = 1:length(bill_arr)
        for j = bill_arr(i):money
            dp(j) = min(dp(j), dp(j - bill_arr(i)+1) + 1);
        end
    end

    c = dp(money);
end
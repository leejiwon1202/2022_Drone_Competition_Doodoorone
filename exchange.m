kor = input("원화 단위의 돈을 입력하세요 : ");


dol_arr = [1 2 5 10 20 50 100];
dol_rate = 1234.13;

eur_arr = [5 10 20 50 100 200 500];
eur_rate = 1333.14;

yen_arr = [1000 2000 5000 10000];
yen_rate = 9.75;

yuan_arr = [1 5 10 20 50 100];
yuan_rate = 193.89;


dol = calcBill(kor, dol_arr, dol_rate);
eur = calcBill(kor, eur_arr, eur_rate);
yen = calcBill(kor, yen_arr, yen_rate);
yuan = calcBill(kor, yuan_arr, yuan_rate);


sprintf("한국 돈 %d원 환전 결과", kor)
sprintf("%d달러 / %d유로 / %d엔 / %d위안", dol, eur, yen, yuan)


function cnt = calcBill(kor, bill_arr, ex_rate)
    bill_arr = sort(bill_arr, 'desc');
    remain = fix(kor/ex_rate);
    cnt = 0;

    for bill = bill_arr 
        if remain >= bill
            num = fix(remain/bill);
            cnt = cnt + num;
            remain = remain - num * bill;
        end
    end
end
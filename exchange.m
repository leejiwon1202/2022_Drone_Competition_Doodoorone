% 1단계: 사용자 입력 (단위: 한국 원화)
kor = input("원화 단위의 돈을 입력하세요 : ");


% 2단계: 각 국가의 화폐별 지폐 단위와 환율값
dol_arr = [1 2 5 10 20 50 100];
dol_rate = 1234.13;

eur_arr = [5 10 20 50 100 200 500];
eur_rate = 1333.14;

yen_arr = [1000 2000 5000 10000];
yen_rate = 9.75;

yuan_arr = [1 5 10 20 50 100];
yuan_rate = 193.89;


% 3단계: 함수를 활용해 환전된 값을 변수에 저장
dol = calcBill(kor, dol_arr, dol_rate);
eur = calcBill(kor, eur_arr, eur_rate);
yen = calcBill(kor, yen_arr, yen_rate);
yuan = calcBill(kor, yuan_arr, yuan_rate);


% 4단계: 결과 출력
sprintf("한국 돈 %d원 환전 결과", kor)
sprintf("%d달러 / %d유로 / %d엔 / %d위안", dol, eur, yen, yuan)


% 원화를 최소한의 화폐로 환전했을 때의 화폐 장수를 반환하는 함수
function c = calcBill(kor, bill_arr, ex_rate)
    money = fix(kor / ex_rate);
    
    % 기존 코드에서 배열 인덱싱 방법을 사용하여 dp를 초기화 하도록 수정
    dp = zeros(1,money+2);
    dp(bill_arr(1)+2:end) = 99999;
    
    % 결과가 올바르게 나오지 않는 오류 수정 (인덱싱 범위 문제)
    for i=1:length(bill_arr)
        for j=bill_arr(i)+2:money+2
            dp(j) = min(dp(j), dp(j-bill_arr(i)) + 1);
        end
    end
    
    % 마지막 배열에 저장되어 있는 값 즉, 지폐 최소 장수 반환
    c = dp(money+2);
end
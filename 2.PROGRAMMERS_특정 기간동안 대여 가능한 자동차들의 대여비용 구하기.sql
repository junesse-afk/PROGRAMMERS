-- CAR_RENTAL_COMPANY_CAR 테이블과 CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블과 CAR_RENTAL_COMPANY_DISCOUNT_PLAN 테이블에서
-- 자동차 종류가 '세단' 또는 'SUV' 인 자동차 중 2022년 11월 1일부터 2022년 11월 30일까지 대여 가능하고
-- 30일간의 대여 금액이 50만원 이상 200만원 미만인 자동차에 대해서 자동차 ID, 자동차 종류, 대여 금액(컬럼명: FEE) 리스트를 출력하는 SQL문을 작성해주세요.
-- 결과는 대여 금액을 기준으로 내림차순 정렬하고, 대여 금액이 같은 경우 자동차 종류를 기준으로 오름차순 정렬, 자동차 종류까지 같은 경우 자동차 ID를 기준으로 내림차순 정렬해주세요.

-- 첫 문제 풀이
SELECT cc.CAR_ID, cc.CAR_TYPE, cc.DAILY_FEE * 30 AS FEE
FROM CAR_RENTAL_COMPANY_CAR cc
WHERE cc.CAR_TYPE IN ('세단', 'SUV')
AND cc.CAR_ID NOT IN (SELECT CAR_ID
						FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
						WHERE START_DATE <= '2022-11-30'
						AND END_DATE >= '2022-11-01'
						)
  AND (cc.DAILY_FEE * 30) >= 500000
  AND (cc.DAILY_FEE * 30) < 2000000
ORDER BY FEE DESC, cc.CAR_TYPE ASC, cc.CAR_ID DESC;

-- 오답 체크
-- 할인 금액이 빠져 있는걸 확인하지 못하고 단순히 30일로만 계산
-- START_DATE와 END_DATE 기간이 겹치는 공식
-- 11-01 / 11-30을 하면 기간이 정확히 이 안에 있는 경우만 체크 -> 일부 대여차량 누락 11-30 / 11-01을 하면 기간이 겹치기만 하면 대여중으로 간주
-- 서브 쿼리 공부 좀더 해야할듯


SELECT cc.CAR_ID, cc.CAR_TYPE, ROUND(cc.DAILY_FEE * 30 *(100 - cp.DISCOUNT_RATE) / 100, 0) AS FEE
FROM CAR_RENTAL_COMPANY_CAR cc
JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN cp ON cc.CAR_TYPE = cp.CAR_TYPE
WHERE cc.CAR_TYPE IN ('세단', 'SUV')
AND cp.DURATION_TYPE = '30일 이상'
AND cc.CAR_ID NOT IN (SELECT CAR_ID
						FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                        WHERE START_DATE <= '2022-11-30'
                        AND END_DATE >= '2022-11-01')
AND (cc.DAILY_FEE * 30 * (100 - cp.DISCOUNT_RATE) / 100) >= 500000
AND (cc.DAILY_FEE * 30 * (100 - cp.DISCOUNT_RATE) / 100) < 2000000
ORDER BY FEE DESC, cc.CAR_TYPE ASC, cc.CAR_ID DESC;

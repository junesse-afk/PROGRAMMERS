-- FIRST_HALF
-- SHIPMENT_ID INT 아이스크림 공장에서 아이스크림 가게까지의 출하번호
-- FLAVOR VARCHAR 아이스크림 맛 PK
-- TOTAL_ORDER 상반기 아이스크림 총주문량

-- ICECREAM_INFO
-- FLAVOR 아이스크림 맛 FK
-- INGREDIENT_TYPE 아이스크림 성분
-- 주성분이 설탕이면 sugar_based, 주 성분이 과일이면 fruit_based

-- 상반기 아이스크림 총주문량이 3,000보다 높으면서 아이스크림의 주 성분이 과일인 아이스크림의 맛을 총주문량이 큰 순서대로 조회하는 SQL 문을 작성해주세요.

SELECT fh.FLAVOR
FROM FIRST_HALF fh
JOIN ICECREAM_INFO ii ON fh.FLAVOR = ii.FLAVOR
WHERE fh.TOTAL_ORDER > 3000
AND ii.INGREDIENT_TYPE = 'fruit_based'
ORDER BY fh.TOTAL_ORDER DESC;
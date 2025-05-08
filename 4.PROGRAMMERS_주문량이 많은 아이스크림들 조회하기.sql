-- FRIST_HALF 아이스크림 가게의 상반기 주문을 담은 테이블
-- SHIPMENT_ID FK
-- FLAVOR PK
-- TOTAL_ORDER

-- JULY 7월 아이스크림 주문 정보를 담은 테이블
-- SHIPMENT_ID PK
-- FLAVOR FK
-- TOTAL_ORDER

-- 7월 아이스크림 총 주문량과 상반기의 아이스크림 총 주문량을 더한 값이 큰 순서대로 상위 3개의 맛을 조회하는 SQL문을 작성해주세요.

-- 첫 문제풀이
SELECT fh.FLAVOR
FROM FIRST_HALF fh
JOIN JULY ju ON fh.SHIPMENT_ID = ju.SHIPMENT_ID
ORDER BY (fh.TOTAL_ORDER + ju.TOTAL_ORDER) DESC
LIMIT 3;

-- JULY 테이블에 동일한 FLAVOR가 여러 SHIPMENT_ID로 중복되어 존재할 수 있음
-- 따라서 단순히 JOIN을 하는 것이 아닌 서브쿼리를 이용하여 중복을 제거해야함

SELECT fh.FLAVOR
FROM FIRST_HALF fh
JOIN (SELECT FLAVOR, SUM(TOTAL_ORDER) as TOTAL_ORDER
		FROM JULY
        GROUP BY FLAVOR
	 ) ju ON fh.FLAVOR = ju.FLAVOR
ORDER BY (fh.TOTAL_ORDER + ju.TOTAL_ORDER) DESC
LIMIT 3;

-- UNION (세로 방향으로 데이터를 합침) UNION ALL은 중복포함 UNION은 중복제거 vs JOIN(가로 방향으로 데이터를 합침)
-- JOIN이 아니므로 두 테이블에 공통되는 FLAVOR(예를들어 JULY 테이블에만 있는 데이터도 포함시킴)가 없어도 합산 가능
-- UNION은 두 테이블이 동일한 구조를 가지고 있고 단순히 합친 뒤 집계만 하는 경우 UNION ALL + GROUP BY 방식이 더 좋음

SELECT FLAVOR
FROM (SELECT FLAVOR, SUM(TOTAL_ORDER) as total
		FROM (SELECT FLAVOR, TOTAL_ORDER FROM FIRST_HALF
			  UNION ALL
			  SELECT FLAVOR, TOTAL_ORDER FROM JULY
		) as total_order
        GROUP BY FLAVOR
) as FLAVOR_TOTAL
ORDER BY total desc
LIMIT 3;
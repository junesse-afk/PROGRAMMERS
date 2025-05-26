-- DOCTOR 테이블에서 진료과가 흉부외과(CS)이거나 일반외과(GS)인 의사의 이름, 의사ID, 진료과, 고용일자를 조회하는 SQL문을 작성해주세요.
-- 이때 결과는 고용일자를 기준으로 내림차순 정렬하고, 고용일자가 같다면 이름을 기준으로 오름차순 정렬해주세요.

-- 문제 풀이
-- CS, GS 조건 걸때, CS 또는 GS를 걸어야하는데
-- MCDP_CD = 'CS' or 'GS'은 SQL에서 (MCDP_CD = 'CS') OR ('GS') = (MCDP_CD = 'CS') OR TURE 
-- 왼쪽부터 평가하게 되며, GS은 NULL도 아니고, 빈 문자열도 아니기 때문에 TRUE 판단함
-- 즉 모든 행이 조건을 만족해서 출력됨
-- 날짜형식 변경 ORACLE : TO_CHAR(HIRE_YMD, 'YYYY-MM-DD') 데이터형식을 문자열로 변경해서 'YYYY-MM-DD'까지만 짤라서 출력

--                              TO_CHAR(HIRE_YMD, 'YYYY-MM-DD')
SELECT DR_NAME, DR_ID, MCDP_CD, DATE_FORMAT(HIRE_YMD, '%Y-%m-%d') as HIRE_YMD
FROM DOCTOR
--    MCDP_CD = 'CS' or MCDP_CD = 'GS'
WHERE MCDP_CD IN ('CS', 'GS')
ORDER BY HIRE_YMD desc, DR_NAME;

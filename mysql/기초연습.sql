SELECT count(*) FROM world.city;
--필드명과 속성 확인
desc world.city;

--특정 범위만 출력 
SELECT count(*) FROM world.city limit 2;
--특정 범위만 출력 리미트는 인덱스를 기준으로 함
SELECT count(*) FROM world.city limit 10,10;


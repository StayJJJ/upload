select * from users;
select * from guesthouse;
select * from room;

SET FOREIGN_KEY_CHECKS = 0;

-- ========== USERS (HOST 4 + GUEST 19) ==========
INSERT INTO users (id, login_id, username, password, role, phone_number) VALUES
-- HOSTS
(1, 'host1', '제주호스트', '1234', 'HOST', '010-1111-1111'),
(2, 'host2', '애월호스트', '1234', 'HOST', '010-2222-2222'),
(3, 'host3', '성산호스트', '1234', 'HOST', '010-3333-3333'),
(4, 'host4', '협재호스트', '1234', 'HOST', '010-4444-4444'),
-- GUESTS
(5,  'guest1',  '안나',   '1234', 'GUEST', '010-5000-0001'),
(6,  'guest2',  '밥',     '1234', 'GUEST', '010-5000-0002'),
(7,  'guest3',  '카라',   '1234', 'GUEST', '010-5000-0003'),
(8,  'guest4',  '댄',     '1234', 'GUEST', '010-5000-0004'),
(9,  'guest5',  '은',     '1234', 'GUEST', '010-5000-0005'),
(10, 'guest6',  '폭스',   '1234', 'GUEST', '010-5000-0006'),
(11, 'guest7',  '길',     '1234', 'GUEST', '010-5000-0007'),
(12, 'guest8',  '한',     '1234', 'GUEST', '010-5000-0008'),
(13, 'guest9',  '아이비', '1234', 'GUEST', '010-5000-0009'),
(14, 'guest10', '진',     '1234', 'GUEST', '010-5000-0010'),
(15, 'guest11', '카이',   '1234', 'GUEST', '010-5000-0011'),
(16, 'guest12', '레오',   '1234', 'GUEST', '010-5000-0012'),
(17, 'guest13', '미아',   '1234', 'GUEST', '010-5000-0013'),
(18, 'guest14', '노아',   '1234', 'GUEST', '010-5000-0014'),
(19, 'guest15', '오라',   '1234', 'GUEST', '010-5000-0015'),
(20, 'guest16', '피아',   '1234', 'GUEST', '010-5000-0016'),
(21, 'guest17', '레이',   '1234', 'GUEST', '010-5000-0017'),
(22, 'guest18', '수',     '1234', 'GUEST', '010-5000-0018'),
(23, 'guest19', '톰',     '1234', 'GUEST', '010-5000-0019');

-- ========== GUESTHOUSE (40개, 모두 다른 이름 / rating 0.0) ==========
-- host_id 1~4 라운드로빈, room_count: 1/2/3/4 반복 → 총 100개 방
-- rating은 NOT NULL 제약 → 초기 0.0, 이후 리뷰 평균으로 UPDATE
-- photo_id는 1..100 범위 내에서 id 사용(1..40)
INSERT INTO guesthouse (id, host_id, name, description, address, rating, room_count, photo_id, phone_number) VALUES
-- room_count = 1 (10개)
(1,  1, '제주 바다안개 하우스',   '바다 전망, 조용한 숙소',           '제주시 애월읍 1-1',    0.0, 1, 1,  '064-700-0001'),
(2,  2, '애월 파도소리 스테이',   '서핑 포인트 접근 용이',           '제주시 애월읍 2-2',    0.0, 1, 2,  '064-700-0002'),
(3,  3, '성산 일출정원',         '일출 명소 근처 정원 숙소',         '서귀포시 성산읍 3-3',  0.0, 1, 3,  '064-700-0003'),
(4,  4, '한림 돌담노을',         '노을이 아름다운 돌담 하우스',      '제주시 한림읍 4-4',    0.0, 1, 4,  '064-700-0004'),
(5,  1, '구좌 바람모래',         '모래사장과 바람길 가까움',         '제주시 구좌읍 5-5',    0.0, 1, 5,  '064-700-0005'),
(6,  2, '월정 푸른파도',         '카페거리 도보 5분',               '제주시 구좌읍 6-6',    0.0, 1, 6,  '064-700-0006'),
(7,  3, '협재 은모래집',         '협재해변 은모래 근처',             '제주시 한림읍 7-7',    0.0, 1, 7,  '064-700-0007'),
(8,  4, '한경 수월봉라운지',     '수월봉 산책로 인접',               '제주시 한경면 8-8',    0.0, 1, 8,  '064-700-0008'),
(9,  1, '조천 소나무길',         '소나무숲 산책로 옆',               '제주시 조천읍 9-9',    0.0, 1, 9,  '064-700-0009'),
(10, 2, '김녕 코발트베이',       '청명한 코발트 바다 전망',          '제주시 구좌읍 10-10',  0.0, 1, 10, '064-700-0010'),
-- room_count = 2 (10개)
(11, 3, '표선 하얀모래',         '표선 백사장 인근',                 '서귀포시 표선면 11-11',0.0, 2, 11, '064-700-0011'),
(12, 4, '남원 해안산책',         '해안 산책로 접근성 우수',           '서귀포시 남원읍 12-12',0.0, 2, 12, '064-700-0012'),
(13, 1, '애월 별빛태비',         '밤하늘 별 헤는 감성',              '제주시 애월읍 13-13',  0.0, 2, 13, '064-700-0013'),
(14, 2, '제주시 노을마루',       '노을 뷰 테라스',                    '제주시 연동 14-14',    0.0, 2, 14, '064-700-0014'),
(15, 3, '성산 구름다락',         '구름 아래 다락방 감성',             '서귀포시 성산읍 15-15',0.0, 2, 15, '064-700-0015'),
(16, 4, '표선 바다서재',         '책과 바다, 조용한 휴식',            '서귀포시 표선면 16-16',0.0, 2, 16, '064-700-0016'),
(17, 1, '구좌 초록창',           '초록 풍경 통창',                    '제주시 구좌읍 17-17',  0.0, 2, 17, '064-700-0017'),
(18, 2, '월정 파라솔',           '파라솔 테라스, 브런치',             '제주시 구좌읍 18-18',  0.0, 2, 18, '064-700-0018'),
(19, 3, '한림 조약돌스테이',     '조약돌 정원',                        '제주시 한림읍 19-19',  0.0, 2, 19, '064-700-0019'),
(20, 4, '함덕 에머랄드뷰',       '에머랄드빛 바다 조망',               '제주시 조천읍 20-20',  0.0, 2, 20, '064-700-0020'),
-- room_count = 3 (10개)
(21, 1, '한경 바람등대',         '바람 많은 등대길',                   '제주시 한경면 21-21',  0.0, 3, 21, '064-700-0021'),
(22, 2, '애월 물빛정원',         '물빛 정원과 파티오',                 '제주시 애월읍 22-22',  0.0, 3, 22, '064-700-0022'),
(23, 3, '구좌 살랑살랑',         '바람이 살랑이는 공간',               '제주시 구좌읍 23-23',  0.0, 3, 23, '064-700-0023'),
(24, 4, '성산 산호길',           '산호빛 바다 산책',                   '서귀포시 성산읍 24-24',0.0, 3, 24, '064-700-0024'),
(25, 1, '표선 따뜻한바람',       '따뜻한 바람이 머무는',               '서귀포시 표선면 25-25',0.0, 3, 25, '064-700-0025'),
(26, 2, '남원 파도길',           '파도 소리 들리는 길',                 '서귀포시 남원읍 26-26',0.0, 3, 26, '064-700-0026'),
(27, 3, '제주시 솔바람채',       '솔바람 스며드는 집',                 '제주시 이도 27-27',    0.0, 3, 27, '064-700-0027'),
(28, 4, '한림 별헤는밤',         '별 보기 좋은 마당',                   '제주시 한림읍 28-28',  0.0, 3, 28, '064-700-0028'),
(29, 1, '구좌 은은스테이',       '은은한 향기의 숙소',                  '제주시 구좌읍 29-29',  0.0, 3, 29, '064-700-0029'),
(30, 2, '함덕 바닷내음',         '바닷내음 가득',                        '제주시 조천읍 30-30',  0.0, 3, 30, '064-700-0030'),
-- room_count = 4 (10개)
(31, 3, '애월 달빛언덕',         '달빛 내리는 언덕집',                  '제주시 애월읍 31-31',  0.0, 4, 31, '064-700-0031'),
(32, 4, '성산 노을언덕',         '노을빛 언덕과 테라스',                '서귀포시 성산읍 32-32',0.0, 4, 32, '064-700-0032'),
(33, 1, '김녕 드리프트우드',     '유목 나무 인테리어',                  '제주시 구좌읍 33-33',  0.0, 4, 33, '064-700-0033'),
(34, 2, '조천 바다숲길',         '숲과 바다가 만나는 길',                '제주시 조천읍 34-34',  0.0, 4, 34, '064-700-0034'),
(35, 3, '월정 해녀의집',         '해녀 문화 체험 감성',                  '제주시 구좌읍 35-35',  0.0, 4, 35, '064-700-0035'),
(36, 4, '세화 파도아치',         '파도의 아치형 뷰',                     '제주시 구좌읍 36-36',  0.0, 4, 36, '064-700-0036'),
(37, 1, '협재 라이트코브',       '빛이 드는 작은 코브',                  '제주시 한림읍 37-37',  0.0, 4, 37, '064-700-0037'),
(38, 2, '한경 수평선라운지',     '수평선이 보이는 라운지',               '제주시 한경면 38-38',  0.0, 4, 38, '064-700-0038'),
(39, 3, '구좌 썬셋테라스',       '노을 테라스 감성',                     '제주시 구좌읍 39-39',  0.0, 4, 39, '064-700-0039'),
(40, 4, '제주시 아침파도',       '아침 파도 소리 나는 집',               '제주시 노형동 40-40',  0.0, 4, 40, '064-700-0040');

-- ========== ROOMS (총 100개) ==========
-- 윈도우/재귀 없이 세션 변수로 일련번호 생성
SET @rn := 0;

INSERT INTO room (id, name, guesthouse_id, capacity, price, photo_id)
SELECT
  (@rn := @rn + 1) AS id,
  CONCAT(
    CASE n.k
      WHEN 1 THEN '스탠다드'
      WHEN 2 THEN '라지 트윈'
      WHEN 3 THEN '패밀리'
      ELSE '테라스 더블'
    END
  ) AS name,
  g.id AS guesthouse_id,
  CASE n.k WHEN 1 THEN 2 WHEN 2 THEN 3 WHEN 3 THEN 4 ELSE 2 END AS capacity,
  CASE n.k
    WHEN 1 THEN 50000 + (g.id % 10) * 2000       -- 52k~68k
    WHEN 2 THEN 80000 + (g.id % 10) * 2000       -- 82k~98k
    WHEN 3 THEN 105000 + (g.id % 10) * 3000      -- 108k~132k
    ELSE 65000 + (g.id % 10) * 1500              -- 66500~78500
  END AS price,
  (@rn) AS photo_id                          -- 1..100
FROM guesthouse g
JOIN (
  SELECT 1 AS k UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
) AS n ON n.k <= g.room_count
ORDER BY g.id, n.k;

select * from room;

-- ========== RESERVATIONS (160건, 재귀/윈도우 없이) ==========
-- 같은 방의 2번째 예약은 최소 21일 간격 → 겹침 방지
SET @base_date := DATE('2025-08-01');

INSERT INTO reservation (id, room_id, guest_id, check_in_date, check_out_date, people_count)
SELECT
  n + 1 AS id,                                        -- 1..160
  ((n % 100) + 1) AS room_id,                         -- 방 1..100 순환
  (5 + (n % 19)) AS guest_id,                         -- 게스트 5..23 순환(19명)
  DATE_ADD(@base_date,
           INTERVAL (
             FLOOR(n / 100) * 21                      -- 같은 방의 2번째 예약 간격(21일)
             + (((n % 100) + 1) % 10) * 2             -- room_id에 따른 분산
             + (n % 7)                                -- 요일 분산
           ) DAY) AS check_in_date,
  DATE_ADD(
    DATE_ADD(@base_date,
             INTERVAL (
               FLOOR(n / 100) * 21
               + (((n % 100) + 1) % 10) * 2
               + (n % 7)
             ) DAY),
    INTERVAL ((n % 3) + 2) DAY                         -- 2~4박
  ) AS check_out_date,
  LEAST(r.capacity, 1 + ((n + 1) % r.capacity)) AS people_count
FROM (
  -- 0..159 시퀀스 (10 x 16 = 160)
  SELECT u.n + t.n * 10 AS n
  FROM (
    SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
    UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9
  ) AS u
  CROSS JOIN (
    SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3
    UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7
    UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11
    UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15
  ) AS t
) seq
JOIN room r ON r.id = ((n % 100) + 1)
ORDER BY id;

select * from reservation;

-- ========== REVIEWS (과거/오늘 종료 예약의 일부) ==========
-- check_out_date <= 2025-08-27 AND (id % 3 <> 0) → 약 2/3만 리뷰 생성
INSERT INTO review (reservation_id, rating, comment, created_at)
SELECT
  rs.id AS reservation_id,
  3 + (rs.id % 3) AS rating,  -- 3,4,5 순환
  CONCAT('자동 생성 리뷰 - 예약 #', rs.id) AS comment,
  TIMESTAMP(DATE_ADD(rs.check_out_date, INTERVAL 12 HOUR))
FROM reservation rs
WHERE rs.check_out_date <= DATE('2025-08-27')
  AND (rs.id % 3) <> 0;
  
select * from review;

-- ========== GUESTHOUSE.rating = 리뷰 평균으로 갱신 ==========
-- 리뷰 없는 숙소는 0.0 유지, 있는 숙소는 소수 1자리 반올림
UPDATE guesthouse g
LEFT JOIN (
  SELECT r.guesthouse_id, AVG(rv.rating) AS avg_rating
  FROM review rv
  JOIN reservation rs ON rs.id = rv.reservation_id
  JOIN room r ON r.id = rs.room_id
  GROUP BY r.guesthouse_id
) a ON a.guesthouse_id = g.id
SET g.rating = COALESCE(ROUND(a.avg_rating, 1), 0.0);

SET FOREIGN_KEY_CHECKS = 1;

-- ========== 검증 SELECT ==========
-- 1) rating이 리뷰 평균(소수 1자리)과 불일치하는 숙소 (정상이라면 0행)
SELECT g.id, g.name, g.rating AS stored_rating, ROUND(a.avg_rating, 1) AS calc_rating
FROM guesthouse g
LEFT JOIN (
  SELECT r.guesthouse_id, AVG(rv.rating) AS avg_rating
  FROM review rv
  JOIN reservation rs ON rs.id = rv.reservation_id
  JOIN room r ON r.id = rs.room_id
  GROUP BY r.guesthouse_id
) a ON a.guesthouse_id = g.id
WHERE (a.avg_rating IS NULL AND g.rating <> 0.0)
   OR (a.avg_rating IS NOT NULL AND ABS(g.rating - ROUND(a.avg_rating, 1)) > 0.001);

-- 2) 각 게스트하우스의 예약/리뷰 요약(빠른 점검용)
SELECT g.id AS guesthouse_id,
       COUNT(DISTINCT rm.id) AS rooms,
       COUNT(DISTINCT rs.id) AS reservations,
       COUNT(rv.reservation_id) AS reviews,
       g.rating
FROM guesthouse g
LEFT JOIN room rm ON rm.guesthouse_id = g.id
LEFT JOIN reservation rs ON rs.room_id = rm.id
LEFT JOIN review rv ON rv.reservation_id = rs.id
GROUP BY g.id
ORDER BY g.id;

-- Q1. Movie hay TV Show nhiều hơn?
SELECT type, COUNT (*) TOTAL
FROM netflix_raw
GROUP BY TYPE;

-- Q2. Netflix thêm nhiều nội dung nhất năm nào?
SELECT
    YEAR(date_added_clean) year_added,
    COUNT(*) total
FROM netflix_raw
GROUP BY YEAR(date_added_clean)
ORDER BY total DESC;

-- Q3. Top 10 quốc gia có nhiều nội dung nhất
SELECT TOP 10 country, COUNT (*) total
FROM netflix_raw
GROUP BY country
ORDER BY total DESC;

-- Q4. Top Director có nhiều phim nhất
SELECT TOP 10 director, COUNT (*) total
FROM netflix_raw
GROUP BY director
ORDER BY total DESC;

-- Q5. Rating phổ biến nhất
SELECT rating,COUNT(*) total
FROM netflix_raw
GROUP BY rating
ORDER BY total DESC;

-- Q6. Thể loại phổ biến nhất
SELECT
    listed_in,
    COUNT(*) total
FROM netflix_raw
GROUP BY listed_in
ORDER BY total DESC;

-- Q7. Movie có thời lượng dài nhất
SELECT TOP 10
    title,
    duration
FROM netflix_raw
WHERE type='Movie'
ORDER BY duration_value DESC;

-- Q8. Quốc gia nào sản xuất nhiều Movie nhất?
SELECT
    country,
    COUNT(*) total
FROM netflix_raw
WHERE type='Movie'
GROUP BY country
ORDER BY total DESC;

-- Q9. Tốc độ tăng trưởng nội dung Netflix qua các năm
SELECT
    release_year,
    COUNT(*) total
FROM netflix_raw
GROUP BY release_year
ORDER BY release_year;

-- Q10. Tỷ lệ Movie vs TV Show
SELECT
    type,
    ROUND(
        COUNT(*)*100.0/
        (SELECT COUNT(*) FROM netflix_raw),
        2
    ) percentage
FROM netflix_raw
GROUP BY type;
-- =======================================================================================
-- Q11. Phân rã dữ liệu chuỗi (String Splitting) để lập bảng xếp hạng chính xác 
-- Top 10 quốc gia đóng góp nhiều nội dung nhất và tỷ lệ % đóng góp thực tế của họ?
-- =======================================================================================

WITH ExplodedCountries AS (
    -- Dùng STRING_SPLIT để bóc tách các quốc gia ngăn cách bởi dấu phẩy
    SELECT 
        show_id,
        TRIM(value) AS clean_country
    FROM netflix_raw
    CROSS APPLY STRING_SPLIT(country, ',')
    WHERE country IS NOT NULL AND TRIM(value) <> '' AND TRIM(value) <> 'Unknown'
),
CountryStats AS (
    -- Đếm số lượng nội dung của từng quốc gia sau khi đã tách nhỏ
    SELECT 
        clean_country,
        COUNT(*) AS total_contents
    FROM ExplodedCountries
    GROUP BY clean_country
)
--  Áp dụng Window Function để tính tỷ lệ % động dựa trên tổng số nội dung đã phân rã
SELECT TOP 10
    clean_country AS Country,
    total_contents AS Total_Contents,
    ROUND(total_contents * 100.0 / SUM(total_contents) OVER(), 2) AS Percentage_Contribution
FROM CountryStats
ORDER BY total_contents DESC;
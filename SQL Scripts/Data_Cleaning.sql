SELECT
    title,
    COUNT(*) AS total
FROM netflix_raw
GROUP BY title
HAVING COUNT(*) > 1;

SELECT
    SUM(CASE WHEN director IS NULL THEN 1 ELSE 0 END) director_null,
    SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) country_null,
    SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) rating_null
FROM netflix_raw;
UPDATE netflix_raw
SET title = LTRIM(RTRIM(title));

ALTER TABLE netflix_raw
ADD date_added_clean DATE;

UPDATE netflix_raw
SET date_added_clean =
TRY_CONVERT(DATE, date_added);

UPDATE netflix_raw
SET director = 'Unknown'
WHERE director IS NULL;

UPDATE netflix_raw
SET country = 'Unknown'
WHERE country IS NULL;

ALTER TABLE netflix_raw
ADD duration_value INT,
    duration_unit VARCHAR(20);

UPDATE netflix_raw
SET duration_value =
TRY_CAST(LEFT(duration, CHARINDEX(' ',duration)-1) AS INT);

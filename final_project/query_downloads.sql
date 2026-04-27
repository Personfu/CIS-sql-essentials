-- Final Project reporting queries

USE my_web_db;

SELECT 'SANITY CHECK JOIN - UNORDERED' AS note;
SELECT u.email,
       p.product_name,
       d.filename,
       d.download_date
FROM downloads d
JOIN users u ON d.user_id = u.user_id
JOIN products p ON d.product_id = p.product_id;

SELECT 'REQUIRED ORDERED QUERY' AS note;
SELECT u.email,
       p.product_name,
       d.filename,
       d.download_date
FROM downloads d
JOIN users u ON d.user_id = u.user_id
JOIN products p ON d.product_id = p.product_id
ORDER BY u.email DESC,
         p.product_name ASC;

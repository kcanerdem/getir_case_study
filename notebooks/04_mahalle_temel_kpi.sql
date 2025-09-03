SELECT * FROM siparis 
SELECT * FROM mahalle_joined


CREATE OR REPLACE VIEW siparis_mahalle_v AS
SELECT DISTINCT ON (s.order_id)
       s.order_id,
       s.client_id,
       s.basket_value::numeric        AS basket_value,
       s."delivery duration"::numeric AS delivery_min,
       s.profit::numeric              AS profit,
       s.revenue::numeric             AS revenue,
       m.mahalle_id,
       m.il, m.ilce, m.mahalle,
       m.geometry                     AS mahalle_geom
FROM siparis s
JOIN mahalle_joined m
  ON ST_Intersects(m.geometry, s.geometry)     
ORDER BY
  s.order_id,
  ST_Distance(
    ST_Transform(s.geometry, 5254),           
    ST_PointOnSurface(ST_Transform(m.geometry, 5254))
  ) ASC,
  m.mahalle_id;   

CREATE TABLE public.temel_kpi_mahalle AS
SELECT
  v.mahalle_id, v.il, v.ilce, v.mahalle,
  COUNT(v.order_id)                 AS siparis_sayisi,
  ROUND(AVG(v.delivery_min), 2)     AS ort_teslim_suresi,
  ROUND(SUM(v.profit), 2)           AS toplam_kar,
  ROUND(AVG(v.profit), 2)           AS ort_kar,
  ROUND(AVG(v.basket_value), 2)     AS ort_sepet_tutari,
  ROUND(AVG(v.revenue), 2)          AS ort_revenue,
  ROUND(SUM(v.revenue), 2)          AS toplam_revenue,
  v.mahalle_geom                    AS geometry
FROM siparis_mahalle_v v
GROUP BY v.mahalle_id, v.il, v.ilce, v.mahalle, v.mahalle_geom
ORDER BY siparis_sayisi DESC;


CREATE TABLE public.kpi_sla_mahalle AS
SELECT 
  v.mahalle_id,
  v.il,
  v.ilce,
  v.mahalle,
  COUNT(v.order_id) AS siparis_sayisi,
  ROUND(PERCENTILE_CONT(0.80) WITHIN GROUP (ORDER BY v.delivery_min)::numeric, 2) AS p80_sure,
  ROUND(PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY v.delivery_min)::numeric, 2) AS p95_sure,
  ROUND(STDDEV(v.delivery_min)::numeric, 2) AS std_sure,
  v.mahalle_geom AS geometry
FROM siparis_mahalle_v v
GROUP BY v.mahalle_id, v.il, v.ilce, v.mahalle, v.mahalle_geom
HAVING COUNT(v.order_id) > 0
ORDER BY siparis_sayisi DESC;


CREATE TABLE public.kpi_ort_sureyi_asma_yuzdesi_mahalle AS
SELECT 
  v.mahalle_id,
  v.il,
  v.ilce,
  v.mahalle,
  COUNT(*) AS toplam_siparis,
  SUM(CASE WHEN v.delivery_min > o.ort_sure THEN 1 ELSE 0 END) AS asan_siparis,
  ROUND(100.0 * SUM(CASE WHEN v.delivery_min > o.ort_sure THEN 1 ELSE 0 END) / COUNT(*), 2) AS asma_orani_yuzde
FROM siparis_mahalle_v v
JOIN (
  SELECT mahalle_id, AVG(delivery_min) AS ort_sure
  FROM siparis_mahalle_v
  GROUP BY mahalle_id
) o ON v.mahalle_id = o.mahalle_id
GROUP BY v.mahalle_id, v.il, v.ilce, v.mahalle
ORDER BY asma_orani_yuzde DESC;




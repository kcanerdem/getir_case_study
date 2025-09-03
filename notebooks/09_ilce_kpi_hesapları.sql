CREATE OR REPLACE VIEW siparis_ilce_v AS
SELECT
  s.order_id,
  s.client_id,
  s.basket_value::numeric        AS basket_value,
  s."delivery duration"::numeric AS delivery_min,
  s.profit::numeric              AS profit,
  s.revenue::numeric             AS revenue,
  i.ilce,
  i.il,
  i.geometry                     AS ilce_geom
FROM siparis s
JOIN ilce_joined i
  ON ST_Intersects(i.geometry, s.geometry);



CREATE TABLE ilce_temel_kpi AS
SELECT
  v.ilce,
  COUNT(DISTINCT v.client_id) AS musteri_sayisi,
  COUNT(v.order_id) AS toplam_siparis,
  ROUND(AVG(v.profit), 2) AS ort_kar,
  ROUND(SUM(v.profit), 2) AS toplam_kar,
  ROUND(AVG(v.revenue), 2) AS ort_revenue,
  ROUND(SUM(v.revenue), 2) AS toplam_revenue,
  ROUND(AVG(v.delivery_min), 2) AS ort_delivery,
  j.ses_skoru,
  j.nufus,
  j.yas_0_14,
  j.yas_15_24,
  j.yas_25_34,
  j.yas_35_49,
  j.yas_50_64,
  j.yas_65_plus,
  v.ilce_geom
FROM siparis_ilce_v v
JOIN ilce_joined j ON v.ilce = j.ilce
GROUP BY v.ilce, j.nufus, j.ses_skoru,
         j.yas_0_14, j.yas_15_24, j.yas_25_34, j.yas_35_49, j.yas_50_64, j.yas_65_plus,
         v.ilce_geom
ORDER BY toplam_siparis DESC;




CREATE TABLE ilce_kar_marji_kpi AS
SELECT
  v.il,
  v.ilce,
  ROUND(SUM(v.profit), 2) AS toplam_kar,
  ROUND(SUM(v.revenue), 2) AS toplam_revenue,
  ROUND(SUM(v.profit) / NULLIF(SUM(v.revenue), 0), 4) AS kar_marji,
  j.ses_skoru,
  j.geometry
FROM siparis_ilce_v v
JOIN ilce_joined j ON v.ilce = j.ilce
GROUP BY v.il, v.ilce, j.ses_skoru,j.geometry
ORDER BY kar_marji DESC;

CREATE TABLE ilce_ses_kpi_korelasyon AS
SELECT
  CORR(ses_skoru::numeric, talep_yogunlugu::numeric)   AS ses_vs_talep_korelasyon,
  CORR(ses_skoru::numeric, toplam_kar::numeric)        AS ses_vs_kar_korelasyon,
  CORR(ses_skoru::numeric, penetrasyon_orani::numeric) AS ses_vs_penetrasyon_korelasyon
FROM (
  SELECT
    j.ses_skoru,
    COUNT(v.order_id)::numeric / NULLIF(j.nufus, 0) AS talep_yogunlugu,
    SUM(v.profit)::numeric                          AS toplam_kar,
    COUNT(DISTINCT v.client_id)::numeric / NULLIF(j.nufus, 0) AS penetrasyon_orani
  FROM siparis_ilce_v v
  JOIN ilce_joined j ON v.ilce = j.ilce
  GROUP BY j.ses_skoru, j.nufus
) AS ilce_kpi;

CREATE TABLE ilce_nufus_kpi AS
SELECT
  v.ilce,
  COUNT(DISTINCT v.client_id) AS musteri_sayisi,
  COUNT(v.order_id) AS toplam_siparis,
  j.nufus,
  ROUND(j.nufus_yogunlugu::NUMERIC,4) AS nufus_yogunlugu,
  ROUND(COUNT(DISTINCT v.client_id)::decimal / NULLIF(j.nufus, 0), 4) AS penetrasyon_orani,
  ROUND(COUNT(v.order_id)::decimal / NULLIF(j.nufus, 0), 4) AS talep_yogunlugu,
  CASE
    WHEN j.yas_0_14 = GREATEST(j.yas_0_14, j.yas_15_24, j.yas_25_34, j.yas_35_49, j.yas_50_64, j.yas_65_plus) THEN '0-14'
    WHEN j.yas_15_24 = GREATEST(j.yas_0_14, j.yas_15_24, j.yas_25_34, j.yas_35_49, j.yas_50_64, j.yas_65_plus) THEN '15-24'
    WHEN j.yas_25_34 = GREATEST(j.yas_0_14, j.yas_15_24, j.yas_25_34, j.yas_35_49, j.yas_50_64, j.yas_65_plus) THEN '25-34'
    WHEN j.yas_35_49 = GREATEST(j.yas_0_14, j.yas_15_24, j.yas_25_34, j.yas_35_49, j.yas_50_64, j.yas_65_plus) THEN '35-49'
    WHEN j.yas_50_64 = GREATEST(j.yas_0_14, j.yas_15_24, j.yas_25_34, j.yas_35_49, j.yas_50_64, j.yas_65_plus) THEN '50-64'
    ELSE '65+'
  END AS baskin_yas_grubu,
  j.geometry
FROM siparis_ilce_v v
JOIN ilce_joined j ON v.ilce = j.ilce
GROUP BY v.ilce, j.nufus, j.nufus_yogunlugu,j.yas_0_14, j.yas_15_24, j.yas_25_34, j.yas_35_49, j.yas_50_64, j.yas_65_plus,j.geometry
ORDER BY talep_yogunlugu DESC;

CREATE TABLE ilce_nuf_yog_korelasyon AS
SELECT
  CORR(nufus_yogunlugu::numeric, talep_yogunlugu::numeric)   AS nuf_yog_vs_talep_korelasyon,
  CORR(nufus_yogunlugu::numeric, toplam_kar::numeric)        AS nuf_yog_vs_kar_korelasyon,
  CORR(nufus_yogunlugu::numeric, penetrasyon_orani::numeric) AS nuf_yog_vs_penetrasyon_korelasyon
FROM (
  SELECT
    j.nufus_yogunlugu,
    COUNT(v.order_id)::numeric / NULLIF(j.nufus, 0) AS talep_yogunlugu,
    SUM(v.profit)::numeric                          AS toplam_kar,
    COUNT(DISTINCT v.client_id)::numeric / NULLIF(j.nufus, 0) AS penetrasyon_orani
  FROM siparis_ilce_v v
  JOIN ilce_joined j ON v.ilce = j.ilce
  GROUP BY j.nufus_yogunlugu, j.nufus
) AS ilce_kpi;








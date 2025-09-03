SELECT 
  m.mahalle_id,
  ROUND(i.ses_skoru * m.nufus / SUM(m.nufus) OVER (PARTITION BY m.ilce), 2) AS agirlikli_ses
FROM mahalle_joined m
JOIN ilce_joined i ON m.ilce = i.ilce;

ALTER TABLE mahalle_joined ADD COLUMN agirlikli_ses_skoru NUMERIC;

UPDATE mahalle_joined m
SET agirlikli_ses_skoru = s.agirlikli_ses
FROM (
  SELECT 
    m.mahalle_id,
    ROUND(i.ses_skoru * m.nufus / SUM(m.nufus) OVER (PARTITION BY m.ilce), 2) AS agirlikli_ses
  FROM mahalle_joined m
  JOIN ilce_joined i ON m.ilce = i.ilce
) s
WHERE m.mahalle_id = s.mahalle_id;

SELECT mahalle_id, agirlikli_ses_skoru, SUM(profit)/SUM(revenue) AS kar_marji
FROM siparis_mahalle_v
GROUP BY mahalle_id;


CREATE TABLE mahalle_talep_penetrasyon_orani AS
SELECT
  v.mahalle_id,
  v.mahalle,
  v.ilce,
  COUNT(v.order_id) AS toplam_siparis,
  COUNT(DISTINCT v.client_id) AS musteri_sayisi,
  m.nufus,
  ROUND(COUNT(v.order_id)::decimal / NULLIF(m.nufus, 0), 4) AS talep_yogunlugu,
  ROUND(COUNT(DISTINCT v.client_id)::decimal / NULLIF(m.nufus, 0), 4) AS penetrasyon_orani
FROM siparis_mahalle_v v
JOIN mahalle_joined m ON v.mahalle_id = m.mahalle_id
GROUP BY v.mahalle_id, v.mahalle, v.ilce, m.nufus, m.agirlikli_ses_skoru
ORDER BY penetrasyon_orani DESC;


CREATE TABLE mahalle_talep_ses_analiz AS
WITH mahalle_kpi AS (
  SELECT
    v.mahalle_id,
    v.mahalle,
    v.ilce,
    COUNT(v.order_id) AS toplam_siparis,
    COUNT(DISTINCT v.client_id) AS musteri_sayisi,
    m.nufus,
    ROUND(COUNT(v.order_id)::decimal / NULLIF(m.nufus, 0), 4) AS talep_yogunlugu,
    m.agirlikli_ses_skoru
  FROM siparis_mahalle_v v
  JOIN mahalle_joined m ON v.mahalle_id = m.mahalle_id
  GROUP BY v.mahalle_id, v.mahalle, v.ilce, m.nufus, m.agirlikli_ses_skoru
),
ortalama AS (
  SELECT
    AVG(agirlikli_ses_skoru) AS ort_ses,
    AVG(talep_yogunlugu) AS ort_talep
  FROM mahalle_kpi
)
SELECT
  k.*,
  CASE
    WHEN k.agirlikli_ses_skoru >= o.ort_ses AND k.talep_yogunlugu >= o.ort_talep THEN 'A - Premium'
    WHEN k.agirlikli_ses_skoru >= o.ort_ses AND k.talep_yogunlugu <  o.ort_talep THEN 'B - Erişim Sorunu'
    WHEN k.agirlikli_ses_skoru <  o.ort_ses AND k.talep_yogunlugu >= o.ort_talep THEN 'C - Fiyat Duyarlı'
    ELSE 'D - Düşük Potansiyel'
  END AS mahalle_segmenti
FROM mahalle_kpi k, ortalama o
ORDER BY mahalle_segmenti;





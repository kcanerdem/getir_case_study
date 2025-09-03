CREATE TABLE mahalle_kar_marjini AS
SELECT
  v.mahalle_id,
  v.il,
  v.ilce,
  v.mahalle,
  COUNT(v.order_id) AS siparis_sayisi,
  COUNT(DISTINCT v.client_id) AS musteri_sayisi,
  ROUND(SUM(v.profit), 2) AS toplam_kar,
  ROUND(SUM(v.revenue), 2) AS toplam_revenue,
  ROUND(SUM(v.profit) / NULLIF(SUM(v.revenue), 0), 4) AS kar_marji,
  v.mahalle_geom AS geometry
FROM siparis_mahalle_v v
GROUP BY v.mahalle_id, v.il, v.ilce, v.mahalle, v.mahalle_geom
ORDER BY kar_marji DESC;

CREATE TABLE mahalle_karli_siparis_orani AS
SELECT
  v.mahalle_id,
  v.il,
  v.ilce,
  v.mahalle,
  COUNT(v.order_id) AS toplam_siparis,
  COUNT(v.order_id) FILTER (WHERE v.profit > 0) AS karli_siparis,
  ROUND(COUNT(v.order_id) FILTER (WHERE v.profit > 0)::decimal / NULLIF(COUNT(v.order_id), 0), 4) AS karli_siparis_orani,
  v.mahalle_geom AS geometry
FROM siparis_mahalle_v v
GROUP BY v.mahalle_id, v.il, v.ilce, v.mahalle, v.mahalle_geom
ORDER BY karli_siparis_orani DESC;

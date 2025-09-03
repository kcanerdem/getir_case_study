
CREATE TABLE mahalle_temel_kpi_korelasyon AS
SELECT
  CORR(m.nufus::numeric, k.ort_sepet_tutari::numeric) AS mahalle_nufus_vs_sepet_korelasyon,
  CORR(m.nufus::numeric, k.toplam_kar::numeric)       AS mahalle_nufus_vs_kar_korelasyon,
  CORR(m.nufus::numeric, k.toplam_revenue::numeric)   AS mahalle_nufus_vs_revenue_korelasyon
FROM temel_kpi_mahalle k
JOIN mahalle_joined m ON k.mahalle_id = m.mahalle_id;


CREATE TABLE mahalle_kpi_korelasyon AS
SELECT
  CORR(nufus::numeric, talep_yogunlugu::numeric)   AS mahalle_nufus_vs_talep_korelasyon,
  CORR(nufus::numeric, penetrasyon_orani::numeric) AS mahalle_nufus_vs_penetrasyon_korelasyon
FROM mahalle_talep_penetrasyon_orani;

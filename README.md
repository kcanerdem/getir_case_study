# 🚚 Operasyonel & Finansal KPI Analizi ve Servis Alanı Optimizasyonu

## 🎯 Projenin Amacı  
Bu projede, sipariş ve depo verileri analiz edilerek operasyonel ve finansal KPI’ların hesaplanması ve depo bazlı optimum servis alanlarının belirlenmesi hedeflenmiştir.
CBS, veri bilimi, pazarlama ve iş zekâsı yaklaşımları bir araya getirilerek veri odaklı bir karar destek modeli geliştirilmiştir.
Ayrıca, elde edilen performans göstergeleri nüfus yoğunluğu ve SES skorları vb. veriler ile ilişkilendirilmiş; böylece anlamlı mekânsal pazar içgörüleri elde edilmiştir.

## 📊 Kullanılan Veriler  
- **Sipariş verisi** → sipariş id, müşteri id, kar, sepet tutarı, gelir, teslimat süresi, koordinatlar
- **Depo verisi** → depo lokasyonları ve isimleri 
- **Yol ağı verisi** 
- **Demografik veriler** → ilçe / mahalle bazlı nüfus bilgileri
- **Ses Skoru Verisi** → İlçe bazlı sosyo-ekonomik statü skoru bilgisi

---

## 🛠️ Kullanılan Teknolojiler  
- **Python** → Pandas, GeoPandas, Scikit-learn, sqlalchemy, Matplotlib ,Networkx, Osmnx, H3, Shapely
- **PostgreSQL/PostGIS** → veri depolama ve sorgulama  
- **ArcGIS Pro** → tematik haritalar
- **Git & GitHub** → versiyon kontrol ve paylaşım  


## 📊 Mahale Bazında Analizler
### Mahalle Bazında Temel Kpiların Üretilmesi
Mahalle ölçeğinde  temel performans göstergelerinin (KPI) üretilmesi kritik öneme sahiptir. Bu kapsamda, her mahalle için sipariş, müşteri, finansal ve operasyonel veriler işlenerek temel göstergeler hesaplanmıştır.
<img width="1335" height="470" alt="image" src="https://github.com/user-attachments/assets/44a8bcfe-6563-4cb3-accd-4e1b7db8db96" />


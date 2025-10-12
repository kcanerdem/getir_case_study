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
### A) Mahalle Bazında Temel Kpiların Üretilmesi
- Mahalle ölçeğinde  temel performans göstergelerinin (KPI) üretilmesi kritik öneme sahiptir. Bu kapsamda, her mahalle için sipariş, müşteri, finansal ve operasyonel veriler işlenerek temel göstergeler hesaplanmıştır.

<img width="1335" height="470" alt="image" src="https://github.com/user-attachments/assets/44a8bcfe-6563-4cb3-accd-4e1b7db8db96" />

### B) Mahalle Bazında Kar Marjının Hesaplanması
- Her mahalle için mekansal analiz ile sipariş bazlı toplam gelir ve toplam kâr değerleri hesaplandı.
Bu değerler oranlanarak mahalle ölçeğinde kâr marjı (%) bulundu.

<img width="1142" height="316" alt="image" src="https://github.com/user-attachments/assets/36e379b4-0edf-48a7-b797-190ac9fda6be" />

### C) Mahalle Bazlı Kâr Marjı ve Finansal Performans

<img width="1319" height="746" alt="image" src="https://github.com/user-attachments/assets/a9a3635e-97ae-42bc-b70e-f6461521b42b" />

- Kâr marjları mahalleler arasında %41–44 bandında ve performansı belirleyen ana unsurlardan birisi hacimdir. Şehabettinpaşa tek istisna olarak zarar bölgesi olup (%–0.08), operasyonel maliyetlerin optimize edilmesi gerektiğini göstermektedir.

<img width="1165" height="823" alt="image" src="https://github.com/user-attachments/assets/7653f811-22ea-444c-a5eb-3bd1beb46a5b" />

### D) Mahalle Nüfusu ile Kpi İlişkisi 

<img width="1145" height="747" alt="image" src="https://github.com/user-attachments/assets/2fce1176-0bba-418e-83b5-49c3fd5f0c35" />
- Kalabalık mahalleler yüksek gelir ve kâr potansiyeli sunuyor.











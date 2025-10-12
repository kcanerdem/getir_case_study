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

### E) Mahalle Bazında talep Yoğunluğu ve Penetrasyon Oranı Hesaplanması
<img width="1684" height="108" alt="image" src="https://github.com/user-attachments/assets/b7fc9e37-2135-4cf6-952a-8977c703b9cc" />

-Her mahalledeki toplam sipariş sayısı hesaplandı. Mahalle bazında nüfusa bölünerek talep yoğunluğu (sipariş / kişi) bulundu.
Penetrasyon oranı için ise: Her mahalle için siparişlerden elde edilen benzersiz müşteri sayısı hesaplandı ve o mahallenin nüfus değerine bölündü.

<img width="1243" height="879" alt="image" src="https://github.com/user-attachments/assets/3052674f-9372-46c8-9612-4758c0d4f984" />

<img width="791" height="559" alt="image" src="https://github.com/user-attachments/assets/7375c328-d593-484c-80e4-b0bc99815d8b" />

### F) Mahalle Bazlı Talep Yoğunluğu & Sosyo- Ekomomik Statü Skoru Analizi 

<img width="1459" height="770" alt="image" src="https://github.com/user-attachments/assets/b05406c6-4943-4042-85fb-34851286d07c" />

### E) Mekansal İstatistiklerle Premium Pazar Alanları

<img width="1455" height="770" alt="image" src="https://github.com/user-attachments/assets/fb326b7a-3f2f-48d9-bca8-9ae61f600f42" />

<img width="1264" height="894" alt="image" src="https://github.com/user-attachments/assets/b0c84006-b5cd-4bd9-abdb-55d70768ae2b" />

---

## 📊 İlçe Bazında Analizler 

### A) İlçe Bazında Temel Kpiların Üretilmesi

<img width="1158" height="128" alt="image" src="https://github.com/user-attachments/assets/ddfa8cde-ebf1-4668-8bd6-3ed1e83b2322" />

### B) İlçe Bazında Kar Marjının Hesaplanması

<img width="893" height="128" alt="image" src="https://github.com/user-attachments/assets/afb754c7-2677-41f2-877a-12fcb5d22416" />

### C) İlçe Bazında Talep ve Penetrasyon Yoğunluklarının Hesaplanması

<img width="1454" height="129" alt="image" src="https://github.com/user-attachments/assets/7b116bf2-acb8-4d41-8f58-fca1e0cb5fbb" />

<img width="842" height="595" alt="image" src="https://github.com/user-attachments/assets/5b8d5b4c-243f-48d1-b44c-da63adb3e460" />

<img width="1329" height="940" alt="image" src="https://github.com/user-attachments/assets/965662ca-b42f-46b2-b5f1-4ce3c7b74fa9" />


### C) İlçe Bazlı Kâr, Kâr Marjı ve SES Skoru Analizi

<img width="1186" height="805" alt="image" src="https://github.com/user-attachments/assets/d6729c4e-c335-46a2-836f-70bf19a5b060" />

- SES skoru, finansal performansın en güçlü belirleyicisidir; yüksek SES bölgeleri daha yüksek kâr ve kâr marjı sağlamaktadır.

### D) İlçe Bazlı Baskın Yaş Grubu (35-49), Talep ve Penetrasyon Analizi

<img width="1162" height="707" alt="image" src="https://github.com/user-attachments/assets/0786e7bb-6cd4-41d5-931c-103511896af0" />

- Nilüfer mevcut en güçlü pazar; Osmangazi ve Yıldırım ise büyük nüfuslarına rağmen düşük penetrasyon ile büyüme fırsatları sunuyor.

### E) Sosyo-Ekonomik Seviye ile KPI İlişkisi

<img width="1120" height="807" alt="image" src="https://github.com/user-attachments/assets/17554dce-0d54-484e-91b0-9c704f009e60" />

-Sosyo-ekonomik seviye, tüm performans göstergelerinin ana belirleyicisidir; yüksek SES bölgeleri stratejik öncelik olmalıdır.

## 📊 Sevis Alanı Analizi

a) Yol Ağı ve Süre Hesaplamaları
Yol ağı (network) verisi indirildi ve temizlendi.
Her grid hücresi → en yakın depoya olan teorik erişim süresi hesaplandı.
Eğim ve yol tipi gibi faktörlerle süreler optimize edildi.

b) Depo Yüküne Göre Süre Optimizasyonu
Depoların yogunluklarını dengelemek amacıyla ceza faktörü uygulandı.
Yoğun depoların süreleri artırıldı → alternatif depolara yönlendirme yapıldı.
Böylece siparişe sahip 17 grid hücresi farklı depolara yeniden atandı.

c)  Sipariş Yoğunluğuna Göre İkinci Süre Optimizasyonu
İlk atamalardan sonra çıkan süreler, mahalle bazındaki sipariş yoğunluğu ile tekrar değerlendirildi.
Sipariş yoğunluğu yüksek olan mahallelerde süreler ek ceza ile artırıldı → yük dengelemesi sağlandı.
Böylece hem depo yükü hem de sipariş yoğunluğu dikkate alınarak daha gerçekçi servis alanları elde edildi.

d) SLA Zonlarının Oluşturulması:
Hücreler erişim sürelerine göre 4 sınıfa ayrıldı:
0–5 dk
5–10 dk
10–15 dk
15+ dk
Her depo için bu SLA zonları oluşturuldu.


<img width="1237" height="875" alt="image" src="https://github.com/user-attachments/assets/4f838adb-f5eb-4dca-832a-672d97b2e814" />

## 📊 Sevis Alanı Analizi (ArcGIS Pro ile)

<img width="1260" height="891" alt="image" src="https://github.com/user-attachments/assets/a5016f25-f39e-4792-86cb-ab197b8eab87" />

### A) Depo Bazlı Operasyonel ve Finansal Performans KPI’ları

<img width="1141" height="767" alt="image" src="https://github.com/user-attachments/assets/a56e4d6b-abdb-45f1-8a59-81ca0c97db7c" />

- Yoğun bölgelerde kapasite planlaması ve yüksek sepetli müşteriler için hedeflenmiş stratejiler gerektirdiğini gösterir.

<img width="1151" height="733" alt="image" src="https://github.com/user-attachments/assets/693e5359-6ace-49ab-88bf-e5f5b02047f8" />

- Kısa erişim bölgelerinin kârlılıkta temel rol oynadığını, orta erişim bölgelerinin ise müşteri segmentasyonu ve sepet büyüklüğü stratejileri için fırsat sunduğunu gösterir.

<img width="1059" height="735" alt="image" src="https://github.com/user-attachments/assets/c39aeb4c-9442-45ec-8723-bd122bc7ef4e" />

- 10–15 dk erişim zonu, geniş kapsama alanına rağmen talep yaratmıyor; tek katkı wh_9’dan geliyor ve finansal önemi sınırlı.

### B) Depo Bazlı Sipariş ve Teslimat Süresi Analizi

<img width="1019" height="770" alt="image" src="https://github.com/user-attachments/assets/f0573a09-34e2-4bdf-a719-3ee71b92cbd7" />

-wh_9 hacim lideri ancak yavaş; wh_7 en uzun süreyle riskli, wh_1 ve wh_3 hız avantajlı; diğer depolar optimizasyona ihtiyaç duyuyor.









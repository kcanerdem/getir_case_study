# 🚚 Operational & Financial KPI Analysis, Market Insights, and Service Area Optimization

## 🌟 Project Objective  
In this project, order and warehouse data were analyzed to calculate **operational and financial KPIs** and to determine **optimal warehouse-based service areas**.  
By integrating **GIS, data science, marketing, and business intelligence** approaches, data-driven analytical workflows were established.  
Additionally, the generated performance indicators were correlated with **population density** and **Socioeconomic Status (SES) scores**, revealing **meaningful spatial market insights** that explain variations in regional demand, income potential, and service efficiency.

---

## 📊 Data
- **Order Data** → order ID, customer ID, profit, basket value, revenue, delivery duration, coordinates  
- **Warehouse Data** → warehouse names and locations  
- **Road Network Data**  
- **Demographic Data** → district/neighborhood-based population data  
- **SES Score Data** → socioeconomic status scores by district  
- **DEM Data** → digital elevation model used for slope and accessibility adjustments  

---

## 📊 Neighborhood-Level Analyses
### A) Generation of Core KPIs 

- Calculating key performance indicators (KPIs) at the neighborhood scale is crucial for spatial performance evaluation.  
  For each neighborhood, order, customer, financial, and operational data were processed to generate fundamental indicators.

<img width="1335" height="470" alt="image" src="https://github.com/user-attachments/assets/44a8bcfe-6563-4cb3-accd-4e1b7db8db96" />

### B) Neighborhood-Level Profit Margin Calculation

- For each neighborhood, total revenue and total profit were spatially aggregated.  
  Their ratio was computed to obtain **profit margin (%)**, allowing comparative financial assessment across neighborhoods.

  <img width="1142" height="316" alt="image" src="https://github.com/user-attachments/assets/36e379b4-0edf-48a7-b797-190ac9fda6be" />

### C) Neighborhood-Level Profit Margin and Financial Performance

<img width="1319" height="746" alt="image" src="https://github.com/user-attachments/assets/a9a3635e-97ae-42bc-b70e-f6461521b42b" />

- Profit margins across neighborhoods ranged between **41–44%**, with transaction volume being the primary driver of performance.  
  *Şehabettinpaşa* was the only loss zone (–0.08%), highlighting the need for operational cost optimization.

<img width="1165" height="823" alt="image" src="https://github.com/user-attachments/assets/7653f811-22ea-444c-a5eb-3bd1beb46a5b" />

### D) Relationship Between Population Density and KPIs

<img width="1145" height="747" alt="image" src="https://github.com/user-attachments/assets/2fce1176-0bba-418e-83b5-49c3fd5f0c35" />

- Neighborhoods with higher population density demonstrate **higher revenue and profit potential**, indicating the influence of demographic scale on performance.

### E) Demand Density and Penetration Rate Calculation

<img width="1362" height="316" alt="image" src="https://github.com/user-attachments/assets/1fbfa6d8-047d-4078-a157-deeca3e55ee1" />

- For each neighborhood, total number of orders was calculated and divided by population to derive **demand density (orders per person)**.  
  Unique customer counts were also calculated to derive **penetration rate (unique customers / population)**, indicating market reach and engagement.

<img width="1243" height="879" alt="image" src="https://github.com/user-attachments/assets/3052674f-9372-46c8-9612-4758c0d4f984" />

<img width="791" height="559" alt="image" src="https://github.com/user-attachments/assets/7375c328-d593-484c-80e4-b0bc99815d8b" />


### F) Demand Density vs Socioeconomic Status (SES) Score

<img width="1459" height="770" alt="image" src="https://github.com/user-attachments/assets/b05406c6-4943-4042-85fb-34851286d07c" />


---

## 📊 District-Level Analyses

### A) District-Level KPI Generation

<img width="1158" height="128" alt="image" src="https://github.com/user-attachments/assets/ddfa8cde-ebf1-4668-8bd6-3ed1e83b2322" />

### B) District-Level Profit Margin Calculation

<img width="893" height="128" alt="image" src="https://github.com/user-attachments/assets/afb754c7-2677-41f2-877a-12fcb5d22416" />

### C) Demand and Penetration Density per District

<img width="1454" height="129" alt="image" src="https://github.com/user-attachments/assets/7b116bf2-acb8-4d41-8f58-fca1e0cb5fbb" />

<img width="842" height="595" alt="image" src="https://github.com/user-attachments/assets/5b8d5b4c-243f-48d1-b44c-da63adb3e460" />

<img width="1329" height="940" alt="image" src="https://github.com/user-attachments/assets/965662ca-b42f-46b2-b5f1-4ce3c7b74fa9" />

### D) District-Level Profit, Profit Margin, and SES Score Analysis

<img width="1186" height="805" alt="image" src="https://github.com/user-attachments/assets/d6729c4e-c335-46a2-836f-70bf19a5b060" />

- SES score was identified as the **strongest determinant** of financial performance.  
  Districts with higher SES achieved higher profit and profit margins, emphasizing the relationship between socioeconomic level and business potential.

### E) Dominant Age Group (35–49), Demand, and Penetration Analysis

<img width="1162" height="707" alt="image" src="https://github.com/user-attachments/assets/0786e7bb-6cd4-41d5-931c-103511896af0" />

- *Nilüfer* district represents the most developed market, while *Osmangazi* and *Yıldırım* — despite large populations — show **low penetration and high growth potential**.

### F) Relationship Between SES and KPIs

<img width="1120" height="807" alt="image" src="https://github.com/user-attachments/assets/17554dce-0d54-484e-91b0-9c704f009e60" />
- Socioeconomic level is the **main determinant** of all performance metrics; high-SES regions should be prioritized for strategic focus and investment.

---

## 📊 Service Area Analysis

### a) Road Network and Travel Time Calculations
- The road network data was cleaned and processed.
- Each grid cell’s **theoretical travel time to the nearest warehouse** was calculated.
- Travel times were adjusted using factors such as **slope and road type** to improve realism.

### b) Time Optimization Based on Warehouse Load
- To balance warehouse workloads, a **penalty factor** was introduced for congested warehouses.  
  High-load warehouses were penalized with longer travel times to redirect traffic to less loaded ones.  
  As a result, **17 grid cells** were reassigned to alternative warehouses, achieving balanced load distribution.

### c) Second Optimization Based on Order Density
- Travel times from the first stage were re-evaluated considering **neighborhood-level order density**.  
  Densely ordered neighborhoods received additional penalty adjustments to redistribute demand.  
  This dual optimization produced more realistic and **operationally balanced service areas**.

### d) Creation of SLA Zones
- Grid cells were classified into four service-level categories based on travel time:
  - 0–5 min  
  - 5–10 min  
  - 10–15 min  
  - 15+ min  
- SLA (Service Level Agreement) zones were generated for each warehouse.

---

## 📊 Service Area Analysis (ArcGIS Pro)

### A) Warehouse-Based Operational and Financial Performance KPIs

<img width="1141" height="767" alt="image" src="https://github.com/user-attachments/assets/a56e4d6b-abdb-45f1-8a59-81ca0c97db7c" />

- Dense areas require **capacity planning** and **targeted strategies for high-basket-value customers**.

<img width="1151" height="733" alt="image" src="https://github.com/user-attachments/assets/693e5359-6ace-49ab-88bf-e5f5b02047f8" />

- Short-access zones play a **critical role in profitability**, while mid-access zones represent **opportunities for customer segmentation and basket-size growth strategies**.

<img width="1059" height="735" alt="image" src="https://github.com/user-attachments/assets/c39aeb4c-9442-45ec-8723-bd122bc7ef4e" />

- The **10–15 min access zone**, despite large coverage, generates limited demand — only *wh_9* contributes significantly, indicating **low financial relevance**.

### B) Warehouse-Based Order and Delivery Time Analysis

<img width="1019" height="770" alt="image" src="https://github.com/user-attachments/assets/f0573a09-34e2-4bdf-a719-3ee71b92cbd7" />

- *wh_9* is the **volume leader but slow**,  
  *wh_7* has the **longest delivery times and is operationally risky**,  
  *wh_1* and *wh_3* are **fast and efficient**,  
  while the **remaining warehouses require optimization** to achieve balanced service performance.

# 🚚 Operational & Financial KPI Analysis, Market Insights, and Service Area Optimization

## 🌟 Project Objective  
In this project, order and warehouse data were analyzed to calculate **operational and financial KPIs** and to determine **optimal warehouse-based service areas**.  
By integrating **GIS, data science, marketing, and business intelligence** approaches, data-driven analytical workflows were established.  
Additionally, the generated performance indicators were correlated with **population density** and **Socioeconomic Status (SES) scores**, revealing **meaningful spatial market insights** that explain variations in regional demand, income potential, and service efficiency.

---

## 📊 Data Sources  
- **Order Data** → order ID, customer ID, profit, basket value, revenue, delivery duration, coordinates  
- **Warehouse Data** → warehouse names and locations  
- **Road Network Data**  
- **Demographic Data** → district/neighborhood-based population data  
- **SES Score Data** → socioeconomic status scores by district  
- **DEM Data** → digital elevation model used for slope and accessibility adjustments  

---

## 📊 Neighborhood-Level Analyses
### A) Generation of Core KPIs per Neighborhood

- Calculating key performance indicators (KPIs) at the neighborhood scale is crucial for spatial performance evaluation.  
  For each neighborhood, order, customer, financial, and operational data were processed to generate fundamental indicators.

### B) Neighborhood-Level Profit Margin Calculation

- For each neighborhood, total revenue and total profit were spatially aggregated.  
  Their ratio was computed to obtain **profit margin (%)**, allowing comparative financial assessment across neighborhoods.

### C) Neighborhood-Level Profit Margin and Financial Performance

- Profit margins across neighborhoods ranged between **41–44%**, with transaction volume being the primary driver of performance.  
  *Şehabettinpaşa* was the only loss zone (–0.08%), highlighting the need for operational cost optimization.

### D) Relationship Between Population Density and KPIs

- Neighborhoods with higher population density demonstrate **higher revenue and profit potential**, indicating the influence of demographic scale on performance.

### E) Demand Density and Penetration Rate Calculation

- For each neighborhood, total number of orders was calculated and divided by population to derive **demand density (orders per person)**.  
  Unique customer counts were also calculated to derive **penetration rate (unique customers / population)**, indicating market reach and engagement.

### F) Demand Density vs Socioeconomic Status (SES) Score

- By comparing SES scores with demand density and profitability, **premium market areas** were identified — high SES neighborhoods combine strong purchasing power with high order frequency.

---

## 📊 District-Level Analyses

### A) District-Level KPI Generation

- Core KPIs were computed for each district to evaluate financial and operational efficiency across administrative boundaries.

### B) District-Level Profit Margin Calculation

- District-level profit margins were derived using aggregated order and revenue data to measure inter-district financial variation.

### C) Demand and Penetration Density per District

- Districts were compared based on **total order density** and **penetration rate**, revealing spatial patterns of demand concentration.

### D) District-Level Profit, Profit Margin, and SES Score Analysis

- SES score was identified as the **strongest determinant** of financial performance.  
  Districts with higher SES achieved higher profit and profit margins, emphasizing the relationship between socioeconomic level and business potential.

### E) Dominant Age Group (35–49), Demand, and Penetration Analysis

- *Nilüfer* district represents the most developed market, while *Osmangazi* and *Yıldırım* — despite large populations — show **low penetration and high growth potential**.

### F) Relationship Between SES and KPIs

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

- Dense areas require **capacity planning** and **targeted strategies for high-basket-value customers**.  
- Short-access zones play a **critical role in profitability**, while mid-access zones represent **opportunities for customer segmentation and basket-size growth strategies**.  
- The **10–15 min access zone**, despite large coverage, generates limited demand — only *wh_9* contributes significantly, indicating **low financial relevance**.

### B) Warehouse-Based Order and Delivery Time Analysis

- *wh_9* is the **volume leader but slow**,  
  *wh_7* has the **longest delivery times and is operationally risky**,  
  *wh_1* and *wh_3* are **fast and efficient**,  
  while the **remaining warehouses require optimization** to achieve balanced service performance.
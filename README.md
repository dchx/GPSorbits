# GPSorbits

Measuring GPS satellite orbits with mobile GPS software

A GPS software installed on a mobile phone can locate our position on the earth (longitude and latitude) as well as GPS satellites' positions (altitude and azimuth) in the sky. I provide a method to measure GPS satellites' orbital elements only with mobile GPS softwares. I collected several GPS satellites' position data with local time and calculated their orbital elements, with errors of less than 2.54 degrees compared with the official orbital data from US National Coordination Office (NCO) for Space-Based Positioning, Navigation, and Timing (PNT). Based on the orbital elements I calculated, I forecasted some of the satellites' positions during a specific period. To verify my forecast, I measured these satellites' positions using my mobile phone in this period. The observed values and the theoretical forecast fits well. Using my method, we can measure any satellite's orbit and forecast its position with given observed data.

---

![](results/data-number.png?raw=true)

The observed GPS satellites in horizontal coordinates measured from 8 PM to 11 PM on May 29, 2014 on the roof of the Physics Building at Jilin University Central Campus in Changchun, China (125.2768°E, 43.8253°N).

---

![](results/fit4.png?raw=true)

Transform the equatorial coordinates (α, δ) of the satellites into the (tan δ / cos α, tan α) space and reduce the orbit fitting problem into a linear one.

---

![](results/sphfit-number.png?raw=true)

The observed GPS satellites and the fitted orbits in equatorial coordinates.

---

![](results/earthall-number.png?raw=true)

The observed GPS satellites and the fitted orbits projected on the world map.

---

![](results/forecast-number.png?raw=true)

Forcasting the transit of two satellites on June 6, 2014 as the blue curve, and the observations of them in blude dots.

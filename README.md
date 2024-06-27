This repository contains files used in the creation of the following [visualisation](https://public.tableau.com/views/j_employment/J_empl?:language=en-GB&:sid=&:display_count=n&:origin=viz_share_link&:device=desktop) of Japanese employment data over the period 2015-2023.

The data used was sourced from the [Japanese government's annual Labour Force Survey](https://www.e-stat.go.jp/en/stat-search/files?page=1&layout=datalist&toukei=00200531&tstat=000000110001&cycle=7&tclass1=000001040276&tclass2=000001040283&tclass3=000001040284&cycle_facet=tclass1%3Atclass2%3Acycle&tclass4val=0&metadata=1&data=1) (via e-Stat). The project was inspired by Maryna Shut's [Japan employment data 2017 - 2021](https://www.kaggle.com/datasets/marshuu/japan-employment-data-2017-2021/data?select=Employment_Japan+-+employment.csv) Kaggle dataset, but we decided to source our data directly from e-Stat to consider a larger time range, among other reasons.

We extracted the data necessary for each figure in the visualisation using SQL (MySQL), and then created the visualisation itself in Tableau Public.

As well as general employment patterns, we were particularly interested in gender differences in the employment data. Some points of analysis from the visualisation are the following: 

* the female labour force participation rate was significantly lower than the male labour force participation rate over the period, but increased over the period more than the male labour force participation rate did, which was almost constant.
* the Japanese employment rate was consistently low over the period, and slightly lower for women than for men. For both genders, the unemployment rates changed the same way over the period. There was a fall in the unemployment rate from 2015 to 2019, but an increase in 2020 and 2021, probably due to the COVID-19 pandemic, though this increase was only slight.
* non-regular employment is mostly comprised of part-time work, followed by temporary work and then contract work. While temporary work is largely evenly split between men and women, part-time workers are overwhelmingly women. 

Note the following on the types of non-regular employment:

* "temporary work" here means アルバイト *arubaito* which refers to side-jobs (done in addition to a main job or school), typically held by university students, while "part-time work" means パート *paato* – jobs that are not full-time and are held by those who do not have other employment elsewhere. While the terms are often used interchangeably in Japanese, they are distinguished in the survey (see "Part-time and temporary employment in Japan", Susan Houseman and Machiko Osawa).
* "dispatched worker" refers to a dispatched worker from temporary labour agency.

For more information on the definitions used in the Labour Force Survey, please see the following [document](https://www.stat.go.jp/english/data/roudou/pdf/definite.pdf) issued by the Japanese government.

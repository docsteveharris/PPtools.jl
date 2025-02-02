module ConceptCodes

"""
Common procedure codes from bronze database
```sql
SELECT
	 mo.proc_name
	,mo.proc_code 
	,count() n
FROM micro_orders mo
group by mo.proc_name, mo.proc_code
order by n desc
```
"""
const proc_codes = (
    urine_culture = "LAB10315"::String,
    blood_culture = "LAB10228"::String,
    beta_d_glucan = "LAB10150"::String,
    galactomannan = "LAB11481"::String,
    legionella_urinary_antigen = "LAB10236"::String,
    pneumococcal_urinary_antigen = "LAB10238"::String,
    blood_culture_paeds_bottle = "LAB10151"::String,
)

end # end of module
SELECT * FROM zip_year;

SELECT * FROM regression_2018;

ALTER TABLE zip_year ADD PRIMARY KEY (zipcode, latest_saleyear);

ALTER TABLE regression_2018
    ADD CONSTRAINT fk_regression_zip FOREIGN KEY (zipcode, latest_saleyear) REFERENCES zip_year (zipcode, latest_saleyear);
	
ALTER TABLE regression_2019
    ADD CONSTRAINT fk_regression_zip FOREIGN KEY (zipcode, latest_saleyear) REFERENCES zip_year (zipcode, latest_saleyear);
	
ALTER TABLE regression_2020
    ADD CONSTRAINT fk_regression_zip FOREIGN KEY (zipcode, latest_saleyear) REFERENCES zip_year (zipcode, latest_saleyear);

DROP TABLE IF EXISTS regressionzip_2018, regressionzip_2019, regressionzip_2020, regressionzip_all;

SELECT r.zpid, r."latestPrice", r."numOfBathrooms", r."livingAreaSqFt", r."numOfBedrooms", r."avgSchoolRating", r."numOfStories", r."MedianStudentsPerTeacher", r."numOfHighSchools", r."longitude", r."numOfPrimarySchools", r."avgSchoolDistance", r."latitude", r."lotSizeSqFt", r."numOfPhotos", r."numPriceChanges", r."zipcode", r."propertyTaxRate", r."latest_saledate", r."latest_salemonth", r."latest_saleyear", z."averagePrice"
	INTO regressionzip_2018
    FROM regression_2018 AS r
	LEFT JOIN zip_year AS z
	ON (r.zipcode = z.zipcode) AND (r.latest_saleyear = z.latest_saleyear);
	
SELECT r.zpid, r."latestPrice", r."numOfBathrooms", r."livingAreaSqFt", r."numOfBedrooms", r."avgSchoolRating", r."numOfStories", r."MedianStudentsPerTeacher", r."numOfHighSchools", r."longitude", r."numOfPrimarySchools", r."avgSchoolDistance", r."latitude", r."lotSizeSqFt", r."numOfPhotos", r."numPriceChanges",  r."zipcode", r."propertyTaxRate", r."latest_saledate", r."latest_salemonth", r."latest_saleyear", z."averagePrice"
	INTO regressionzip_2019
    FROM regression_2019 AS r
	LEFT JOIN zip_year AS z
	ON (r.zipcode = z.zipcode) AND (r.latest_saleyear = z.latest_saleyear);
	
SELECT r.zpid, r."latestPrice", r."numOfBathrooms", r."livingAreaSqFt", r."numOfBedrooms", r."avgSchoolRating", r."numOfStories", r."MedianStudentsPerTeacher", r."numOfHighSchools", r."longitude", r."numOfPrimarySchools", r."avgSchoolDistance", r."latitude", r."lotSizeSqFt", r."numOfPhotos", r."numPriceChanges", r."zipcode", r."propertyTaxRate", r."latest_saledate", r."latest_salemonth", r."latest_saleyear", z."averagePrice"
	INTO regressionzip_2020
    FROM regression_2020 AS r
	LEFT JOIN zip_year AS z
	ON (r.zipcode = z.zipcode) AND (r.latest_saleyear = z.latest_saleyear);
	
SELECT r.zpid, r."latestPrice", r."numOfBathrooms", r."livingAreaSqFt", r."numOfBedrooms", r."avgSchoolRating", r."numOfStories", r."MedianStudentsPerTeacher", r."numOfHighSchools", r."longitude", r."numOfPrimarySchools", r."avgSchoolDistance", r."latitude", r."lotSizeSqFt", r."numOfPhotos", r."numPriceChanges", r."zipcode", r."propertyTaxRate", r."latest_saledate", r."latest_salemonth", r."latest_saleyear", z."averagePrice"
	INTO regressionzip_all
    FROM regression_all AS r
	LEFT JOIN zip_year AS z
	ON (r.zipcode = z.zipcode) AND (r.latest_saleyear = z.latest_saleyear);
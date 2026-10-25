create or replace database NESTLE_PROCUREMENT_DB;

create or replace schema NESTLE_PROCUREMENT_DB.RAW;

create or replace secret git_nestle_example_1
type = password
username = 'nizammuslim'
password = ''; -- developer option git secret api token password



create or replace api integration my_api_intergration_nestle
api_provider = git_https_api
api_allowed_prefixes = ('https://github.com/')
allowed_authentication_secrets = (git_nestle_example_1)
enabled = true;



-- create or replace git repository 
-- origin = ''

CREATE or replace GIT REPOSITORY Nestle_Procurement_Analytics_Modernization 
	ORIGIN = 'https://github.com/nizammuslim/Nestle_Procurement_Analytics_Modernization.git' 
	API_INTEGRATION = 'MY_API_INTERGRATION_1' 
	GIT_CREDENTIALS = 'NESTLE_PROCUREMENT_DB.RAW.GIT_SECRET_EXAMPLE_1' 
	COMMENT = 'this is testing purpose';
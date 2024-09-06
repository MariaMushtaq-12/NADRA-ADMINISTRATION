#CREATE SCHEMA nadra_data
use nadra_data;
create table employee
(
employee_id int primary key,
employee_name varchar(45),
employee_job varchar(45),
office_id int,
office_address varchar(45)
);
create table office
(
office_id int primary key,
office_address varchar(45)
);
create table district_table
(
district varchar(45) primary key,
province varchar(45)
);
create table city_table 
(
city varchar(45) primary key,
district varchar(45)
);
create table child
(
child_name varchar(45) not null,
child_id varchar(45) primary key,
cnic varchar(45) not null,
cnic_no varchar(45)not null
);
create table male
(
cnic varchar(45) primary key,
gender varchar(45) ,
first_name varchar(45),
last_name varchar(45),
father_id varchar(45) not null,
DoB varchar(45) not null,
city_name varchar(45),
district_name varchar(45),
address varchar(45),
martial_status varchar(45)
);
create table female
(
cnic_no varchar(45) primary key,
gender varchar(45) ,
first_name varchar(45),
last_name varchar(45),
father_id varchar(45) not null,
husband_id varchar(45) not null,
DoB varchar(45) not null,
city varchar(45),
district_nme varchar(45),
address varchar(45),
martial_status varchar(45)
);
create table card_details
(
card_no varchar(45) primary key,
issue_date varchar(45),
expiry_date varchar(45),
barcode_number varchar(45)
);
create table sys_admin
(
admin_id varchar(45) primary key,
admin_name varchar(45) not null,
admin_role varchar(45) not null,
admin_password int not null,
employee_id int
);
insert into nadra_data.district_table(district,province)
value("Sargodha","Punjab"),("Lahore","Punjab"),("Sialkot","Punjab"),("Multan","Punjab"),("Jhung","Punjab"),("Mianwali","Punjab"),("Gujranwala","Punjab"),("Layyah","Punjab"),
("Faislabad","Punjab"),("Karachi","sindh"),("Hyderabad","Sindh"),("Peshawar","kpk"),("Dera ismail khan","kpk"),("Quetta","Balochistan"),("sibbi","Balochistan"),("Muzafarrabad","Kashmir"),("Hattian","Kashmir"),
("Rawalakot","Kashmir"),("Swat","kpk"),("shangla","kpk");
use nadra_data;
insert into city_table(city,district)
value("Bhalwal","Sargodha"),("Kotmomin","Sargodha"),("Bhera","Sargodha"),("Loralai","Lahore"),("Model_town","Lahore"),("Pasrur","Sialkot"),("daska","Sialkot"),("raya","Sialkot"),("jalalpur","Multan"),("shujabad","Multan"),
("shorkot","Jhung"),("chiniot","Jhung"),("isakhel","Mianwali"),("piplan","Mianwali"),("Kamoke","Gujranwala"),("virka","Gujranwala"),("chaubara","Layyah"),("karor","Layyah"),("chak_jhumra","Faislabad"),("kakakhel","Peshawar"),
("patika","Muzafarrabad"),("chikkar","Hattian"),("charbagh","Swat"),("alpuri","shangla");
use nadra_data;
insert into male(cnic,gender,first_name,last_name,father_id,DoB,city_name,district_name,address,martial_status)
value("3840115513167","male","SHARJEEL","RASIB","3840102176855","17-09-2001","Bhalwal","Sargodha","satellite town","single"),
("3840183402513","male","SAQIB "," SHEHZAD","6110155644443","17-08-2000","Kotmomin","Sargodha","satellite town","single"),
("3310422417271","male","GHULAM","AKBER","6110196801999","12-01-2000","Bhera","Sargodha","town","Married"),
("3840368269761","male","SHAHID","MEHMOOD","3450235902491","13-03-2000","Loralai","Lahore","town","single"),
("3120472075231","male","MUHAMMAD","JAHANGIR","3740540385345","13-03-2000","Model_town","Lahore","town","Married"),
("3410487365297","male","MUHAMAD","IRSHAD","6110124720253","15-04-2000","Pasrur","Sialkot","town","Married"),
("3120121284487","male","ABU","SUFIYAN","6110183532167","21-04-2000","daska","Sialkot","town","single"),
("3410149280615","male","SADIQ","IBRAHIM","6110174887481","23-07-2000","raya","Sialkot","town","Married"),
("4220184323484","male","HAFIZ","YASIR","6110119530233","01-02-2000","jalalpur","Multan","town","Married"),
("3540219864417","male","ASHIQ ","HUSSAIN","6110117753069 ","19-01-2000","shujabad","Multan","town","single"),
("3820184228039","male","AMJAD","SHAH","2110379891907","10-09-2000","shorkot","Jhung","town","single"),
("3310250475255","male","SAEED","QAISAR","1120122897089","23-02-2000","chiniot","Jhung","town","Married"),
("4240140532279","male","IJAZ","MUSA","6110150942863","30-05-2000","isakhel","Mianwali","town","Married"),
("1730115736137","male","AMEEN","MASHI","6110182614183","27-02-2000","piplan","Mianwali","town","single"),
("3620223838961","male","LIAQAT","ALI","6110118920737 ","28-01-2000","Kamoke","Gujranwala","town","Married"),
("3310415277613","male","SIKANDAR","SHERWAN","4220186754671","08-02-2000","virka","Gujranwala","town","single"),
("3120450312831","male","FURRAKH","AKRAM","6110155870855 ","05-09-2000","chaubara","Layyah","town","Married"),
("3710117083943","male","EHAB","ARSHAD","3740354191385","03-05-2000","karor","Layyah","town","Married"),
("3420105598651","male","IRFAN","MASOOD","8220375074283","06-06-2000","chak_jhumra","Faislabad","town","single"),
("3660187467895","male","ARBAB","IFTIKHAR","8220311845769","10-02-2000","kakakhel","Peshawar","town","Married");
use nadra_data;
insert into female(cnic_no,gender,first_name,last_name,father_id,husband_id,DoB,city,district_nme,address,martial_status)
value("6110182601376","female","MARIA","MUSHTAQ","3840102176853","NULL","22-02-2001","chikkar","Hattian","satellite town","single"),
("3840183402512","female","ABIR "," AAYAN","6110155644441","NULL","12-08-2000","Kotmomin","Sargodha","satellite town","single"),
("3310422417274","female","AFIFA","BILAL","6110196801995","3310422417271","11-01-2000","Bhera","Sargodha","town","Married"),
("3840368269766","female","AIZA","DANISH","3450235902493","NULL","14-03-2000","Loralai","Lahore","town","single"),
("3120472075238","female","ALEENA","DANIYAL","3740540385341","3120472075231","10-03-2000","Model_town","Lahore","town","Married"),
("3410487365290","female","AMARA","FAHAD","6110124720257","3410487365297","19-04-2000","Pasrur","Sialkot","town","Married"),
("3120121284480","female","ALISHBA","SUFIYAN","6110183532169","NULL","27-04-2000","daska","Sialkot","town","single"),
("3410149280612","female","BISMA","FAISAL","6110174887483","3410149280615","21-07-2000","raya","Sialkot","town","Married"),
("4220184323486","female","BUSHRA","HAIDER","6110119530235","4220184323484","09-02-2000","jalalpur","Multan","town","Married"),
("3540219864416","female","ESHAAL ","HUSSAIN","6110117753067 ","NULL","12-01-2000","shujabad","Multan","town","single"),
("3820184228036","female","FAIZA","SHAH","2110379891909","NULL","11-09-2000","shorkot","Jhung","town","single"),
("3310250475258","female","FARAH","HASEEB","1120122897081","3310250475255","29-02-2000","chiniot","Jhung","town","Married"),
("4240140532270","female","FAREEHA","MUSA","6110150942867","4240140532279","31-05-2000","isakhel","Mianwali","town","Married"),
("1730115736138","female","FATIMA","IRFAN","6110182614185","NULL","21-02-2000","piplan","Mianwali","town","single"),
("3620223838962","female","INAYA","ALI","6110118920739 ","3620223838961","22-01-2000","Kamoke","Gujranwala","town","Married"),
("3310415277614","female","IQRA","KAMRAN","4220186754671","NULL","01-02-2000","virka","Gujranwala","town","single"),
("3120450312832","female","JAWARIA","MAAZ","6110155870857 ","3120450312831","09-09-2000","chaubara","Layyah","town","Married"),
("3710117083942","female","LAIBA","MEERAB","3740354191389","3710117083943","02-05-2000","karor","Layyah","town","Married"),
("3420105598656","female","MAHNOOR","MASOOD","8220375074287","NULL","08-06-2000","chak_jhumra","Faislabad","town","single"),
("3660187467890","female","MAHEEN","RASHID","8220311845761","3660187467895","19-02-2000","kakakhel","Peshawar","town","Married");
use nadra_data;
insert into child(child_name,child_id,cnic_no,cnic)
value("RAYAN","6110139348779","3310422417274","3310422417271"),
("RIDWAN","6110160630827","3120472075238","3120472075231"),
("ROHAAN","3740580019297","3410487365290","3410487365297"),
("OWAIS","3740306626817","3410149280612","3410149280615"),
("LARAIB","1620107001975","4220184323486","4220184323484"),
("RASHID","3740504598849 ","3310250475258","3310250475255"),
("SHAHZAIB","3650118200049 ","4240140532270","4240140532279"),
("USAMA","6110179351509","3620223838962","3620223838961"),
("WAQAS","3740529827357","3120450312832","3120450312831"),
("ZAIN","3740593976143","3710117083942","3710117083943");
use nadra_data;
insert into card_details(card_no,issue_date,expiry_date,barcode_number)
value("3310422417271","10-04-2015","10-04-2025","893437927374"),
("3120472075231","12-06-2015","12-06-2025","893437928474"),
("3410487365297","13-04-2018","13-04-2028","893437927389"),
("3410149280615","20-02-2014","20-02-2024","823437927374"),
("4220184323484","21-01-2016","21-01-2026","893437911374"),
("3310250475258","28-04-2013","28-04-2023","233437927374"),
("4240140532270","12-07-2014","12-07-2024","193437927874"),
("3620223838962","12-02-2015","12-02-2025","293437927373"),
("3120450312832","04-09-2016","04-09-2026","893347927374"),
("3710117083942","26-02-2013","26-02-2013","293437927371");
use nadra_data;
insert into office(office_id,office_address)
value(01,"nadra office main branch faizabad"),(02,"nadra office main branch faizabad"),(03,"nadra office main branch faizabad"),(04,"nadra office main branch faizabad"),(05,"nadra office main branch faizabad"),
(06,"nadra office main branch faizabad"),(07,"nadra office main branch faizabad"),(08,"nadra office main branch faizabad"),(09,"nadra office main branch faizabad"),(10,"nadra office main branch faizabad");
use nadra_data;
insert into employee(employee_id,employee_name,employee_job,office_id,office_address)
value(101,"ahmad","sanitary worker",01,"nadra office main branch faizabad"),(102,"mohsin","sanitary worker",02,"nadra office main branch faizabad"),
(03,"lala","security guard",03,"nadra office main branch faizabad"),(104,"majid","call operator",04,"nadra office main branch faizabad"),
(105,"saba","naib qasid",05,"nadra office main branch faizabad"),(106,"zainab","naib qasid",06,"nadra office main branch faizabad"),
(107,"kashaf","worker",07,"nadra office main branch faizabad"),(108,"saleem","register executive",08,"nadra office main branch faizabad"),
(109,"huzaifa","worker",09,"nadra office main branch faizabad"),(110,"tehreem","cleaner",10,"nadra office main branch faizabad");
use nadra_data;
insert into sys_admin(admin_id,admin_name,admin_role,admin_password,employee_id)
value("6b34f","maria mushtaq","chairman",1234,101),("2a34f","sharjeel","vice chairman",2341,102),("6c32g","registrar manager","chairman",6574,03),("3f34f","tehreem","Accountant",9475,104),
("6bjef","ubaid","record manager",8594,105),("3kn4f","asif","record manager",94837,106),("34n4f","deputy manager","chairman",5844,107),("6b4ff","saima","deputy manager",5344,108),
("6bj34","rabia","Associate manager",9348,109),("n45k5","hareem","staff manager",4445,110)


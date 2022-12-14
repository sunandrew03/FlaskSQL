CREATE 'classicmodels';
USE `classicmodels`;

grant all privileges on classicmodels.* to 'webapp'@'%';
flush privileges;


CREATE TABLE employee (
    employeeID INT AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(30) NOT NULL,
    email VARCHAR(40) NOT NULL,
    phone INTEGER NOT NULL,
    fax INTEGER,
    PRIMARY KEY (employeeID)
);

CREATE TABLE customer (
    customerID INT AUTO_INCREMENT NOT NULL,
    firstName VARCHAR(20) NOT NULL,
    lastName VARCHAR(30) NOT NULL,
    email VARCHAR(40) NOT NULL,
    phone INTEGER NOT NULL,
    fax INTEGER,
    address VARCHAR(30) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(20) NOT NULL,
    country VARCHAR(20) NOT NULL,
    postalCode INTEGER NOT NULL,
    assignedRep INT,
    PRIMARY KEY (customerID),
    FOREIGN KEY (customerID) REFERENCES employee (employeeID)
);

CREATE TABLE sale (
    saleID INT AUTO_INCREMENT NOT NULL,
    time DATETIME DEFAULT CURRENT_TIMESTAMP,
    customerID VARCHAR(20),
    PRIMARY KEY (saleID)
);

CREATE TABLE item (
    itemID INT AUTO_INCREMENT NOT NULL,
    price INT NOT NULL,
    quantity INT NOT NULL,
    stockID INT NOT NULL,
    PRIMARY KEY (itemID),
    FOREIGN KEY (itemID) REFERENCES sale (saleID)
    ON UPDATE cascade ON DELETE restrict,
    FOREIGN KEY (stockID) REFERENCES stock (stockID)
    ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE stock (
    stockID INT AUTO_INCREMENT NOT NULL,
    ticker VARCHAR(10) NOT NULL,
    name VARCHAR(30) NOT NULL,
    sectorID INT NOT NULL,
    exchangeID INT NOT NULL,
    PRIMARY KEY (stockID),
    FOREIGN KEY (sectorID) REFERENCES sector (sectorID)
    ON UPDATE cascade ON DELETE restrict,
    FOREIGN KEY (exchangeID) REFERENCES exchange (exchangeID)
    ON UPDATE cascade ON DELETE restrict
);

CREATE TABLE sector (
    sectorID INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(20) NOT NULL,
    PRIMARY KEY (sectorID)
);

CREATE TABLE exchange (
    exchangeID INT AUTO_INCREMENT NOT NULL,
    name VARCHAR(10) NOT NULL,
    PRIMARY KEY (exchangeID)
);

insert into employee (employeeID, firstName, lastName, email, phone, fax) values (1, 'Matilde', 'Goodwyn', 'mgoodwyn0@ed.gov', '431-730-9660', '4891982594');
insert into employee (employeeID, firstName, lastName, email, phone, fax) values (2, 'Edithe', 'De Mars', 'edemars1@godaddy.com', '754-429-4483', '8351452289');
insert into employee (employeeID, firstName, lastName, email, phone, fax) values (3, 'Mahalia', 'Barbery', 'mbarbery2@indiegogo.com', '410-682-7163', '3135023699');
insert into employee (employeeID, firstName, lastName, email, phone, fax) values (4, 'Clyve', 'Dawidowsky', 'cdawidowsky3@guardian.co.uk', '843-805-7521', '4838421796');
insert into employee (employeeID, firstName, lastName, email, phone, fax) values (5, 'Mariska', 'Tocknell', 'mtocknell4@blogtalkradio.com', '510-809-9037', '8730610567');
insert into employee (employeeID, firstName, lastName, email, phone, fax) values (6, 'Davon', 'Ruckert', 'druckert5@reddit.com', '721-722-8820', '1939344530');
insert into employee (employeeID, firstName, lastName, email, phone, fax) values (7, 'Winona', 'Vossgen', 'wvossgen6@deviantart.com', '841-572-6562', '0149710992');
insert into employee (employeeID, firstName, lastName, email, phone, fax) values (8, 'Taber', 'Shaul', 'tshaul7@t.co', '765-809-4655', '5517237673');
insert into employee (employeeID, firstName, lastName, email, phone, fax) values (9, 'Prudy', 'Priddle', 'ppriddle8@baidu.com', '698-375-9552', '5546952431');
insert into employee (employeeID, firstName, lastName, email, phone, fax) values (10, 'Vale', 'Labat', 'vlabat9@webnode.com', '425-493-6513', '7930019160');
insert into employee (employeeID, firstName, lastName, email, phone, fax) values (11, 'Smitty', 'Langstone', 'slangstonea@whitehouse.gov', '299-499-3211', '2387601955');
insert into employee (employeeID, firstName, lastName, email, phone, fax) values (12, 'Sonny', 'Franzel', 'sfranzelb@intel.com', '336-272-5466', '4010882379');
insert into employee (employeeID, firstName, lastName, email, phone, fax) values (13, 'Stoddard', 'Sanchez', 'ssanchezc@wikimedia.org', '554-174-2069', '0225177536');
insert into employee (employeeID, firstName, lastName, email, phone, fax) values (14, 'Taryn', 'Gilks', 'tgilksd@scribd.com', '693-501-3715', '3952475947');
insert into employee (employeeID, firstName, lastName, email, phone, fax) values (15, 'Egan', 'Burborough', 'eburboroughe@imdb.com', '868-271-0968', '2728689784');
insert into employee (employeeID, firstName, lastName, email, phone, fax) values (16, 'Judi', 'Sympson', 'jsympsonf@constantcontact.com', '889-468-6691', '6393933542');
insert into employee (employeeID, firstName, lastName, email, phone, fax) values (17, 'Claudio', 'Rickford', 'crickfordg@jiathis.com', '538-664-5485', '5359217383');
insert into employee (employeeID, firstName, lastName, email, phone, fax) values (18, 'Harlene', 'Klink', 'hklinkh@blogger.com', '128-280-6114', '9597833395');
insert into employee (employeeID, firstName, lastName, email, phone, fax) values (19, 'Madeline', 'O'' Scallan', 'moscallani@bloglovin.com', '323-233-8150', '5223990218');
insert into employee (employeeID, firstName, lastName, email, phone, fax) values (20, 'Inness', 'Brooksbank', 'ibrooksbankj@tripod.com', '681-378-2980', '6129697635');

insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (1, 'Estrella', 'Romushkin', 'eromushkin0@un.org', '136-133-8892', '7297104167', '27293 Pankratz Junction', 'Dachnoye', null, 'Russia', '422156', 1);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (2, 'Archer', 'Bodd', 'abodd1@moonfruit.com', '878-168-3680', '9267578650', '85 Fair Oaks Terrace', 'Fort Macleod', 'Alberta', 'Canada', 'V6S', 18);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (3, 'Pennie', 'Lillecrop', 'plillecrop2@canalblog.com', '756-996-6988', '3382493195', '191 Becker Alley', 'Opatov', null, 'Czech Republic', '675 28', 9);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (4, 'Lauren', 'Sedgeworth', 'lsedgeworth3@wikimedia.org', '436-817-9458', '7655137854', '3120 Novick Lane', 'Yanahuanca', null, 'Peru', null, 8);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (5, 'Harriette', 'Lorain', 'hlorain4@over-blog.com', '968-699-7984', '1292749814', '55 Rigney Terrace', 'Changgang', null, 'China', null, 3);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (6, 'Marcello', 'Kobes', 'mkobes5@gizmodo.com', '800-121-3674', '0913167681', '4300 Nancy Plaza', 'Leiria', 'Leiria', 'Portugal', '2400-013', 13);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (7, 'Alejandra', 'Everitt', 'aeveritt6@skype.com', '814-263-8741', '9682274966', '108 Arizona Avenue', 'Faranah', null, 'Guinea', null, 1);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (8, 'Lorrin', 'Rosel', 'lrosel7@sakura.ne.jp', '598-781-9564', '2533873497', '193 Golden Leaf Trail', 'Cikole', null, 'Indonesia', null, 11);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (9, 'Teddy', 'Deinhard', 'tdeinhard8@people.com.cn', '421-570-4776', '1413684661', '17 Declaration Place', 'Voznesenskaya', null, 'Russia', '352537', 12);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (10, 'Beth', 'Tandy', 'btandy9@businesswire.com', '872-797-7326', '9891236625', '139 Rigney Lane', 'Rive-de-Gier', 'Rhône-Alpes', 'France', '42809 CEDEX', 8);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (11, 'Karlens', 'Kevern', 'kkeverna@hao123.com', '796-738-4469', '1986999815', '5 John Wall Trail', 'Ketampak', null, 'Indonesia', null, 16);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (12, 'Arabele', 'Rorke', 'arorkeb@dailymail.co.uk', '566-210-4856', '6631410452', '84920 Troy Terrace', 'Pontal', null, 'Brazil', '14180-000', 12);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (13, 'Korey', 'Sivewright', 'ksivewrightc@nationalgeographic.com', '446-951-8313', '1910479160', '4318 Bunker Hill Street', 'Cascais', 'Lisboa', 'Portugal', '2750-099', 6);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (14, 'Geno', 'Boays', 'gboaysd@list-manage.com', '386-303-1029', '5360916729', '364 Melby Pass', 'Sharm el-Sheikh', null, 'Egypt', null, 16);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (15, 'Bartholomeus', 'Hounsom', 'bhounsome@ezinearticles.com', '176-953-8430', '0332923088', '9 Sauthoff Place', 'Muyinga', null, 'Burundi', null, 15);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (16, 'Lauren', 'Krysiak', 'lkrysiakf@simplemachines.org', '645-129-6276', '3099246077', '327 Kennedy Drive', 'Chowki Jamali', null, 'Pakistan', '80401', 8);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (17, 'Madalyn', 'Eite', 'meiteg@kickstarter.com', '700-579-3196', '6174106411', '42 Norway Maple Place', 'Quận Phú Nhuận', null, 'Vietnam', null, 7);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (18, 'Madlin', 'Jackways', 'mjackwaysh@stumbleupon.com', '269-264-2788', '5927310478', '076 Pleasure Court', 'Huatajata', null, 'Bolivia', null, 14);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (19, 'Aida', 'Joyce', 'ajoycei@sbwire.com', '705-205-8673', '2913620728', '282 Donald Place', 'Getazat', null, 'Armenia', null, 18);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (20, 'Onofredo', 'Scuffham', 'oscuffhamj@nih.gov', '599-118-4057', '8584957464', '09604 Milwaukee Crossing', 'Huanfeng', null, 'China', null, 9);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (21, 'Lura', 'Gobourn', 'lgobournk@seattletimes.com', '199-998-7511', '0596743696', '32 Stone Corner Place', 'San Ramon', null, 'Philippines', '4425', 3);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (22, 'Tatiana', 'Plimmer', 'tplimmerl@china.com.cn', '637-438-7810', '0881963577', '36 Fairfield Avenue', 'Yanghong', null, 'China', null, 4);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (23, 'Trumann', 'Blakden', 'tblakdenm@tamu.edu', '357-824-7022', '7120811436', '3 Homewood Avenue', 'Czernice Borowe', null, 'Poland', '06-415', 3);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (24, 'Hy', 'Casaletto', 'hcasaletton@ca.gov', '300-351-8014', '5124685573', '383 Delladonna Circle', 'Oymak', null, 'China', null, 9);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (25, 'Shawn', 'Halsho', 'shalshoo@live.com', '643-285-4531', '3040170368', '400 Cascade Avenue', 'Uvarovka', null, 'Russia', '303842', 1);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (26, 'Mada', 'Cowthard', 'mcowthardp@hostgator.com', '990-669-6361', '2368497552', '36269 Golden Leaf Junction', 'Kontagora', null, 'Nigeria', null, 13);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (27, 'Milena', 'Queyos', 'mqueyosq@moonfruit.com', '786-966-8142', '9007202723', '6 Grasskamp Plaza', 'Manabo', null, 'Philippines', '2810', 19);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (28, 'Alyss', 'Hackworthy', 'ahackworthyr@usda.gov', '970-172-0607', '7140943125', '36 Gina Plaza', 'Larap', null, 'Philippines', '1748', 6);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (29, 'Lois', 'Borres', 'lborress@deviantart.com', '566-681-6617', '6008733940', '576 Hazelcrest Crossing', 'Plei Kần', null, 'Vietnam', null, 11);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (30, 'Kearney', 'Swannell', 'kswannellt@newsvine.com', '138-958-2046', '0411976990', '85 Ramsey Crossing', 'Sīrīs', null, 'Palestinian Territory', null, 11);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (31, 'Kerry', 'Gumme', 'kgummeu@google.es', '938-401-0430', '8362095423', '53 Londonderry Center', 'Kiambu', null, 'Kenya', null, 11);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (32, 'Cordula', 'Plues', 'cpluesv@cnn.com', '905-455-5560', '7680674728', '6012 Luster Parkway', 'Kedungharjo', null, 'Indonesia', null, 4);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (33, 'Sara', 'Boakes', 'sboakesw@marriott.com', '276-326-3178', '9963971393', '8352 Scofield Parkway', 'Guilin', null, 'China', null, 17);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (34, 'Reilly', 'Czyz', 'rczyzx@princeton.edu', '539-169-7123', '8490065543', '773 Maple Drive', 'Richard-Toll', null, 'Senegal', null, 8);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (35, 'Early', 'Chasmoor', 'echasmoory@time.com', '467-423-2383', '5706566917', '0687 Toban Crossing', 'Sukasetia', null, 'Indonesia', null, 10);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (36, 'Woody', 'Blakeley', 'wblakeleyz@huffingtonpost.com', '735-498-8940', '8695228622', '6650 Tennyson Center', 'Bálsamo Oriental', null, 'Honduras', null, 9);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (37, 'Abeu', 'McMeyler', 'amcmeyler10@amazon.co.uk', '617-657-6990', '9357806520', '72 Hintze Hill', 'Zhob', null, 'Pakistan', '85200', 2);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (38, 'Burlie', 'Elphey', 'belphey11@scientificamerican.com', '435-320-3924', '0992775604', '94 Pawling Hill', 'Karjalohja', null, 'Finland', '09120', 13);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (39, 'Cornall', 'Yurinov', 'cyurinov12@sun.com', '924-727-7774', '1575859750', '89366 Reindahl Junction', 'Tugulym', null, 'Russia', '623650', 20);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (40, 'Kandace', 'Benda', 'kbenda13@cdc.gov', '421-440-8905', '1296615138', '3 Mesta Way', 'Bromma', 'Stockholm', 'Sweden', '167 31', 19);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (41, 'Chandal', 'McDade', 'cmcdade14@addtoany.com', '515-291-8093', '9109428518', '85 Gina Road', 'Pavlovskaya', null, 'Russia', '353147', 8);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (42, 'Felicity', 'Petrecz', 'fpetrecz15@marketwatch.com', '757-137-7164', '5563946223', '3 Comanche Junction', 'Kandun', null, 'China', null, 3);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (43, 'Kalina', 'Tollerfield', 'ktollerfield16@sohu.com', '823-735-9666', '5957071919', '2 Ludington Circle', 'Burao', null, 'Somalia', null, 9);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (44, 'Pedro', 'Seide', 'pseide17@newsvine.com', '319-641-2373', '2398886719', '492 Hanover Terrace', 'Cilimus Kulon', null, 'Indonesia', null, 15);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (45, 'Kalil', 'Senogles', 'ksenogles18@rambler.ru', '851-651-4809', '9547284290', '6414 Thompson Point', 'Wolanów', null, 'Poland', '26-625', 7);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (46, 'Madlin', 'Highton', 'mhighton19@behance.net', '982-779-3139', '0582465516', '33 Ridgeview Point', 'Bayanan', null, 'Philippines', '5200', 9);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (47, 'Margarita', 'Dirkin', 'mdirkin1a@nyu.edu', '949-148-5655', '1521156603', '17 Rutledge Plaza', 'Geshan', null, 'China', null, 4);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (48, 'Dewain', 'Monteath', 'dmonteath1b@hud.gov', '189-152-0077', '7107051237', '2123 Florence Drive', 'Mojolampir', null, 'Indonesia', null, 18);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (49, 'Galen', 'Bett', 'gbett1c@pen.io', '423-525-5735', '5044870366', '168 Talisman Center', 'Gotovlje', null, 'Slovenia', '3310', 14);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (50, 'Danie', 'Bare', 'dbare1d@hibu.com', '272-578-8731', '7902271403', '261 Raven Court', 'Samdrup Jongkhar', null, 'Bhutan', null, 4);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (51, 'Salem', 'Vasquez', 'svasquez1e@msn.com', '628-487-8201', '5092698233', '132 Beilfuss Trail', 'Gifu-shi', null, 'Japan', '504-0968', 1);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (52, 'Anna-diane', 'Perigoe', 'aperigoe1f@flickr.com', '263-618-6643', '9143453309', '3 Jenifer Lane', 'Waitenepang', null, 'Indonesia', null, 19);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (53, 'Annetta', 'Eadon', 'aeadon1g@pen.io', '164-139-7965', '1360672702', '305 Rutledge Court', 'Mazongshan', null, 'China', null, 20);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (54, 'Olvan', 'Jachtym', 'ojachtym1h@tinyurl.com', '803-428-2993', '2714491723', '85 Swallow Terrace', 'Nantai', null, 'China', null, 18);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (55, 'Milicent', 'Vertey', 'mvertey1i@is.gd', '991-122-2573', '2760630714', '752 Prairie Rose Place', 'Yutan', null, 'China', null, 8);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (56, 'Cherri', 'Hutchens', 'chutchens1j@hubpages.com', '789-448-6417', '9595364363', '726 Reinke Alley', 'Betio Village', null, 'Kiribati', null, 11);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (57, 'Mortie', 'Pexton', 'mpexton1k@shop-pro.jp', '309-140-0280', '8288833446', '97 Prairie Rose Place', 'Qiankou', null, 'China', null, 2);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (58, 'Barbabas', 'Greenman', 'bgreenman1l@miitbeian.gov.cn', '877-989-2448', '7936284788', '0 Mcbride Lane', 'Juan de Acosta', null, 'Colombia', '081048', 10);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (59, 'Bertrand', 'Gerant', 'bgerant1m@reuters.com', '588-354-1380', '7679616140', '930 Lerdahl Avenue', 'Árta', null, 'Greece', null, 9);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (60, 'Lyda', 'Edmeads', 'ledmeads1n@liveinternet.ru', '948-917-1678', '5074693195', '18 Columbus Trail', 'Uhryniv', null, 'Ukraine', null, 17);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (61, 'Lela', 'Iacavone', 'liacavone1o@blog.com', '600-819-0899', '8109670466', '1643 Mockingbird Trail', 'Bilshivtsi', null, 'Ukraine', null, 1);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (62, 'Ware', 'Hillyatt', 'whillyatt1p@bravesites.com', '537-853-3276', '3701148368', '0 Rutledge Way', 'Zaječar', null, 'Serbia', null, 11);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (63, 'Robb', 'Vequaud', 'rvequaud1q@mail.ru', '490-576-3088', '7222136282', '16240 Troy Crossing', 'Delgerhaan', null, 'Mongolia', null, 10);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (64, 'Susann', 'Romei', 'sromei1r@census.gov', '296-783-3168', '6935371244', '64 Quincy Terrace', 'Kašina', null, 'Croatia', '10362', 17);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (65, 'Barry', 'Farman', 'bfarman1s@indiatimes.com', '646-422-2731', '1043920552', '07185 Wayridge Circle', 'Sawara', null, 'Japan', '811-1122', 6);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (66, 'Bayard', 'Merioth', 'bmerioth1t@simplemachines.org', '249-965-7674', '9284849802', '6066 Monument Parkway', 'Coelho Neto', null, 'Brazil', '65620-000', 13);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (67, 'Konstanze', 'Glynne', 'kglynne1u@photobucket.com', '599-133-3562', '7661773759', '53473 Jenifer Road', 'Saari', null, 'Finland', '59511', 17);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (68, 'Keen', 'Wiszniewski', 'kwiszniewski1v@disqus.com', '198-926-1804', '5938802601', '258 Brentwood Plaza', 'Baumata', null, 'Indonesia', null, 13);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (69, 'Tandy', 'Keling', 'tkeling1w@bigcartel.com', '811-983-0275', '0815680996', '28 Arizona Park', 'Patong', null, 'Philippines', '6423', 14);
insert into customer (customerID, firstName, lastName, email, phone, fax, address, city, state, country, postalCode, assignedRep) values (70, 'Shellie', 'Zoren', 'szoren1x@webs.com', '871-542-1097', '9175041480', '11 Stoughton Court', 'Songshan', null, 'China', null, 8);


insert into sale (saleID, time) values (1, '2022-04-09 07:05:49', 2);
insert into sale (saleID, time) values (2, '2022-09-26 14:44:48', 2);
insert into sale (saleID, time) values (3, '2022-07-17 21:57:52', 3);
insert into sale (saleID, time) values (4, '2022-07-30 21:46:50', 2);
insert into sale (saleID, time) values (5, '2022-01-28 09:29:51', 2);
insert into sale (saleID, time) values (6, '2022-04-04 03:27:57', 8);
insert into sale (saleID, time) values (7, '2022-01-28 03:47:50', 2);
insert into sale (saleID, time) values (8, '2021-12-04 20:59:55', 2);
insert into sale (saleID, time) values (9, '2022-05-08 01:46:28', 5);
insert into sale (saleID, time) values (10, '2022-01-20 16:27:27', 2);
insert into sale (saleID, time) values (11, '2022-08-13 04:09:49', 7);
insert into sale (saleID, time) values (12, '2022-10-20 01:24:37', 2);
insert into sale (saleID, time) values (13, '2021-12-21 02:02:44', 2);
insert into sale (saleID, time) values (14, '2022-07-11 04:29:33', 7);
insert into sale (saleID, time) values (15, '2022-06-06 13:19:34', 2);
insert into sale (saleID, time) values (16, '2022-09-02 17:56:12', 2);
insert into sale (saleID, time) values (17, '2021-12-30 06:53:11', 3);
insert into sale (saleID, time) values (18, '2022-03-17 00:32:11', 10);
insert into sale (saleID, time) values (19, '2022-04-29 06:24:39', 2);
insert into sale (saleID, time) values (20, '2022-11-06 21:57:03', 2);
insert into sale (saleID, time) values (21, '2022-10-05 01:15:10', 2);
insert into sale (saleID, time) values (22, '2021-12-09 14:04:45', 2);
insert into sale (saleID, time) values (23, '2022-05-29 09:12:57', 2);
insert into sale (saleID, time) values (24, '2022-05-06 15:26:08', 2);
insert into sale (saleID, time) values (25, '2021-11-26 19:04:18', 2);
insert into sale (saleID, time) values (26, '2022-10-29 16:47:07', 4);
insert into sale (saleID, time) values (27, '2022-10-05 18:00:23', 2);
insert into sale (saleID, time) values (28, '2022-08-12 21:49:54', 5);
insert into sale (saleID, time) values (29, '2022-02-04 14:27:12', 6);
insert into sale (saleID, time) values (30, '2022-10-09 22:53:28', 2);
insert into sale (saleID, time) values (31, '2022-06-22 23:21:25', 7);
insert into sale (saleID, time) values (32, '2022-08-02 16:27:05', 2);
insert into sale (saleID, time) values (33, '2021-12-26 14:20:47', 3);
insert into sale (saleID, time) values (34, '2022-06-21 23:55:58', 2);
insert into sale (saleID, time) values (35, '2022-06-13 18:09:56', 2);
insert into sale (saleID, time) values (36, '2022-07-18 17:16:53', 2);
insert into sale (saleID, time) values (37, '2022-01-10 11:50:06', 2);
insert into sale (saleID, time) values (38, '2022-07-20 02:48:10', 19);
insert into sale (saleID, time) values (39, '2022-07-13 23:49:53', 2);
insert into sale (saleID, time) values (40, '2022-04-15 17:17:30', 2);
insert into sale (saleID, time) values (41, '2021-11-29 22:32:18', 2);
insert into sale (saleID, time) values (42, '2021-12-16 07:13:31', 2);
insert into sale (saleID, time) values (43, '2022-04-25 03:44:09', 2);
insert into sale (saleID, time) values (44, '2022-08-31 03:21:02', 2);
insert into sale (saleID, time) values (45, '2022-10-15 20:23:17', 2);
insert into sale (saleID, time) values (46, '2021-12-29 10:40:14', 2);
insert into sale (saleID, time) values (47, '2022-07-29 13:46:56', 2);
insert into sale (saleID, time) values (48, '2022-10-13 02:11:05', 2);
insert into sale (saleID, time) values (49, '2022-03-11 04:44:57', 2);
insert into sale (saleID, time) values (50, '2022-10-11 09:25:56', 2);
insert into sale (saleID, time) values (51, '2022-09-16 23:31:20', 2);
insert into sale (saleID, time) values (52, '2022-03-27 17:20:26', 2);
insert into sale (saleID, time) values (53, '2022-03-03 16:24:05', 2);
insert into sale (saleID, time) values (54, '2022-03-13 18:50:12', 2);
insert into sale (saleID, time) values (55, '2022-03-07 01:31:26', 2);
insert into sale (saleID, time) values (56, '2022-05-14 03:38:29', 2);
insert into sale (saleID, time) values (57, '2022-10-11 19:36:44', 2);
insert into sale (saleID, time) values (58, '2022-01-14 14:52:52', 2);
insert into sale (saleID, time) values (59, '2022-05-24 20:47:28', 2);
insert into sale (saleID, time) values (60, '2022-01-20 21:46:00', 10);
insert into sale (saleID, time) values (61, '2022-05-05 21:24:10', 2);
insert into sale (saleID, time) values (62, '2022-09-07 11:34:34', 2);
insert into sale (saleID, time) values (63, '2022-01-10 07:38:17', 2);
insert into sale (saleID, time) values (64, '2022-05-16 04:21:03', 2);
insert into sale (saleID, time) values (65, '2022-03-28 01:00:37', 2);
insert into sale (saleID, time) values (66, '2022-02-05 00:33:42', 2);
insert into sale (saleID, time) values (67, '2021-12-09 13:39:40', 2);
insert into sale (saleID, time) values (68, '2022-10-03 03:21:28', 2);
insert into sale (saleID, time) values (69, '2022-08-07 12:06:13', 2);
insert into sale (saleID, time) values (70, '2022-10-02 03:25:45', 2);
insert into sale (saleID, time) values (71, '2022-10-16 13:28:30', 2);
insert into sale (saleID, time) values (72, '2022-05-12 10:14:48', 2);
insert into sale (saleID, time) values (73, '2022-10-24 23:03:16', 2);
insert into sale (saleID, time) values (74, '2022-07-12 00:04:39', 2);
insert into sale (saleID, time) values (75, '2022-06-27 04:49:02', 2);
insert into sale (saleID, time) values (76, '2022-04-22 14:31:31', 2);
insert into sale (saleID, time) values (77, '2022-01-19 06:59:29', 2);
insert into sale (saleID, time) values (78, '2021-12-15 07:22:51', 2);
insert into sale (saleID, time) values (79, '2022-06-21 22:11:18', 2);
insert into sale (saleID, time) values (80, '2022-09-10 02:35:39', 2);
insert into sale (saleID, time) values (81, '2022-09-10 05:20:09', 2);
insert into sale (saleID, time) values (82, '2022-03-05 00:35:17', 2);
insert into sale (saleID, time) values (83, '2022-11-11 11:44:59', 2);
insert into sale (saleID, time) values (84, '2021-11-25 08:31:30', 2);
insert into sale (saleID, time) values (85, '2022-02-17 13:59:40', 2);
insert into sale (saleID, time) values (86, '2022-06-02 06:18:18', 2);
insert into sale (saleID, time) values (87, '2022-07-23 20:22:34', 2);
insert into sale (saleID, time) values (88, '2022-03-26 12:24:31', 2);
insert into sale (saleID, time) values (89, '2022-08-19 15:13:08', 2);
insert into sale (saleID, time) values (90, '2022-11-05 23:50:48', 2);
insert into sale (saleID, time) values (91, '2022-06-28 07:35:12', 2);
insert into sale (saleID, time) values (92, '2022-09-06 07:01:52', 2);
insert into sale (saleID, time) values (93, '2022-08-30 15:33:56', 2);
insert into sale (saleID, time) values (94, '2022-02-20 08:43:57', 2);
insert into sale (saleID, time) values (95, '2022-05-08 23:26:52', 2);
insert into sale (saleID, time) values (96, '2021-11-26 20:59:04', 2);
insert into sale (saleID, time) values (97, '2022-07-13 22:20:15', 2);
insert into sale (saleID, time) values (98, '2022-09-30 01:41:20', 2);
insert into sale (saleID, time) values (99, '2022-04-30 21:29:42', 2);
insert into sale (saleID, time) values (100, '2022-01-16 13:43:11', 2);

insert into sector (sectorID, name) values (1, 'Healthcare');
insert into sector (sectorID, name) values (2, 'Materials');
insert into sector (sectorID, name) values (3, 'Real Estate');
insert into sector (sectorID, name) values (4, 'Consumer Staples');
insert into sector (sectorID, name) values (5, 'Consumer Discretionary');
insert into sector (sectorID, name) values (6, 'Utilities');
insert into sector (sectorID, name) values (7, 'Energy');
insert into sector (sectorID, name) values (8, 'Industrials');
insert into sector (sectorID, name) values (9, 'Consumer Services');
insert into sector (sectorID, name) values (10, 'Finance');
insert into sector (sectorID, name) values (11, 'Technology');

insert into exchange (exchangeID, name) values (1, 'XNYS');
insert into exchange (exchangeID, name) values (2, 'XNAS');
insert into exchange (exchangeID, name) values (3, 'XSHG');
insert into exchange (exchangeID, name) values (4, 'XAMS');
insert into exchange (exchangeID, name) values (5, 'XBRU');
insert into exchange (exchangeID, name) values (6, 'XMSM');
insert into exchange (exchangeID, name) values (7, 'XLIS');
insert into exchange (exchangeID, name) values (8, 'XMIL');
insert into exchange (exchangeID, name) values (9, 'XOSL');
insert into exchange (exchangeID, name) values (10, 'XPAR');

insert into stock (stockID, ticker, name, sectorID, exchangeID) values (1, 'JNP', 'Juniper Pharmaceuticals, Inc.', 7, 3);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (2, 'EBIO', 'Eleven Biotherapeutics, Inc.', 3, 8);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (3, 'HBANP', 'Huntington Bancshares Incorporated', 7, 3);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (4, 'ASRVP', 'AmeriServ Financial Inc.', 10, 7);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (5, 'GS^K', 'Goldman Sachs Group, Inc. (The)', 9, 1);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (6, 'CUI', 'CUI Global, Inc.', 11, 2);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (7, 'AQN', 'Algonquin Power & Utilities Corp.', 5, 6);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (8, 'PM', 'Philip Morris International Inc', 1, 9);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (9, 'SEDG', 'SolarEdge Technologies, Inc.', 8, 2);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (10, 'UFPI', 'Universal Forest Products, Inc.', 10, 3);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (11, 'AGO^E', 'Assured Guaranty Ltd.', 4, 5);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (12, 'ZB^H', 'Zions Bancorporation', 8, 6);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (13, 'MTT', 'Western Asset Municipal Defined Opportunity Trust Inc', 11, 2);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (14, 'LOGM', 'LogMein, Inc.', 8, 2);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (15, 'PLCE', 'Children''s Place, Inc. (The)', 1, 9);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (16, 'UNTY', 'Unity Bancorp, Inc.', 11, 4);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (17, 'NXTD', 'NXT-ID Inc.', 11, 4);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (18, 'APF', 'Morgan Stanley Asia-Pacific Fund, Inc.', 3, 4);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (19, 'JAZZ', 'Jazz Pharmaceuticals plc', 1, 8);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (20, 'UA', 'Under Armour, Inc.', 5, 7);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (21, 'JPM^A', 'J P Morgan Chase & Co', 4, 3);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (22, 'BEP', 'Brookfield Renewable Partners L.P.', 8, 1);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (23, 'NKG', 'Nuveen Georgia Quality Municipal Income Fund ', 7, 7);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (24, 'NXEOW', 'Nexeo Solutions, Inc.', 5, 5);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (25, 'SNOW', 'Intrawest Resorts Holdings, Inc.', 11, 9);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (26, 'CHS', 'Chico''s FAS, Inc.', 1, 10);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (27, 'NODK', 'NI Holdings, Inc.', 5, 9);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (28, 'SPWH', 'Sportsman''s Warehouse Holdings, Inc.', 7, 5);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (29, 'BGC', 'General Cable Corporation', 8, 4);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (30, 'NSC', 'Norfolk Souther Corporation', 7, 8);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (31, 'TISA', 'Top Image Systems, Ltd.', 7, 6);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (32, 'BXS', 'BancorpSouth, Inc.', 7, 1);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (33, 'NVTR', 'Nuvectra Corporation', 10, 10);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (34, 'SCD', 'LMP Capital and Income Fund Inc.', 7, 9);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (35, 'TKC', 'Turkcell Iletisim Hizmetleri AS', 5, 5);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (36, 'ELP', 'Companhia Paranaense de Energia (COPEL)', 9, 7);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (37, 'XCRA', 'Xcerra Corporation', 10, 3);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (38, 'KURA', 'Kura Oncology, Inc.', 10, 5);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (39, 'LDOS', 'Leidos Holdings, Inc.', 3, 8);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (40, 'HQCL', 'Hanwha Q CELLS Co., Ltd. ', 3, 2);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (41, 'FAF', 'First American Corporation (The)', 7, 10);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (42, 'PLXS', 'Plexus Corp.', 2, 5);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (43, 'COGT', 'Cogint, Inc.', 7, 3);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (44, 'AWRE', 'Aware, Inc.', 1, 9);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (45, 'FUL', 'H. B. Fuller Company', 11, 9);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (46, 'BRCD', 'Brocade Communications Systems, Inc.', 2, 1);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (47, 'GS^C', 'Goldman Sachs Group, Inc. (The)', 3, 1);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (48, 'PGNX', 'Progenics Pharmaceuticals Inc.', 11, 5);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (49, 'MRAM', 'Everspin Technologies, Inc.', 4, 4);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (50, 'CPF', 'CPB Inc.', 2, 5);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (51, 'ZIOP', 'ZIOPHARM Oncology Inc', 5, 3);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (52, 'BBD', 'Banco Bradesco Sa', 6, 9);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (53, 'PGR', 'Progressive Corporation (The)', 5, 1);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (54, 'DWSN', 'Dawson Geophysical Company', 10, 7);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (55, 'GXP', 'Great Plains Energy Inc', 7, 2);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (56, 'CDW', 'CDW Corporation', 2, 9);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (57, 'SLM', 'SLM Corporation', 5, 5);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (58, 'LCA', 'Landcadia Holdings, Inc.', 6, 7);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (59, 'SB', 'Safe Bulkers, Inc', 3, 1);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (60, 'USLB', 'PowerShares Russell 1000 Low Beta Equal Weight Portfolio', 6, 8);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (61, 'GLW', 'Corning Incorporated', 6, 7);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (62, 'PHMD', 'PhotoMedex, Inc.', 3, 1);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (63, 'TOUR', 'Tuniu Corporation', 3, 9);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (64, 'ARWR', 'Arrowhead Pharmaceuticals, Inc.', 10, 1);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (65, 'EVHC^', 'Envision Healthcare Corporation', 9, 3);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (66, 'NMM', 'Navios Maritime Partners LP', 2, 4);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (67, 'VGI', 'Virtus Global Multi-Sector Income Fund', 8, 6);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (68, 'OFED', 'Oconee Federal Financial Corp.', 5, 3);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (69, 'GGT^B', 'Gabelli Multi-Media Trust Inc. (The)', 9, 6);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (70, 'UAE', 'iShares MSCI UAE Capped ETF', 2, 5);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (71, 'BXMT', 'Capital Trust, Inc.', 6, 10);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (72, 'LDOS', 'Leidos Holdings, Inc.', 4, 1);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (73, 'SBH', 'Sally Beauty Holdings, Inc.', 5, 1);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (74, 'DWCH', 'Datawatch Corporation', 6, 9);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (75, 'HGSH', 'China HGS Real Estate, Inc.', 7, 1);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (76, 'YUME', 'YuMe, Inc.', 8, 9);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (77, 'UAL', 'United Continental Holdings, Inc.', 11, 1);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (78, 'VLO', 'Valero Energy Corporation', 8, 10);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (79, 'THW', 'Tekla World Healthcare Fund', 9, 7);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (80, 'AKAO', 'Achaogen, Inc.', 5, 9);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (81, 'JPM^E', 'J P Morgan Chase & Co', 3, 2);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (82, 'MEN', 'Blackrock MuniEnhanced Fund, Inc.', 1, 3);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (83, 'EGIF', 'Eagle Growth and Income Opportunities Fund', 6, 4);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (84, 'TZOO', 'Travelzoo', 7, 2);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (85, 'ALTY', 'Global X SuperDividend Alternatives ETF', 8, 10);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (86, 'CXW', 'CoreCivic, Inc.', 3, 7);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (87, 'SRTSW', 'Sensus Healthcare, Inc.', 4, 7);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (88, 'BFZ', 'BlackRock California Municipal Income Trust', 8, 7);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (89, 'NEWR', 'New Relic, Inc.', 7, 7);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (90, 'RMBS', 'Rambus, Inc.', 1, 2);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (91, 'BTT', 'BlackRock Municipal Target Term Trust Inc. (The)', 9, 4);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (92, 'SHO^F', 'Sunstone Hotel Investors, Inc.', 3, 1);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (93, 'DLTH', 'Duluth Holdings Inc.', 1, 4);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (94, 'VONV', 'Vanguard Russell 1000 Value ETF', 7, 9);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (95, 'FRC^G', 'FIRST REPUBLIC BANK', 1, 6);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (96, 'HABT', 'The Habit Restaurants, Inc.', 2, 6);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (97, 'DHI', 'D.R. Horton, Inc.', 8, 2);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (98, 'TWOU', '2U, Inc.', 4, 9);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (99, 'JCP', 'J.C. Penney Company, Inc. Holding Company', 4, 7);
insert into stock (stockID, ticker, name, sectorID, exchangeID) values (100, 'FBHS', 'Fortune Brands Home & Security, Inc.', 10, 5);

insert into item (itemID, price, quantity, stockID) values (1, '$3321.56', 15620, 44);
insert into item (itemID, price, quantity, stockID) values (2, '$9379.05', 74090, 21);
insert into item (itemID, price, quantity, stockID) values (3, '$5200.87', 23921, 80);
insert into item (itemID, price, quantity, stockID) values (4, '$9137.79', 9431, 78);
insert into item (itemID, price, quantity, stockID) values (5, '$2723.71', 40254, 100);
insert into item (itemID, price, quantity, stockID) values (6, '$1702.66', 7755, 83);
insert into item (itemID, price, quantity, stockID) values (7, '$7139.67', 60482, 5);
insert into item (itemID, price, quantity, stockID) values (8, '$8616.66', 81755, 80);
insert into item (itemID, price, quantity, stockID) values (9, '$2462.37', 27659, 20);
insert into item (itemID, price, quantity, stockID) values (10, '$1344.09', 11715, 94);
insert into item (itemID, price, quantity, stockID) values (11, '$6113.66', 50992, 39);
insert into item (itemID, price, quantity, stockID) values (12, '$4655.29', 58641, 20);
insert into item (itemID, price, quantity, stockID) values (13, '$8002.83', 15901, 75);
insert into item (itemID, price, quantity, stockID) values (14, '$6489.50', 27668, 5);
insert into item (itemID, price, quantity, stockID) values (15, '$1021.80', 52277, 49);
insert into item (itemID, price, quantity, stockID) values (16, '$4492.99', 85064, 59);
insert into item (itemID, price, quantity, stockID) values (17, '$8501.71', 68275, 50);
insert into item (itemID, price, quantity, stockID) values (18, '$9559.73', 1642, 86);
insert into item (itemID, price, quantity, stockID) values (19, '$790.23', 44237, 62);
insert into item (itemID, price, quantity, stockID) values (20, '$6454.45', 26895, 86);
insert into item (itemID, price, quantity, stockID) values (21, '$6486.40', 66562, 24);
insert into item (itemID, price, quantity, stockID) values (22, '$1054.69', 83057, 54);
insert into item (itemID, price, quantity, stockID) values (23, '$1704.53', 8298, 86);
insert into item (itemID, price, quantity, stockID) values (24, '$2706.51', 52848, 76);
insert into item (itemID, price, quantity, stockID) values (25, '$9728.11', 34473, 25);
insert into item (itemID, price, quantity, stockID) values (26, '$5861.61', 63728, 58);
insert into item (itemID, price, quantity, stockID) values (27, '$7630.21', 88904, 53);
insert into item (itemID, price, quantity, stockID) values (28, '$8534.17', 47143, 20);
insert into item (itemID, price, quantity, stockID) values (29, '$7072.23', 67268, 34);
insert into item (itemID, price, quantity, stockID) values (30, '$8370.48', 25743, 41);
insert into item (itemID, price, quantity, stockID) values (31, '$8102.82', 57637, 7);
insert into item (itemID, price, quantity, stockID) values (32, '$1968.63', 49114, 52);
insert into item (itemID, price, quantity, stockID) values (33, '$548.54', 24193, 80);
insert into item (itemID, price, quantity, stockID) values (34, '$4189.99', 1471, 53);
insert into item (itemID, price, quantity, stockID) values (35, '$7382.66', 70629, 63);
insert into item (itemID, price, quantity, stockID) values (36, '$5970.49', 98577, 83);
insert into item (itemID, price, quantity, stockID) values (37, '$7729.27', 98036, 85);
insert into item (itemID, price, quantity, stockID) values (38, '$9445.64', 64263, 74);
insert into item (itemID, price, quantity, stockID) values (39, '$8618.26', 31905, 17);
insert into item (itemID, price, quantity, stockID) values (40, '$4477.89', 55688, 72);
insert into item (itemID, price, quantity, stockID) values (41, '$8507.13', 11900, 30);
insert into item (itemID, price, quantity, stockID) values (42, '$5742.60', 67192, 87);
insert into item (itemID, price, quantity, stockID) values (43, '$4897.55', 98466, 96);
insert into item (itemID, price, quantity, stockID) values (44, '$6327.76', 10676, 67);
insert into item (itemID, price, quantity, stockID) values (45, '$5052.31', 82807, 38);
insert into item (itemID, price, quantity, stockID) values (46, '$1075.20', 24212, 5);
insert into item (itemID, price, quantity, stockID) values (47, '$1927.32', 71073, 70);
insert into item (itemID, price, quantity, stockID) values (48, '$3564.27', 17589, 92);
insert into item (itemID, price, quantity, stockID) values (49, '$3054.88', 43859, 38);
insert into item (itemID, price, quantity, stockID) values (50, '$9863.95', 8995, 16);
insert into item (itemID, price, quantity, stockID) values (51, '$5955.07', 71902, 41);
insert into item (itemID, price, quantity, stockID) values (52, '$8407.75', 82780, 27);
insert into item (itemID, price, quantity, stockID) values (53, '$456.13', 60162, 37);
insert into item (itemID, price, quantity, stockID) values (54, '$1978.28', 5459, 33);
insert into item (itemID, price, quantity, stockID) values (55, '$574.21', 19200, 46);
insert into item (itemID, price, quantity, stockID) values (56, '$4783.21', 21770, 41);
insert into item (itemID, price, quantity, stockID) values (57, '$5912.59', 2855, 5);
insert into item (itemID, price, quantity, stockID) values (58, '$7728.53', 20047, 82);
insert into item (itemID, price, quantity, stockID) values (59, '$7720.30', 26021, 44);
insert into item (itemID, price, quantity, stockID) values (60, '$6188.23', 81904, 25);
insert into item (itemID, price, quantity, stockID) values (61, '$3718.49', 21122, 32);
insert into item (itemID, price, quantity, stockID) values (62, '$3323.30', 34209, 38);
insert into item (itemID, price, quantity, stockID) values (63, '$7344.23', 51617, 74);
insert into item (itemID, price, quantity, stockID) values (64, '$287.35', 96406, 98);
insert into item (itemID, price, quantity, stockID) values (65, '$4675.70', 45230, 4);
insert into item (itemID, price, quantity, stockID) values (66, '$1776.31', 77538, 35);
insert into item (itemID, price, quantity, stockID) values (67, '$759.83', 63527, 79);
insert into item (itemID, price, quantity, stockID) values (68, '$5169.94', 34115, 81);
insert into item (itemID, price, quantity, stockID) values (69, '$9988.68', 21324, 34);
insert into item (itemID, price, quantity, stockID) values (70, '$2891.09', 67353, 77);
insert into item (itemID, price, quantity, stockID) values (71, '$4908.95', 4078, 27);
insert into item (itemID, price, quantity, stockID) values (72, '$4341.62', 35054, 26);
insert into item (itemID, price, quantity, stockID) values (73, '$5058.12', 45520, 73);
insert into item (itemID, price, quantity, stockID) values (74, '$7254.21', 82471, 63);
insert into item (itemID, price, quantity, stockID) values (75, '$3681.15', 45292, 10);
insert into item (itemID, price, quantity, stockID) values (76, '$8592.05', 65371, 86);
insert into item (itemID, price, quantity, stockID) values (77, '$2957.55', 87715, 15);
insert into item (itemID, price, quantity, stockID) values (78, '$7085.53', 29531, 30);
insert into item (itemID, price, quantity, stockID) values (79, '$9974.41', 55567, 76);
insert into item (itemID, price, quantity, stockID) values (80, '$9715.02', 30183, 32);
insert into item (itemID, price, quantity, stockID) values (81, '$1582.68', 27319, 13);
insert into item (itemID, price, quantity, stockID) values (82, '$6293.31', 40794, 28);
insert into item (itemID, price, quantity, stockID) values (83, '$7161.42', 92281, 93);
insert into item (itemID, price, quantity, stockID) values (84, '$1158.28', 32064, 85);
insert into item (itemID, price, quantity, stockID) values (85, '$8907.15', 38989, 28);
insert into item (itemID, price, quantity, stockID) values (86, '$8117.28', 66848, 7);
insert into item (itemID, price, quantity, stockID) values (87, '$7870.76', 56864, 55);
insert into item (itemID, price, quantity, stockID) values (88, '$4934.23', 83596, 78);
insert into item (itemID, price, quantity, stockID) values (89, '$2481.05', 5391, 69);
insert into item (itemID, price, quantity, stockID) values (90, '$4564.00', 60503, 5);
insert into item (itemID, price, quantity, stockID) values (91, '$3429.99', 33114, 91);
insert into item (itemID, price, quantity, stockID) values (92, '$3162.43', 69266, 68);
insert into item (itemID, price, quantity, stockID) values (93, '$8851.12', 3483, 83);
insert into item (itemID, price, quantity, stockID) values (94, '$3364.66', 55839, 73);
insert into item (itemID, price, quantity, stockID) values (95, '$8959.37', 15539, 43);
insert into item (itemID, price, quantity, stockID) values (96, '$4981.06', 7587, 44);
insert into item (itemID, price, quantity, stockID) values (97, '$8192.93', 6054, 80);
insert into item (itemID, price, quantity, stockID) values (98, '$6590.86', 25207, 90);
insert into item (itemID, price, quantity, stockID) values (99, '$7546.50', 8776, 89);
insert into item (itemID, price, quantity, stockID) values (100, '$4209.18', 84015, 43);

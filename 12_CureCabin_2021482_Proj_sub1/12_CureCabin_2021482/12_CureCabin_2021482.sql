CREATE database curecabin;
use curecabin;
CREATE TABLE Patients (
   PatientID INT PRIMARY KEY,
   Name_Fname VARCHAR(50),
   Name_Mname VARCHAR(50),
   Name_Lname VARCHAR(50),
   Address_street_number VARCHAR(50),
   Address_street_name VARCHAR(50),
   Address_apt_number VARCHAR(50),
   Address_city VARCHAR(50),
   Address_zipCode INT,
   Address_state VARCHAR(50),
   Address_country VARCHAR(50),
   DOB DATE,
   ContactNumber_type VARCHAR(50),
   ContactNumber_number INT,
   Gender CHAR(1),
   Email_type VARCHAR(50),
   Email_address VARCHAR(100),
   Age INT
);

CREATE TABLE Doctors
(
    DoctorID INT PRIMARY KEY,
    Doctor_Name_Fname VARCHAR(50) NOT NULL,
    Doctor_Name_Mname VARCHAR(50),
    Doctor_Name_Lname VARCHAR(50) NOT NULL,
    Specialisation_Description VARCHAR(100) NOT NULL,
    ContactNumber_type VARCHAR(20) NOT NULL,
    ContactNumber_number INT NOT NULL,
    Email_type VARCHAR(10) NOT NULL,
    Email_address VARCHAR(100) NOT NULL
);

CREATE TABLE Suppliers
(
    SupplierID INT PRIMARY KEY,
    Supplier_Name_Fname VARCHAR(50) NOT NULL,
    Supplier_Name_Mname VARCHAR(50) NOT NULL,
    Supplier_Name_Lname VARCHAR(50) NOT NULL,
    ContactNumber_type VARCHAR(20) NOT NULL,
    ContactNumber_number VARCHAR(20) NOT NULL,
    Email_Address VARCHAR(50) NOT NULL,
    Email_Type VARCHAR(20) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    Address_Type VARCHAR(20) NOT NULL
);

CREATE TABLE Medicines
(
    MedicineID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Composition VARCHAR(50) NOT NULL,
    Ingredient VARCHAR(50) NOT NULL,
    Type VARCHAR(20) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Cost DECIMAL(10, 2) NOT NULL,
    Currency VARCHAR(10) NOT NULL,
    SupplierID INT NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Prescription
(
    PrescriptionID INT PRIMARY KEY,
    DoctorID INT NOT NULL,
    PatientID INT NOT NULL,
    MedicineID INT NOT NULL,
    Dosage INT NOT NULL,
    Duration_Days INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Date DATE NOT NULL,
    DateWritten DATE NOT NULL,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID)
);

CREATE TABLE Pharmacists (
    PharmacistID INT PRIMARY KEY,
    Pharmacists_Name_Fname VARCHAR(255),
    Pharmacists_Name_Mname VARCHAR(255),
    Pharmacists_Name_Lname VARCHAR(255),
    ContactNumber_type VARCHAR(255),
    ContactNumber_number VARCHAR(255),
    Email_Address VARCHAR(255),
    Email_Type VARCHAR(255),
    Qualification_yearOfGraduation INT,
    Qualification_FieldOfStudy VARCHAR(255)
);

CREATE TABLE MedicalHistory (
    MedicalHistID INT PRIMARY KEY,
    PatientID INT,
    Description VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE Payment (
  PaymentID INT PRIMARY KEY,
  OrderID INT,
  Amount DECIMAL(10, 2) NOT NULL,
  PaymentMethod VARCHAR(50) NOT NULL,
  PaymentDate DATE NOT NULL
);

CREATE TABLE Branches (
  BranchID INT PRIMARY KEY,
  street_number VARCHAR(255) NOT NULL,
  street_name VARCHAR(255) NOT NULL,
  apt_number VARCHAR(255),
  city VARCHAR(255) NOT NULL,
  zipCode VARCHAR(255) NOT NULL,
  state VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  ContactNumber VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL
);

CREATE TABLE Stock (
    StockID INT PRIMARY KEY,
    MedicineID INT,
    BranchID INT,
    Quantity INT,
    Threshold INT,
    PharmacistID INT,
    FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID),
    FOREIGN KEY (PharmacistID) REFERENCES Pharmacists(PharmacistID)
);

CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    Date DATE,
    Time TIME,
    Reason VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    PatientID INT,
    MedicineID INT,
    PharmacistID INT,
    Quantity INT,
    Date DATE,
    DeliveryStatus VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID),
    FOREIGN KEY (PharmacistID) REFERENCES Pharmacists(PharmacistID)
);

CREATE TABLE PolicyProvider (
  PolicyProviderID INT PRIMARY KEY,
  PolicyProvider_Name_Fname VARCHAR(255) NOT NULL,
  PolicyProvider_Name_Mname VARCHAR(255),
  PolicyProvider_Name_Lname VARCHAR(255) NOT NULL,
  ContactNumber VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL,
  Address VARCHAR(255) NOT NULL,
  PatientID INT NOT NULL,
  FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

INSERT INTO Patients (PatientID, Name_Fname, Name_Mname, Name_Lname, Address_street_number, Address_street_name, Address_apt_number, Address_city, Address_zipCode, Address_state, Address_country, DOB, ContactNumber_type, ContactNumber_number, Gender, Email_type, Email_address, Age)
VALUES (1, 'Saul', 'Rice', 'Jones', 294, 'mgxydweylgrixdp', '4X', 'ugtnhkdmqjji', 21338, 'XR', 'India', '2008-10-18', 'Work', 965926165, 'F', 'Work', 'ccdwoxmfvw@email.com', 74) ,

(2, 'Alyssa', 'Hymes', 'Baker', 528, 'hnmjfanmwjdebvv', '31R', 'tzdldgowfkgq', 60042, 'CY', 'India', '2011-02-21', 'Work', 321529756, 'F', 'Work', 'aptymjmrhy@email.com', 10) ,

(3, 'Joseph', 'Crist', 'Wheeler', 832, 'umnnrkmnkwrdscv', '46U', 'hfngzseaqspv', 42805, 'OK', 'India', '2011-05-10', 'Home', 701251668, 'M', 'Work', 'iqevzhxpcw@email.com', 43) ,

(4, 'Lenora', 'York', 'Mattingly', 825, 'zyifvwxyybajolk', '31O', 'oujqyxpaxkoh', 36655, 'VN', 'India', '2013-10-10', 'Work', 278376766, 'M', 'Work', 'vzwrrsfqof@email.com', 54) ,

(5, 'Hugh', 'Harrell', 'Stickney', 965, 'osemcujeoqorlyb', '70I', 'urfqgjugiuqn', 87862, 'ZV', 'India', '2022-03-20', 'Work', 570172191, 'M', 'Home', 'ojnplwfhed@email.com', 12) ,

(6, 'Richard', 'Nails', 'Gosselin', 896, 'xjtlpsjdvkcohad', '23Y', 'rnftsingften', 33883, 'OO', 'India', '2012-05-03', 'Work', 706819252, 'M', 'Work', 'xrbgdliofc@email.com', 87) ,

(7, 'Michael', 'Hall', 'Chavez', 587, 'zzxzupddftuufki', '30P', 'qigjvilnyube', 91391, 'ON', 'India', '2006-03-30', 'Work', 471921674, 'M', 'Work', 'iacfrdizqp@email.com', 41) ,

(8, 'Jean', 'Robbins', 'Grey', 276, 'skfocgwslpkohhu', '17D', 'zmwdehtidpev', 73132, 'BD', 'India', '2017-02-05', 'Home', 486694053, 'F', 'Home', 'bqooaiswej@email.com', 54) ,

(9, 'Reginald', 'Redman', 'Kasprzak', 599, 'rmwzasgjpbiemav', '87Z', 'fzmnwgvelhuh', 59037, 'TH', 'India', '2003-10-18', 'Home', 962445604, 'F', 'Home', 'torggxcmiy@email.com', 90) ,

(10, 'Teresa', 'Escobedo', 'Gordon', 411, 'gmswhrwhczlpogj', '63M', 'zjuxtamfvart', 31596, 'LL', 'India', '2007-11-22', 'Work', 350432909, 'F', 'Home', 'ptshdrahit@email.com', 2) ,

(11, 'Leland', 'Lopez', 'Nowlen', 517, 'rtswtguhksvovvi', '13U', 'zzmvxwsxymax', 16595, 'XT', 'India', '2008-08-09', 'Home', 380491689, 'M', 'Home', 'bsqvahgnev@email.com', 72) ,

(12, 'Lawrence', 'Curtis', 'Lodge', 331, 'doirflgvyuzwplz', '70K', 'rqciirvezawq', 62245, 'QL', 'India', '2013-03-30', 'Home', 624567214, 'M', 'Work', 'opfgrwkzzp@email.com', 49) ,

(13, 'Norman', 'Beverly', 'Carpenter', 929, 'movxakowxtqjkmg', '43I', 'ufuffbgtrlyw', 28395, 'RK', 'India', '2005-12-28', 'Work', 628529422, 'M', 'Home', 'ofcprgnfrg@email.com', 82) ,

(14, 'Barbara', 'Dunlop', 'Godin', 553, 'ypdxhbusfywzzuc', '71M', 'dbwihielsfsg', 43886, 'HZ', 'India', '2021-10-25', 'Home', 507593121, 'M', 'Work', 'ngdbewvhjf@email.com', 66) ,

(15, 'Linda', 'Schrimsher', 'Parker', 437, 'iojuolpfhcuilvo', '64M', 'codcqqgnfzfy', 76022, 'TY', 'India', '2003-11-28', 'Home', 313350647, 'M', 'Work', 'jiftvphpmj@email.com', 58) ,

(16, 'Kari', 'Livermore', 'Campbell', 596, 'hfubxpagkepewfc', '96G', 'kzwjqbbddsja', 42362, 'AJ', 'India', '2017-06-28', 'Work', 747634597, 'M', 'Home', 'sbkirnexvr@email.com', 97) ,

(17, 'Peter', 'Turner', 'Carter', 375, 'nssfjfpnvctyucf', '18B', 'xpxdgszybdus', 46193, 'KB', 'India', '2009-05-18', 'Home', 686010479, 'F', 'Work', 'zstqnpzvej@email.com', 31) ,

(18, 'Lonnie', 'Odonell', 'Arnold', 285, 'myhlvuwfdfqacig', '90P', 'gvqdmkswlnrp', 82492, 'ZS', 'India', '2016-11-25', 'Work', 155247598, 'M', 'Work', 'elpvzogwga@email.com', 50) ,

(19, 'Marion', 'Grant', 'Hall', 813, 'lsaoalgexalieoo', '16A', 'qxurufhslrhd', 91508, 'CZ', 'India', '2002-01-27', 'Home', 160060775, 'M', 'Work', 'zfunygolzn@email.com', 98) ,

(20, 'Timothy', 'Goodson', 'Byrd', 156, 'keymnybmweecklk', '93C', 'ytzwmnahhzdz', 94622, 'OB', 'India', '2003-07-22', 'Work', 633697178, 'M', 'Work', 'fcwrrfczer@email.com', 42) ,

(21, 'Carroll', 'Jackson', 'Peterson', 332, 'tuodbhwxcocfvxo', '72E', 'owltdmdmqryt', 44464, 'QW', 'India', '2010-03-10', 'Work', 555040165, 'M', 'Home', 'sdldaskuga@email.com', 99) ,

(22, 'John', 'Mccloud', 'Warner', 401, 'dmrylibzlfbebmp', '80Z', 'rhyadzwqfges', 44922, 'ZW', 'India', '2013-03-27', 'Home', 756896961, 'M', 'Home', 'jyuphpjvbj@email.com', 11) ,

(23, 'Frankie', 'Flora', 'Pennington', 293, 'ihqsznbitatutjh', '35N', 'dthddwhyesez', 81645, 'YM', 'India', '2011-03-10', 'Work', 441099894, 'F', 'Work', 'xjufimpbvr@email.com', 25) ,

(24, 'Richard', 'Hulslander', 'Adams', 146, 'fwsqfwepswxbfhp', '68F', 'moyfnhzojcyj', 27443, 'QD', 'India', '2017-02-09', 'Home', 829600252, 'M', 'Work', 'kuwggxieor@email.com', 99) ,

(25, 'Martin', 'Bechtel', 'Hinkle', 539, 'pfvpdexqmpkpbda', '62H', 'mhnlldwpfhet', 78474, 'JW', 'India', '2011-03-07', 'Home', 908830502, 'M', 'Work', 'lzuznxrdrl@email.com', 27) ,

(26, 'Bruce', 'Foster', 'Nowlen', 681, 'tdzhnslaxbmnkgz', '87S', 'xfgjqwaphudh', 38946, 'LK', 'India', '2007-01-23', 'Work', 707617508, 'M', 'Work', 'sftghnnfcu@email.com', 89) ,

(27, 'Jean', 'Cannon', 'Steen', 114, 'jxocbgcrnenuwvq', '55I', 'kfeqiesdtlct', 51064, 'VN', 'India', '2005-02-25', 'Work', 383835706, 'F', 'Work', 'rcmgoucsdh@email.com', 77) ,

(28, 'Christopher', 'Fisher', 'Ruddy', 484, 'nawunzkbuuqqscr', '42T', 'myeogfpkajis', 91999, 'OL', 'India', '2002-01-29', 'Home', 389421207, 'F', 'Work', 'ufomqusdig@email.com', 67) ,

(29, 'Edna', 'Engram', 'Cruz', 963, 'wnqpvqqiatxsgvl', '58A', 'eirrahplnuob', 92801, 'EX', 'India', '2007-02-13', 'Home', 751923663, 'M', 'Work', 'uixccnuwto@email.com', 94) ,

(30, 'James', 'Blair', 'Hauck', 547, 'aftauogalmdubqf', '75C', 'jxgscmdrtbej', 84565, 'WC', 'India', '2001-02-11', 'Work', 518221341, 'F', 'Home', 'gleffkcmbu@email.com', 55) ,

(31, 'Mary', 'Mills', 'Culp', 388, 'tzginmamaiwjida', '18M', 'ayoromtgoztq', 17039, 'VS', 'India', '2016-03-24', 'Home', 773655364, 'F', 'Work', 'lnolqmcvbm@email.com', 80) ,

(32, 'Emanuel', 'Phelan', 'Klish', 743, 'wuuuwdqyjksqyih', '18P', 'achqhctvaizn', 67538, 'GM', 'India', '2019-10-04', 'Home', 539352370, 'F', 'Work', 'xzvuqpzogr@email.com', 40) ,

(33, 'Thomas', 'Robinson', 'Corry', 165, 'zwinfjsdkurppdn', '43Z', 'jqbkytnpqtus', 17307, 'KQ', 'India', '2004-02-24', 'Home', 935278195, 'F', 'Work', 'ojeuibzvsu@email.com', 95) ,

(34, 'Louise', 'Poole', 'Garcia', 918, 'vlynvotsmqoyxph', '12F', 'riswbxrhtkpq', 85916, 'QW', 'India', '2018-10-14', 'Work', 227083922, 'M', 'Home', 'hnvxeqbrev@email.com', 12) ,

(35, 'Donald', 'Cummings', 'Kittle', 385, 'fhmfokrwrjzydim', '45V', 'zkouriyocmns', 95294, 'KT', 'India', '2014-05-21', 'Work', 485669801, 'F', 'Work', 'difbxxjwul@email.com', 94) ,

(36, 'Elizabeth', 'Wilkins', 'Williams', 526, 'lkoyonujrueyxox', '89R', 'iuzglvkyexjq', 63990, 'OF', 'India', '2005-02-27', 'Home', 194379813, 'M', 'Work', 'undlltbcff@email.com', 24) ,

(37, 'David', 'Stokes', 'Coffey', 252, 'osfsjyktwuqkadt', '69C', 'iiqvkoyfcolv', 36459, 'FJ', 'India', '2011-09-13', 'Work', 495131604, 'F', 'Work', 'ukfldorlzt@email.com', 17) ,

(38, 'Sally', 'Ackerman', 'Davis', 696, 'hmhotldlikcvmox', '58J', 'shvmylhtimbb', 23594, 'QP', 'India', '2010-08-21', 'Work', 378413963, 'F', 'Work', 'emanjkcghd@email.com', 68) ,

(39, 'Maria', 'Zapata', 'Bowman', 201, 'zualyvntxndruuq', '21B', 'myjextswvnup', 88205, 'VK', 'India', '2007-02-05', 'Home', 499323202, 'F', 'Work', 'zynwrqctyb@email.com', 32) ,

(40, 'Keith', 'Cichon', 'Carroll', 699, 'begmevgtvlniiyz', '33V', 'rzpsvrgofvlv', 36345, 'TE', 'India', '2014-10-29', 'Work', 239897243, 'M', 'Home', 'tcblknxwsa@email.com', 83) ,

(41, 'Melissa', 'Garcia', 'Sassaman', 823, 'nhecxxyrbhltygv', '39R', 'rsenjdoimrws', 66956, 'YV', 'India', '2017-08-08', 'Work', 355655775, 'F', 'Home', 'bomrfzuvtp@email.com', 81) ,

(42, 'Karla', 'Layel', 'Cobbs', 380, 'slsbvsxfxvaebbi', '94J', 'ioddrlrijuux', 77332, 'MB', 'India', '2018-05-30', 'Work', 991992077, 'M', 'Home', 'ymsdvihywz@email.com', 41) ,

(43, 'John', 'Scarborough', 'William', 510, 'hxhgjafhzftrrkj', '29O', 'fqmexcelpfvy', 73008, 'GZ', 'India', '2017-11-22', 'Home', 596422839, 'F', 'Home', 'nbwbscgrqe@email.com', 45) ,

(44, 'Loretta', 'Noble', 'Frazier', 930, 'aghiruirlktuvbd', '2O', 'engnlqixjcxd', 19666, 'AL', 'India', '2000-04-03', 'Home', 323677711, 'F', 'Work', 'zxeyeauykn@email.com', 10) ,

(45, 'Brandi', 'Sharp', 'Brooks', 329, 'vphaiiicefmlhyz', '91P', 'cpbtkgqjvzdq', 98969, 'FT', 'India', '2014-08-19', 'Home', 970208632, 'F', 'Home', 'xyutmduoer@email.com', 66) ,

(46, 'Gladys', 'Wells', 'Hull', 270, 'gyhflrzvdphcini', '52Z', 'qvilhsvxiysz', 46950, 'AX', 'India', '2007-02-14', 'Home', 954487494, 'M', 'Home', 'tjcyokzjir@email.com', 13) ,

(47, 'Elizabeth', 'Davis', 'Horn', 115, 'dyyxvajyksufflo', '46P', 'thgtfnpvscvh', 38555, 'CN', 'India', '2002-10-11', 'Work', 138785372, 'F', 'Work', 'biynfllgwv@email.com', 41) ,

(48, 'Brenda', 'Perry', 'Kim', 741, 'aedejycsngkhenj', '47S', 'ivlembrikohc', 41774, 'NI', 'India', '2005-08-13', 'Home', 860516884, 'M', 'Work', 'ywcyiubpbm@email.com', 53) ,

(49, 'Louis', 'Graham', 'Hardie', 802, 'tyspedikpmoeeer', '58F', 'nqjjtohqsxiy', 32431, 'VK', 'India', '2007-07-25', 'Work', 582456194, 'M', 'Home', 'qlsdrynegp@email.com', 90) ,

(50, 'Angela', 'Morris', 'Pagan', 395, 'dozqizmgwghsioo', '91W', 'zulozonjmmhk', 55925, 'OA', 'India', '2002-08-26', 'Work', 107547638, 'F', 'Home', 'wxjscpdhcq@email.com', 49) ,

(51, 'Charlene', 'Miller', 'Lee', 907, 'repyovcdrnaihfw', '1I', 'dzhoqgiertzf', 26225, 'GZ', 'India', '2001-11-13', 'Home', 809721059, 'F', 'Home', 'ikfihvexhh@email.com', 23) ,

(52, 'Tony', 'Kozel', 'Kellam', 262, 'ccwaeqqbcjtkuac', '41O', 'lsyeyofremjr', 32570, 'WS', 'India', '2004-05-25', 'Home', 833466091, 'M', 'Work', 'drseciwpho@email.com', 78) ,

(53, 'Lucy', 'Holman', 'Horn', 749, 'qvhnuicpisvalkg', '72W', 'wmchinjxnyec', 44666, 'SS', 'India', '2005-07-11', 'Home', 695518775, 'F', 'Home', 'kwzgqgvimg@email.com', 79) ,

(54, 'Marc', 'Richardson', 'Wood', 870, 'vgkginqfhzggpna', '15R', 'fejhbypwljue', 20502, 'MU', 'India', '2010-09-07', 'Home', 158734819, 'M', 'Home', 'gvdunwvxwa@email.com', 18) ,

(55, 'Ann', 'Diaz', 'Rose', 278, 'cyaaykdxxqjdiiz', '4M', 'fbxefafvcrtp', 18595, 'HH', 'India', '2021-03-06', 'Work', 448735442, 'M', 'Work', 'ytjtpclxwk@email.com', 75) ,

(56, 'Deanna', 'Karo', 'Burton', 393, 'qlffltpxydndwic', '59R', 'qtygvbvyurtl', 24247, 'VF', 'India', '2014-03-20', 'Work', 699305062, 'M', 'Home', 'edhnwliqao@email.com', 93) ,

(57, 'Adam', 'Henderson', 'Barnfield', 600, 'qbqfmrkvcpwlyfg', '30K', 'giqiswcpgmny', 28595, 'CL', 'India', '2018-09-07', 'Work', 913527521, 'F', 'Work', 'udkchwipgy@email.com', 92) ,

(58, 'Sallie', 'Potter', 'Gandy', 562, 'uuvmhdkfmwolxqb', '97V', 'brscxsrxkldc', 24726, 'VW', 'India', '2022-03-30', 'Home', 783731318, 'M', 'Work', 'ixxquosrrz@email.com', 11) ,

(59, 'Barbara', 'Chiarelli', 'Johnson', 807, 'huzogwuykzkskun', '44Z', 'djevxsfpfsaf', 21665, 'IJ', 'India', '2012-09-19', 'Home', 326152083, 'M', 'Home', 'aafhzwwguq@email.com', 25) ,

(60, 'Mary', 'Carroll', 'Harrison', 769, 'vfxqnqhwhomxxkf', '96F', 'hltawiqvrqjh', 23344, 'VI', 'India', '2017-02-12', 'Home', 333489336, 'F', 'Work', 'nkglskphch@email.com', 33) ,

(61, 'Kenneth', 'Hokanson', 'Parks', 796, 'rcepnytqvguqupa', '34V', 'ftcviqeqtfqp', 62310, 'GV', 'India', '2007-10-22', 'Work', 206358634, 'F', 'Work', 'lwufqacyyu@email.com', 77) ,

(62, 'Edwin', 'Dunbar', 'Mahnken', 231, 'ymvvifyiqqzdxeb', '16G', 'biltnocxcszp', 62175, 'CM', 'India', '2018-09-20', 'Work', 728206016, 'F', 'Home', 'biuhbaoysr@email.com', 82) ,

(63, 'Charles', 'Flanagan', 'Willis', 694, 'afeihysydxvvcvb', '58P', 'yxkcozznqiln', 66909, 'XJ', 'India', '2003-02-28', 'Work', 953890567, 'F', 'Work', 'dzhzbgcgqw@email.com', 74) ,

(64, 'Tamara', 'Ashby', 'Twitchell', 761, 'hjqvpfemraszzai', '100N', 'uqtgrgnawtjo', 35428, 'YY', 'India', '2019-03-20', 'Work', 302231316, 'F', 'Home', 'apkmxdcfwf@email.com', 57) ,

(65, 'Roberto', 'Nelson', 'Villarreal', 497, 'yyrcxgtxabegvxv', '38C', 'qurujzruxsqo', 78818, 'NY', 'India', '2006-09-23', 'Work', 757629450, 'M', 'Work', 'bauakzroky@email.com', 90) ,

(66, 'Heather', 'Dalton', 'Brunson', 713, 'xpskpbafpczjdnn', '42H', 'ewkwjwaycydh', 11680, 'HP', 'India', '2008-03-04', 'Home', 477957791, 'M', 'Home', 'fizvzqajjw@email.com', 19) ,

(67, 'Mary', 'Perry', 'Berger', 769, 'svoywjuybwuphso', '42J', 'qxrxemggoaal', 60904, 'XJ', 'India', '2003-02-09', 'Home', 172868279, 'F', 'Home', 'ekiuuxnxer@email.com', 29) ,

(68, 'Gilbert', 'Sysyn', 'Mccord', 654, 'cgnezrvfoxspzxv', '69L', 'pzeozrdtvhzm', 57158, 'KO', 'India', '2021-06-06', 'Work', 370916340, 'F', 'Work', 'fvyyhbnucv@email.com', 65) ,

(69, 'Ernesto', 'Young', 'Buziak', 666, 'ayvdjsbzvdrvzvv', '42Y', 'fdfpmxvhnqfb', 93647, 'RR', 'India', '2003-10-26', 'Home', 408519716, 'M', 'Home', 'twqdufjqky@email.com', 12) ,

(70, 'Patricia', 'Gentry', 'Templeton', 246, 'xhxxszrhxqcrokk', '71K', 'jfnovsslrdnn', 26099, 'GC', 'India', '2013-01-24', 'Home', 599356893, 'M', 'Home', 'virwphgahi@email.com', 31) ,

(71, 'Amie', 'Mellon', 'Gleaton', 943, 'dosqttmbeuyksrj', '70O', 'ztrdslhhykfq', 76831, 'SH', 'India', '2017-10-16', 'Home', 992760066, 'M', 'Work', 'jrzwpgpxpa@email.com', 13) ,

(72, 'Joseph', 'Allen', 'Bly', 829, 'ldtdokacfrkuggh', '43Q', 'oonbndiraupe', 78245, 'EL', 'India', '2014-09-11', 'Home', 212889801, 'F', 'Work', 'smxmnmnkuo@email.com', 9) ,

(73, 'Elton', 'Hoffmann', 'Shehee', 701, 'qqngkkzidywbadk', '25D', 'botbkgihppzg', 74934, 'OJ', 'India', '2000-07-17', 'Work', 387712936, 'M', 'Home', 'rcffpvoaqx@email.com', 18) ,

(74, 'James', 'Talbert', 'Rowe', 673, 'hrakanprehimhuy', '90E', 'jgdwnasojxbj', 10235, 'OM', 'India', '2013-08-14', 'Work', 129727852, 'F', 'Home', 'kkbibwszph@email.com', 34) ,

(75, 'Cheryl', 'Stupar', 'Randrup', 194, 'bvfqtplhshreytr', '26W', 'dzrdzaswwhey', 27746, 'AX', 'India', '2004-08-28', 'Work', 973042326, 'M', 'Home', 'gkoaqikjos@email.com', 12) ,

(76, 'Katherine', 'Washington', 'Fitzgerald', 636, 'ybbxrkpwvkconmx', '1V', 'xzmqwadsnget', 49307, 'NL', 'India', '2007-11-07', 'Work', 694154326, 'M', 'Home', 'dmzbzldygy@email.com', 78) ,

(77, 'Brenda', 'Martelli', 'Wilson', 741, 'qmsrbgovhsqepsv', '44A', 'ruinlwgcargq', 61896, 'PC', 'India', '2019-01-14', 'Home', 926345670, 'F', 'Work', 'krrdcxsxyo@email.com', 86) ,

(78, 'Ralph', 'Knight', 'Farmer', 283, 'swbcvvvhdnryyyo', '74R', 'vnrcivncifwz', 64482, 'BF', 'India', '2009-10-03', 'Home', 591595784, 'M', 'Home', 'kbdzgrkezo@email.com', 9) ,

(79, 'Douglas', 'Handy', 'Potter', 192, 'crsguymimndvjwt', '29V', 'vtwiudldvneb', 77332, 'GE', 'India', '2022-06-16', 'Home', 124972220, 'F', 'Home', 'lvbotritvr@email.com', 54) ,

(80, 'Jordon', 'Brake', 'Tooley', 471, 'rqrdohlqswizgpv', '49F', 'yppnzkznctfy', 61844, 'SG', 'India', '2019-09-14', 'Home', 526040577, 'M', 'Work', 'edbkhmboqz@email.com', 65) ,

(81, 'Marie', 'Calloway', 'Sheffield', 280, 'aoekvpxlpkxdwrl', '79V', 'slmjvwtqzylx', 43097, 'GK', 'India', '2020-05-30', 'Home', 914115284, 'M', 'Work', 'qxqrrnpobw@email.com', 29) ,

(82, 'Samuel', 'Creasy', 'Heimsness', 499, 'ouurmnwnkidwwoi', '30T', 'cftvejnjnfqb', 14685, 'LR', 'India', '2003-12-25', 'Home', 764094003, 'F', 'Work', 'fetgjcxowm@email.com', 50) ,

(83, 'Curtis', 'Liscomb', 'Scipio', 702, 'mdbhhlqklqcyeql', '50M', 'rhfqbvdymhha', 12520, 'XL', 'India', '2017-11-11', 'Home', 552906118, 'M', 'Home', 'txspnrfxml@email.com', 38) ,

(84, 'Frank', 'Metzger', 'Hartley', 586, 'ctjdebfkosciwux', '6K', 'qypzklqhelop', 83917, 'WZ', 'India', '2014-10-21', 'Home', 650960183, 'F', 'Work', 'siqzxgjrcq@email.com', 29) ,

(85, 'Ryan', 'Free', 'Seay', 101, 'gontglqqwfyxjzd', '60C', 'qyfurmllkjvb', 71412, 'CN', 'India', '2001-04-10', 'Home', 643613627, 'M', 'Home', 'knkoctchsc@email.com', 32) ,

(86, 'Linda', 'Surgeon', 'Negron', 250, 'jvwfnsdkkxqttvg', '29S', 'ignrkdgkpvyn', 72836, 'EI', 'India', '2004-08-25', 'Home', 187022174, 'M', 'Work', 'yjqimgolaa@email.com', 23) ,

(87, 'Samuel', 'Tyson', 'Lovern', 667, 'nwonjrmnwfcqjgo', '87A', 'dgknrfjdmlxl', 80800, 'KO', 'India', '2013-11-05', 'Home', 964842357, 'F', 'Home', 'vqsdwgguto@email.com', 11) ,

(88, 'Ricky', 'Lavoie', 'Perry', 384, 'farwmzbamnxnibi', '52X', 'zeejgspfimzz', 77347, 'SJ', 'India', '2016-05-06', 'Home', 131106379, 'F', 'Home', 'gvwrfhpxzi@email.com', 99) ,

(89, 'Gayle', 'Greenberg', 'Bechel', 503, 'nrrejqxsedlyisx', '7K', 'pmaydrahysfj', 90051, 'YH', 'India', '2020-07-09', 'Home', 220443874, 'M', 'Work', 'xyfxsskcgl@email.com', 19) ,

(90, 'Whitney', 'Driscoll', 'Tullar', 833, 'wcgbrzxtobntono', '43U', 'whsozidohvtg', 84830, 'MS', 'India', '2002-05-28', 'Work', 176896694, 'F', 'Home', 'aedonappkd@email.com', 7) ,

(91, 'Tim', 'Foley', 'Catania', 438, 'gyjlvzctlxquxhu', '11X', 'aujejkqudznd', 10837, 'EZ', 'India', '2014-03-26', 'Work', 465273156, 'M', 'Home', 'sgqrbjdmne@email.com', 44) ,

(92, 'Patricia', 'Nicholson', 'Campbell', 513, 'gxeufjfinbomvpl', '23G', 'lphgtbtpgyil', 70829, 'GI', 'India', '2020-01-09', 'Work', 711645222, 'F', 'Home', 'mxodlljbri@email.com', 96) ,

(93, 'Shu', 'Glass', 'Baker', 815, 'vwicuotcdwkunos', '53I', 'hcdhevpilbve', 76041, 'QA', 'India', '2004-09-21', 'Home', 100393413, 'M', 'Home', 'imuswmehqx@email.com', 22) ,

(94, 'Emily', 'Brown', 'Berry', 415, 'ykxjtmfkzodlcxx', '5K', 'qijfjqxlrgnk', 81973, 'VC', 'India', '2011-07-26', 'Home', 506446519, 'M', 'Home', 'yajbfasipq@email.com', 65) ,

(95, 'Jordan', 'Turner', 'Cross', 392, 'qllpckysgzlybfg', '41N', 'oxjkhocuurvt', 84168, 'QL', 'India', '2003-02-14', 'Work', 139519531, 'F', 'Work', 'golivwpkkj@email.com', 70) ,

(96, 'Tammy', 'Navas', 'Whitsitt', 608, 'hvjtbegwrgbchvp', '56N', 'myjytscujjiv', 88649, 'EG', 'India', '2011-05-29', 'Work', 623829691, 'F', 'Home', 'hqmqapgyjn@email.com', 17) ,

(97, 'Janice', 'Mahan', 'Diaz', 454, 'liskhgwvmdfaega', '47N', 'webfemfnxbbi', 12765, 'UO', 'India', '2003-12-29', 'Home', 346249555, 'F', 'Work', 'xpbifompgo@email.com', 15) ,

(98, 'Paul', 'Sottile', 'Moore', 869, 'uqvckodkwmpkupl', '26C', 'attdsbaufsfb', 61181, 'HX', 'India', '2011-11-25', 'Work', 502625816, 'F', 'Home', 'ejptvqwcuf@email.com', 72) ,

(99, 'Marta', 'Rivers', 'Miller', 716, 'inhamthblleudgc', '56Y', 'chyquyxhpmqd', 23537, 'JB', 'India', '2018-03-02', 'Work', 511878115, 'F', 'Work', 'mitjxrvliy@email.com', 78) ,

(100, 'Jason', 'Geiger', 'Haak', 284, 'ouilkwqteurzskn', '84K', 'dzsblysgjovo', 48901, 'EU', 'India', '2020-04-19', 'Home', 165593696, 'F', 'Work', 'zpmruqtoum@email.com', 53);

INSERT INTO Doctors (DoctorID, Doctor_Name_Fname, Doctor_Name_Mname, Doctor_Name_Lname, Specialisation_Description, ContactNumber_type, ContactNumber_number, Email_type, Email_address)
VALUES (1, 'David', 'qjn', 'King', 'jjimxSeeXSbRFADUJwFRjZgEVwTFiDWCuwofYHNIwRrNXFJSHD', 'work', 121086296, 'work', 'XQftYqCwfi@yahoo.com') ,

(2, 'Dale', 'fgP', 'Dawson', 'csHXMkbrbPlwRjVXcLnTcwYyLawQwoRBpfswEpaZwEvUmexbVb', 'work', 181464163, 'work', 'CGfObxyAJK@hotmail.com') ,

(3, 'Amy', 'jnB', 'Oliver', 'FwxaPpIXdPwOjvTBfwsRPrdwUEwlKDFxTVFnHawrtjhtXMBxok', 'home', 311119532, 'work', 'LHdFNqYsxo@gmail.com') ,

(4, 'Michael', 'obN', 'Frazier', 'QdIvolpzNLvYYiHUciYKDMcmILhYPOAepsggFqGUUyPIDUTWWz', 'home', 609348343, 'personal', 'shdVNLxTFW@yahoo.com') ,

(5, 'Emily', 'vre', 'Montgomery', 'AAmTOxnvSQsPPkKsMCKYnXepIZglCZOLMtRhWyWhHxaDehZPsB', 'work', 356866397, 'work', 'iGDFNmlKzC@yahoo.com') ,

(6, 'Janet', 'bjW', 'Barrett', 'DkLjLJAFENvqusuizbPOWOQDqesqRjMCPhICAEWJRFWwzhspCs', 'work', 994726708, 'work', 'gbQlWIUMaN@hotmail.com') ,

(7, 'Barbara', 'nuP', 'Johnson', 'ivKEkFvvYGRDpzbUBkgjhhyVussmKDVPLWFtngfcWYUqllDIvI', 'work', 451196000, 'work', 'AsPjfqkEUY@outlook.com') ,

(8, 'Marilyn', 'Uin', 'Hall', 'kDWScVcEZQmsFwisFEjypEipNxiCWqLkQjmoabPdUsWajtbLHr', 'work', 859591023, 'personal', 'rjxAXueVIJ@outlook.com') ,

(9, 'Sharon', 'efY', 'Hatley', 'LWzJLQKqUGDMYkHitSDpZNLRHkuxrPrXEYJzvzSAqCuycRjDYR', 'home', 32263209, 'work', 'bsZfBhIlBg@hotmail.com') ,

(10, 'Elmer', 'MWK', 'King', 'TXxVpMkDYajxYYLLrjFprALSJStJDWVyZSsTAwrFfblDgOpbuC', 'work', 889547393, 'personal', 'oTmSSqMYHX@hotmail.com') ,

(11, 'Judy', 'GSk', 'Pierce', 'mrbrLxtiRzYtFcKAlUexjnUAMfvCVfBizbRXirEKZchPCPnvfQ', 'work', 850912949, 'personal', 'LDyNxGedxE@outlook.com') ,

(12, 'Gertrude', 'BqG', 'Toscani', 'RiSLiJYFRVaKFJbVjGcPUqVYfQKdjTbUwHXUQVmrNZCDxFkqMO', 'home', 69181897, 'work', 'apizIQCVyw@hotmail.com') ,

(13, 'Carlos', 'wjZ', 'Schultz', 'OPXUNUBbfVNMqXMzDXXpGLaStqzFHubjkKQWRNeWkhzssreVbE', 'home', 705973685, 'personal', 'PdxQikYTRK@yahoo.com') ,

(14, 'Ronald', 'qrn', 'Hamill', 'NaWtGejAzRFacuzbksFUcHWAAcEWuHZESNDcYCIyfyrhTtULWO', 'work', 453345054, 'personal', 'PiaTbNnDZB@outlook.com') ,

(15, 'Fredrick', 'nKv', 'Whittle', 'uWYKLkZyYvEPEVEbubQiNIFnwUcABokmfHYOellyRUDfiLXgeA', 'work', 344507241, 'personal', 'nylmtrYDQE@yahoo.com') ,

(16, 'Sarah', 'xoy', 'Mischler', 'hsmgbuQvrlgnsGtGUWBpaLOaXxUofvahYlTMazbzrjhjTKCnuE', 'work', 829685522, 'work', 'iRPGNubZmU@gmail.com') ,

(17, 'Mike', 'Poy', 'Shepherd', 'KzzVitzoEhTTpUtuqlESEWXQeWiXtTRXdFUDRqhMoiYcSniuYN', 'home', 238042996, 'work', 'KOsqxfcDtG@outlook.com') ,

(18, 'Stacie', 'ham', 'Calabro', 'PUhlINYOuoxQRpgKsjmblAlCiijounrrqhNyrmFbAHMBnseYir', 'work', 119623563, 'personal', 'nFXCWptVoU@hotmail.com') ,

(19, 'Ronald', 'xmx', 'Desmith', 'ZkPGzYgNeCkTwchltClknAkNZFVVTYjnghCycdnKvGvhQoHIPK', 'home', 76653744, 'work', 'YZxlvjVrgh@hotmail.com') ,

(20, 'Roland', 'fMn', 'Chapman', 'IMtbVEKDkMdWbmBBBCZmYvaqYacpBBUZhvDtnUnDDnXIugHFaR', 'work', 520118259, 'work', 'DFeftdcjQv@gmail.com') ,

(21, 'Tracy', 'yHf', 'Lall', 'mvFEqxCQvYYXxHfEElPejkQqaGXRsnCkxSBfzgkjiADUhuFeEF', 'work', 531239418, 'personal', 'musVyOlyLO@hotmail.com') ,

(22, 'Franklin', 'dVB', 'Landry', 'TdwuNtMoUgAjBgPOpgsVeUSFMatMpKQvroIGcsOlCObVjtocPS', 'home', 391053668, 'personal', 'GfUeXYlZSc@yahoo.com') ,

(23, 'Wayne', 'NTM', 'Horton', 'chTIxZTCgMXkpgORUQVApHoZXnxWTvJhFkLsDncKhndEjBIASN', 'home', 938877796, 'personal', 'yecCVGlSdL@hotmail.com') ,

(24, 'Robert', 'MVc', 'Herrera', 'DLNzIkMYqSnySnGAiwRjQyMkDpemTAmCJSqPrsHdolJAuDnmhY', 'home', 785679920, 'work', 'rpokkIAWJR@hotmail.com') ,

(25, 'Oscar', 'PtZ', 'Peterson', 'ykgDkLThaWRaixuQhQVHvBFCOIOtPTOEXSsuNNJiGvyEdoVEya', 'home', 788184185, 'work', 'LkmiNnHYXg@yahoo.com') ,

(26, 'Dorothy', 'lIJ', 'Bell', 'oNnPwPbUMEIwXGAIyxIYGwlaqYsdzLvHWvaoIPQupQuHOTlwIC', 'home', 9879277, 'personal', 'wyvHPCAmmu@gmail.com') ,

(27, 'Guadalupe', 'FhW', 'Mcdougald', 'WYPukMsNCzrCegtycZTvEGhucZSjtgjVcSSoCWXyFBtdpPdyvz', 'home', 717657418, 'work', 'pWqbgPJJxv@hotmail.com') ,

(28, 'Mindy', 'TtZ', 'Cross', 'kvESxrTWyBfGwMPnJIsoRIYpfGpeJbqUJWRrnZHLuURDYpQkUq', 'home', 406335277, 'work', 'VmmFMMVtKR@outlook.com') ,

(29, 'Evelyn', 'pJf', 'Green', 'KVPxrfxjEkwZGOgMskHqCizTTIxdntvVdRzhhZFZiIhNGvBlih', 'home', 389843874, 'work', 'rkZItqIeop@gmail.com') ,

(30, 'Andrea', 'OZs', 'Armstrong', 'IBeFXHDcVRKBUfqAZTPTCEpQLebpxlbRLiGOhwJRgGVdxLrrwO', 'work', 919565780, 'work', 'XjBLILxkVC@hotmail.com') ,

(31, 'Charles', 'Opx', 'Smith', 'fWdoTlBXVKhQvvEDReMpCHPdzGSNJWZqIUvoBCRZmGigJNvfOL', 'work', 952468347, 'work', 'DtUqslFrho@gmail.com') ,

(32, 'Sarah', 'xUU', 'Scherer', 'lcaQZJmfdaQynZIIgfFkUTCzeSVYIjzAFNlbVjUGJdPHShonuA', 'home', 188262098, 'work', 'KTkSNlxowF@hotmail.com') ,

(33, 'Gerald', 'Uzw', 'Steptoe', 'sgKGmWoxnysEXFnUUodqiRyPgNFHyJXPTGlpiUlygZqTfYBnwB', 'work', 813138562, 'personal', 'VcDpwGJFAX@hotmail.com') ,

(34, 'Marion', 'fst', 'Bounds', 'JjAZJwuUEUVosTgvLCbiVDUsAeVGvDEWZBeZzRwtmFkxiQXFyz', 'work', 803403357, 'work', 'hpOUylNsGp@hotmail.com') ,

(35, 'Leon', 'fYm', 'Sixon', 'TvqAalOtCRzeWZRaFpbjSeddWpKTonAbvonbrjcnBJjVKEXZkM', 'work', 740592420, 'personal', 'ordsWvUwJA@outlook.com') ,

(36, 'John', 'suk', 'Lopez', 'HMlgKAuUMIfvSoUpuhIOVJqFUVhZfmYvlhZgiZOKZdOvGSTnso', 'home', 947746866, 'personal', 'zEXGJNbEYM@hotmail.com') ,

(37, 'Michael', 'xvx', 'Howard', 'hKRhWEjPlYPpoVEOLywQVbKvSoDxUdWKMtuwSbfRyToatzniBO', 'work', 303975696, 'personal', 'GKjgiSVZVy@yahoo.com') ,

(38, 'Tyson', 'pcB', 'Hall', 'BxRyCDUAREpggblHfISXhGubYflKTbYDShHmNMrwizGoXgwmLa', 'work', 599464924, 'personal', 'rkVKMMMtRz@outlook.com') ,

(39, 'Edward', 'ueU', 'Bell', 'QpxuBPZiNRkpoufcKpqPcxqWfOJIDsfwXFKBiuNqIgcuOUMdNj', 'home', 135665919, 'work', 'GYCGRvOyPb@yahoo.com') ,

(40, 'Gerald', 'sxz', 'Clarke', 'arYUtQhJeAFykmoYtShftaDaMBsgXFDpzzIfpUOEQtfmvnriLD', 'home', 130014884, 'work', 'GEYXANjRyu@gmail.com') ,

(41, 'Debra', 'acO', 'Velo', 'zdFNNvFAHdzULqBDaCQGsRArVnRYusuUptSEfVemHWCUUcekyv', 'home', 460082472, 'work', 'skBGXvKbEY@gmail.com') ,

(42, 'Virginia', 'KFd', 'Meyers', 'GCVmSWIFNFJIpKISmJTTJFFbllIJodzfCCFaiItXSKSYgSLKMH', 'home', 714602263, 'work', 'oHwrHngowE@gmail.com') ,

(43, 'Kimberly', 'vxB', 'Lacoste', 'AQGjzTypywwsudpjuuIceDMvRoFVXqoxLuwNZTMzwnxoBkSech', 'home', 118436780, 'work', 'oYyWowQTxh@outlook.com') ,

(44, 'Ethel', 'HvE', 'Hairston', 'xSavWOqSNHQcUvWMskoqaIfNWTdWZbdImtumHigAYjZqBMcRss', 'home', 507741122, 'personal', 'jmTZaMCGCr@yahoo.com') ,

(45, 'Francis', 'THn', 'Schmidt', 'RwmgWoVBYdcwoaYukoVeRfEwKrwifuVxlGVmSivPhlHIBNknRQ', 'home', 842668431, 'personal', 'iieDebacZG@gmail.com') ,

(46, 'Clarence', 'LyE', 'Russ', 'gFRmsINpDgmeOrOuyEoonNOHmwoSVTUUCgBnnbQDovhoiuRCxe', 'home', 644134281, 'personal', 'IFgtBfgBKU@hotmail.com') ,

(47, 'Ruth', 'gOK', 'Hendricks', 'TDQmfsweoLjCeTwsJLPqQzKyVRvZoSRHGoKxinGHQFaZzLkjTX', 'work', 98874266, 'personal', 'iNbJQfSMlj@gmail.com') ,

(48, 'Gail', 'Sbr', 'Mercado', 'DCfTbyYkoAnJGeIvcDGCpcVzAOjCdgCxSdyanjWqzvkbvppLOF', 'work', 812887430, 'personal', 'KEAeHdwvuV@gmail.com') ,

(49, 'Norma', 'rZp', 'Romero', 'MWOgqrwmEUhMFuhFFhRIomVhkbGXbxzFQIvuTFLRqPgyBoDhQj', 'work', 44784750, 'work', 'AKCLSXJnba@yahoo.com') ,

(50, 'William', 'wow', 'Wentz', 'IyegAYbvKqScqMRxyWNEMZXSETzsFZLVZcdIxpArTCvFpKrtgm', 'home', 31984426, 'personal', 'pDgEhPiLMz@gmail.com') ,

(51, 'Linda', 'wpe', 'Kilday', 'YLLZjXQFhVlIrtOfxNQybWnntLLLUVhnLDXUQnGpGnWmiUDNrH', 'home', 961900672, 'personal', 'eCkFkBNkio@yahoo.com') ,

(52, 'Shelly', 'sRm', 'Vilven', 'ejjDyXyftNdwuKvFakMlmZiEOmPESRQjZcjCcrBMAZErohyPsF', 'home', 977957947, 'work', 'nxyyuUvtDT@hotmail.com') ,

(53, 'Tessa', 'Aiq', 'Blake', 'NXmbNuEtnAxqTAexfuMLEuLEJpvvSfpSltiKoeweeqdQKKzYQE', 'home', 550163665, 'work', 'BFdTQNEJeV@hotmail.com') ,

(54, 'Marcia', 'AuU', 'Gibbons', 'AeLcvCGKTHMsQqzcaJtIoVJbIiJYdgSqOKQCDLvufCvvFHXQwe', 'home', 925453960, 'work', 'FhXjLpkPcP@hotmail.com') ,

(55, 'Juan', 'XpR', 'Corral', 'ziAjoNDKQrytTbkvgsXyLsHCfMRFLfXEkOTpgRgvKJDozGKVed', 'home', 741666670, 'personal', 'gFJhMNxJjk@yahoo.com') ,

(56, 'Juan', 'urk', 'Ferrara', 'YUhbxspuxjsKTgYcvjRgHLCVWlVdbAfyZUEfwswTvKbvDweIGn', 'home', 842256785, 'personal', 'yMIlzJPZQw@outlook.com') ,

(57, 'Dean', 'wsL', 'Jackson', 'sjdiRWmXxeivBNYeCTITrTrJkOwLmCbUFeppjwibvCtNeFNXGY', 'work', 231335282, 'work', 'aBQoxTlgzi@gmail.com') ,

(58, 'Darnell', 'dPP', 'Adams', 'QbAkmsTwdxmkhOZCcImbSSgIwQVQoMRAhjnYHRPgPUDfTwHGNV', 'home', 391837133, 'personal', 'eTBrGvGiJc@hotmail.com') ,

(59, 'Susan', 'Wkz', 'Nunn', 'jCKSxYcFFRNvMvCEhiAlIukkdueoKDyPsDbyZdXdeFnippCpVY', 'work', 373008723, 'personal', 'UdCuiMNWpQ@outlook.com') ,

(60, 'Sara', 'htW', 'Tracy', 'WJNMSnHHheIWWADMfAmSPYGrcHzkAMMSKwXoetQuSDVLxfoGbm', 'home', 178249079, 'personal', 'jRveruvBbs@yahoo.com') ,

(61, 'Dana', 'Gdp', 'Anderson', 'VUjuLkTyHGeChUJirMnWUSFzjuFyPROVbSaFrVGJYLKXQKahtq', 'work', 159854012, 'personal', 'xVaJtsZqgA@outlook.com') ,

(62, 'Carol', 'ESQ', 'Murray', 'OCvIdEayOVVGmiTDCLuwoBMswplhTvLWLZHSKxpTUYvIEdgRGS', 'work', 34756872, 'work', 'DwECCtgYsN@hotmail.com') ,

(63, 'William', 'yce', 'Majors', 'PxczQnLAiXMZUSriywvEsbWmcjXaNpWgKaoiLAfZMMkIXNgXMY', 'home', 213533720, 'personal', 'OvJWnyLFaz@outlook.com') ,

(64, 'Marvin', 'VfN', 'Henry', 'YoxdPEJECEPdPURjzhZXVTgNteTSOErfvAXdyfQZqrAjCTZtzV', 'home', 444366847, 'work', 'KaiIGIpfcA@hotmail.com') ,

(65, 'Allen', 'Ldu', 'Porter', 'gmZaOvLWhHlsZdnzxKRPPbSGAYzQUwIcgBCznodJxljrpScYlL', 'work', 316449214, 'work', 'VpVcschtQX@hotmail.com') ,

(66, 'Linda', 'LSo', 'Flowers', 'FMoWYdCmdVFkaaYGDHruyzwysvfRegQTqTsDDmcmmUOfZzRaoP', 'home', 828172542, 'work', 'eniMOGdkbZ@outlook.com') ,

(67, 'Carolyn', 'ivu', 'Schuyler', 'jjYxnvjfnzPRobbwZJAUqTEpEumNlLWOFZVrxBesqPpNwnOplz', 'work', 282047940, 'work', 'mcoCXYaMbf@gmail.com') ,

(68, 'Dorothy', 'iIy', 'Stewart', 'spJHkYGrxAAibXjeBaubVHpQfJHHBetZulUSKukNhiNcfPzhDz', 'work', 541489800, 'work', 'raoffjtXdK@gmail.com') ,

(69, 'Kenneth', 'ksu', 'Flowers', 'cKfpsHQkgKzsRTHaLVInwgbelrCLiyfhYnLYqNmmHdIpiBQOvw', 'work', 866445448, 'personal', 'TdHspXDCzl@yahoo.com') ,

(70, 'Jim', 'yqd', 'Brown', 'DCRhhQRehhWGAfbnvSjytEvaMtlkkTIaEjaiOGqEbOYzELQtyY', 'work', 377222988, 'work', 'ioGBizaIUN@hotmail.com') ,

(71, 'Paul', 'Ksx', 'Gillespie', 'ORSsFQpfElyIseWCRrJZLGxquJKnOUhcBpBGLxoqGjfSyBBWsq', 'work', 382972488, 'work', 'byuJOZFlGS@hotmail.com') ,

(72, 'William', 'kuK', 'Guerra', 'rUQXVfIjzJXlBOhaTwWoOYyZvyhPQAfSvxMztnzyjwRTgrfoel', 'work', 639769767, 'personal', 'XUZcZHmcTW@gmail.com') ,

(73, 'Jennifer', 'xut', 'Tague', 'lgLnbNkrcFhoYooDgsxsVxLCPKlRNXKYVgheEUNWPHODLzxZMc', 'work', 964275611, 'work', 'WQSnTtkubu@hotmail.com') ,

(74, 'Joseph', 'lUL', 'Flores', 'FKFUsmPJtXJZASOaDoWphpIPmxPsiWWMHYOeizQMWfKnkPSDJr', 'home', 424236688, 'personal', 'Phyjjhkrql@hotmail.com') ,

(75, 'Eric', 'GTy', 'Baker', 'iciPYNAaerztMObhGUiEMFwGxWiwVpWmTPjJZcJSAefxJbsahu', 'home', 39777904, 'work', 'QjHgNtybPW@outlook.com') ,

(76, 'Susan', 'XDx', 'Thompson', 'jXGZuVaZeSFvsrjvoKhLosxsuEgSGogaCUiEdAdrGkvvgiQAbu', 'home', 354128366, 'personal', 'ODNLxgrQfG@yahoo.com') ,

(77, 'Todd', 'KiA', 'Fisher', 'aneboEtYTuALpyyIFqkIYpzskbayDEzwJiHcRoyPJCdPMWZbwb', 'work', 599878171, 'work', 'UVHSWwuLca@hotmail.com') ,

(78, 'James', 'iAD', 'White', 'rvoShpfnqnayKFWkOjDzcNMGQBIGemUMFNCktvGogqGhcsWJKZ', 'work', 687331188, 'work', 'laCGMOZTRy@outlook.com') ,

(79, 'Anthony', 'pNs', 'Meyer', 'zBqYztCxkIAnUAjrosQgVHccyFftOqCkjYFQWoeFktVDYuwnyE', 'work', 786907910, 'work', 'NXCOeOaSsm@outlook.com') ,

(80, 'Margaret', 'dpO', 'Willadsen', 'aviGUOEEoIgpHNxmrzyvLQUYaiJhvIIwUIzWuBjBxLkGEJXefy', 'work', 967785582, 'personal', 'YbPiFVIRof@outlook.com') ,

(81, 'Susan', 'FKI', 'Cervantes', 'qJrkuviGJLRhlkcscshOtHvHWUqJdxckkFepBhylXzvmrmfCFz', 'work', 399899078, 'personal', 'RKlkYmUooy@hotmail.com') ,

(82, 'Yong', 'Ntk', 'Summers', 'uOnlFOgNiBUZzVJbaluqwGFrhgXnWFhcyUgGghBPcEJUljZcJM', 'work', 374520614, 'work', 'QDIhbXHPqR@yahoo.com') ,

(83, 'Sandra', 'BTA', 'Gonzalez', 'vlWEtiFXByUMghqXIIXFNEhtuUJJSnEPrPBZSattaFmfMXseEv', 'home', 531832651, 'personal', 'XeYRwNorfN@yahoo.com') ,

(84, 'Robert', 'FaE', 'Larson', 'sqTSmTJZUBKrlGhtUBLEjAnxVsnpmvaqrgxXtaqPEDiHSsEpTP', 'work', 824412426, 'work', 'BraCPGMXmK@outlook.com') ,

(85, 'Belinda', 'xjL', 'Cocco', 'boKfxNTdRRteZHPxTOvyEzdYaEYpIJGxcObOinJpjYdFIsLgXM', 'home', 470213892, 'work', 'TvIKGjUmBn@yahoo.com') ,

(86, 'Norma', 'pME', 'Gibeau', 'cDyIySQsuyRaCXTPmMhhNdguAQQQGWheTxMMXUOpjBtGgeJnyA', 'home', 314700535, 'personal', 'RRljkFuHyP@hotmail.com') ,

(87, 'Kathie', 'Iar', 'Fitzpatrick', 'elbIqKbvBfBDrHAlZkwcDzvJPcwfrFGwuAmTKCFWHXerQEXnVD', 'work', 110557089, 'work', 'MOKoHlVQqF@yahoo.com') ,

(88, 'Antonio', 'OFS', 'Condon', 'lcraXglcJqaFuSaYxdzyWekLsdPlCRKbJoBKFRLMvuXSuEijAA', 'home', 195584292, 'personal', 'oNSdjFrPCB@gmail.com') ,

(89, 'Betty', 'PnA', 'Chambers', 'yUKxHjIoncCBVwQbwwgLDcUZYOKxWhqxAcjmqdOLeZHhnYnJUU', 'work', 785028109, 'work', 'iKkEqJCWqh@outlook.com') ,

(90, 'Rebecca', 'FHZ', 'Angulo', 'oPyZMfQsGkvdfGQhlGGLLBTBvnvUpqVGaTRfHnXMXbHJsphAmm', 'home', 825242376, 'work', 'JqoweSLvgj@outlook.com') ,

(91, 'Ernest', 'avR', 'Daniels', 'IsJOOYgBtbiaxVAlnqTHqgVWxCoiEHTGnIgIeyBBYsSJuEYJOE', 'home', 186160837, 'work', 'PEMkmzcbNv@gmail.com') ,

(92, 'Brad', 'zVp', 'Matthew', 'cGgxeuKQiPsdRgXAgUYBQyZWjUkCBHloOFUGopgeQhwPwyuFtW', 'home', 518684409, 'personal', 'kdArwtNJGo@hotmail.com') ,

(93, 'Michael', 'aDV', 'Brown', 'QjRpdMUMScVmoQyOUkTmUqQfVhmmQSFNBkLVjtTgkycqTIEWif', 'home', 751375688, 'personal', 'OFiFXveeYo@gmail.com') ,

(94, 'Stanford', 'fyv', 'Davis', 'ypiZLxCAzuCLJdWFnjedsOvMSMqAjmaSRsYpHbhEjadSKWEClN', 'work', 2641495, 'personal', 'oiVHSIzgHJ@gmail.com') ,

(95, 'Reba', 'yMd', 'Sharp', 'lHQlKzRuGnhyRumnXjqxvmROdRvEwEDpsrKxYRYLRqEpyyvqlv', 'home', 539276394, 'personal', 'WPXjmKWoEO@yahoo.com') ,

(96, 'Patrick', 'Uqz', 'Gold', 'KPLFZQvopMNjVjwGuwSGtIzeRFIMBHSCMcYzwVkZXlGbxyGrKj', 'work', 159563039, 'personal', 'GxQrhnRDsG@gmail.com') ,

(97, 'Thomas', 'MiQ', 'Jeronimo', 'QjhsBPdBuLMkghjCpdfMCbEqadNpDHKoSULrjlwctnOahiKFMC', 'home', 403064586, 'personal', 'QXWIkPSpyY@hotmail.com') ,

(98, 'Louise', 'DLl', 'Fisher', 'mauxOsqNCUIYZIoOCpEqAmbtnHbHsEnZhyxlVoJEpiPeVTaHCx', 'work', 95922892, 'work', 'gWUONDyEvU@gmail.com') ,

(99, 'Diana', 'cPO', 'Spieth', 'DWbXGwpKUvApmGRTIrgesEFaypbsoCJRKYtzNbNHipokVGFFZk', 'work', 787670681, 'personal', 'xTylwzQkOS@outlook.com') ,

(100, 'Billy', 'pDH', 'Hall', 'FOoKxQmCzABKEJOVUrZYxVIRjcLoMXQOvYdYekHBFGvFbdguFP', 'work', 589327851, 'personal', 'KewKSLdHqi@outlook.com');

ALTER TABLE Suppliers
MODIFY ContactNumber_number BIGINT;

INSERT INTO Suppliers (SupplierID, Supplier_Name_Fname, Supplier_Name_Mname, Supplier_Name_Lname, ContactNumber_type, ContactNumber_number, Email_Address, Email_Type, Address, Address_Type)
VALUES  (1, 'Jacqueline', 'EpS', 'Glynn', 'work', '8613480996', 'jhZxGaZ@yahoo.com', 'work', 'LMttujUmnQ, htD, ohqep, MX 01438', 'home') ,

(2, 'Victor', 'Npy', 'Johnson', 'work', '9502918973', 'JUTsZAA@yahoo.com', 'work', 'qjPsNOAXly, Cmc, XFucQ, jm 55012', 'home') ,

(3, 'Ida', 'UDp', 'Skidmore', 'work', '3720243211', 'FLnTqAp@hotmail.com', 'personal', 'aaixiUEEMA, nOR, BDqOT, Tc 04614', 'work') ,

(4, 'Peter', 'FQc', 'Restrepo', 'work', '6135155670', 'HYmJoLw@hotmail.com', 'personal', 'eqQbiJSIjX, DQo, ohsjq, Jh 45640', 'home') ,

(5, 'Calvin', 'rda', 'Slama', 'work', '4647110467', 'incFkEq@yahoo.com', 'work', 'UuLUsRJczu, Umg, Dswlv, Dw 56974', 'home') ,

(6, 'Tanya', 'iYu', 'Jordan', 'home', '3917413585', 'PUEawVY@outlook.com', 'work', 'EyjTuANaob, LxQ, vheIX, vn 26991', 'home') ,

(7, 'Gerry', 'SbB', 'Wilson', 'home', '9410030771', 'ExFXdLj@gmail.com', 'work', 'pzURdXOzFi, SWQ, AWsPB, vn 33911', 'work') ,

(8, 'John', 'JIp', 'Sandoval', 'work', '9972199923', 'xxmUYiv@outlook.com', 'work', 'exOXdoWkSU, ikB, ZnwMs, Rd 24009', 'work') ,

(9, 'Monica', 'vkR', 'March', 'home', '5899932966', 'mUAFxqN@hotmail.com', 'personal', 'lTQJNMRulz, Efa, bilMc, GF 71706', 'home') ,

(10, 'Edna', 'VnJ', 'Houser', 'work', '1772610820', 'NxkRMeN@outlook.com', 'personal', 'obiuAsMFAx, HTT, yxILU, UM 91361', 'work') ,

(11, 'Jeffrey', 'UvH', 'Davila', 'work', '3752531418', 'UheVimc@hotmail.com', 'work', 'PkmCUsyZkv, FbX, IIhBV, bc 18887', 'home') ,

(12, 'Melissa', 'JKJ', 'Barfoot', 'home', '5144080059', 'gIMnKuR@yahoo.com', 'work', 'VfCjWlSsjA, ChZ, exESM, Tk 67693', 'home') ,

(13, 'Trent', 'trv', 'Schwulst', 'home', '2879275946', 'NcFmGPJ@yahoo.com', 'work', 'NrZwStGHrD, zhl, OUGme, ss 15265', 'home') ,

(14, 'Evelyn', 'yLE', 'Gribble', 'work', '8992767483', 'aIgdLMr@outlook.com', 'work', 'VbnkxzNlZi, rbf, nTzwI, DX 87730', 'home') ,

(15, 'Thomas', 'RCQ', 'Varnado', 'work', '2856988268', 'WOlKhUx@gmail.com', 'work', 'AcRocKanrV, Wne, pRbNB, Ab 44286', 'work') ,

(16, 'Lauren', 'JbK', 'Jones', 'work', '0731667709', 'sdUTSIR@hotmail.com', 'work', 'WxEbYWdmyG, LJL, WWRxp, Ny 67254', 'home') ,

(17, 'Janet', 'lpv', 'Phillips', 'home', '9478473331', 'cWDfxzx@hotmail.com', 'work', 'toftQeGknf, jwi, LqlXO, di 83026', 'home') ,

(18, 'Joan', 'RdM', 'Porter', 'home', '8325942719', 'KuSCQgO@hotmail.com', 'personal', 'GLkIKDkLuy, QgA, egkFK, gX 65104', 'home') ,

(19, 'Bessie', 'zgo', 'Fuentes', 'work', '1320805223', 'EKGrneO@hotmail.com', 'work', 'xDwRuvkPeD, JNb, EIygH, TQ 15025', 'home') ,

(20, 'Linda', 'rKf', 'Kent', 'home', '3023618035', 'owZaJrj@yahoo.com', 'work', 'uVUzvQJZVC, JHR, hbooL, TD 10986', 'home') ,

(21, 'Alice', 'FYN', 'Kubinski', 'work', '4408431449', 'bVijpcG@outlook.com', 'work', 'fYffzvdspW, zMY, LvLns, Sh 57605', 'work') ,

(22, 'Nancy', 'odG', 'Tangri', 'home', '6998904225', 'yRoAvPC@yahoo.com', 'work', 'wZzHOTtTHG, ApI, WxPpL, Xh 49823', 'work') ,

(23, 'Leah', 'AuK', 'Guinn', 'work', '7616694733', 'OIpAina@hotmail.com', 'personal', 'LnJoVgBebW, hre, EfwjF, hZ 70541', 'home') ,

(24, 'Nancy', 'Wox', 'Jones', 'home', '3022462644', 'tGuwfSK@gmail.com', 'work', 'JoWypgsbQP, PES, qoSnn, UY 75243', 'work') ,

(25, 'Tia', 'cgF', 'Mills', 'home', '1113331266', 'YOIDrYc@hotmail.com', 'work', 'lVcBaVVdQL, KQS, SMKMm, Ga 71553', 'work') ,

(26, 'Horace', 'sZE', 'Welte', 'home', '2292524756', 'RZeMLEW@hotmail.com', 'personal', 'VorsPeBGGJ, UZF, bTImB, HD 55095', 'work') ,

(27, 'Florence', 'gzJ', 'Fields', 'work', '7935150395', 'TaImxvH@gmail.com', 'work', 'leKGSyjgvZ, YCN, HXUjz, vB 52946', 'home') ,

(28, 'Johnnie', 'mQN', 'Sturtz', 'work', '1952986283', 'xoyAWsx@hotmail.com', 'personal', 'lMLADeQJOT, WwF, LrCXO, xF 84645', 'home') ,

(29, 'Marsha', 'WHY', 'Rivera', 'work', '6982505711', 'mVUPaFI@yahoo.com', 'work', 'rlCXqgzlkz, HTM, Iejgm, eV 18811', 'home') ,

(30, 'Don', 'bPZ', 'Rhodes', 'work', '1768417526', 'KSeUVfS@gmail.com', 'personal', 'chaQkfxcqb, dJZ, khHoF, wI 78300', 'home') ,

(31, 'Kenneth', 'PfU', 'James', 'home', '6237445454', 'Huazmav@hotmail.com', 'personal', 'eLmpxvfoBU, mQM, lYdSc, Vj 82517', 'work') ,

(32, 'John', 'Ltk', 'Riddle', 'home', '8324630844', 'FzqNkrq@yahoo.com', 'work', 'CNreencvSN, DZg, lnLRK, zg 13797', 'work') ,

(33, 'Edna', 'JFH', 'Kubo', 'work', '1335622517', 'zrpZKEM@yahoo.com', 'work', 'XWRJeuQVCj, Aym, pVqnz, Sy 00689', 'home') ,

(34, 'Lavada', 'jXu', 'Harvey', 'work', '7070070938', 'EQXGLPC@gmail.com', 'work', 'PewgAuAmhB, FCm, JaaUg, Ej 19916', 'home') ,

(35, 'Janice', 'Hfo', 'Bonnette', 'work', '0963528542', 'itkkMGb@gmail.com', 'personal', 'UbtEqrHcYF, jPE, mAyWw, AY 57552', 'work') ,

(36, 'Gloria', 'wLG', 'Alicea', 'home', '1341144229', 'KWhUaAq@gmail.com', 'personal', 'pvPtJqJaYg, Pqq, RfbVw, Wz 19232', 'work') ,

(37, 'David', 'bDv', 'Enoch', 'home', '0712912689', 'bvtFFEl@hotmail.com', 'work', 'oJviIOHlcG, tGH, wHdbr, Qo 57651', 'home') ,

(38, 'Joseph', 'ZeY', 'Chen', 'home', '8078776346', 'GHDtBEf@hotmail.com', 'personal', 'XflVXAXfgq, utV, oiVod, uS 56857', 'home') ,

(39, 'Cary', 'RBI', 'Holmes', 'work', '2943481577', 'fluUpmC@hotmail.com', 'work', 'YQQWtYbvwb, yWS, NpGBw, RQ 84061', 'work') ,

(40, 'Penni', 'jkE', 'Mayoka', 'home', '9151621491', 'LtRVgcX@gmail.com', 'work', 'PKqYockOQQ, MnK, iSZRY, hf 57601', 'home') ,

(41, 'Victoria', 'QwZ', 'Wilson', 'home', '9847687616', 'utAZfro@hotmail.com', 'personal', 'HBXHcfEtEA, yUJ, BAirc, cG 90048', 'work') ,

(42, 'Thomas', 'yzE', 'Pickett', 'work', '5592642112', 'atBoWTb@yahoo.com', 'work', 'eVjQrvCqnT, wzM, vBBOw, Na 59289', 'home') ,

(43, 'Vivian', 'yez', 'Korewdit', 'home', '8237011738', 'OALiXED@outlook.com', 'work', 'pvrZEJQpGB, jZS, gdHHx, Ks 62386', 'home') ,

(44, 'Angela', 'ssK', 'Mcclain', 'home', '3400166648', 'ZnEUpTo@hotmail.com', 'work', 'vxeAEoWIQk, ixt, dhHCz, Wv 22333', 'home') ,

(45, 'Eric', 'uXZ', 'Eslinger', 'home', '8759895130', 'CKdexus@hotmail.com', 'work', 'BWnsGGmPoL, oev, lcNdm, Io 13147', 'home') ,

(46, 'Norman', 'pwE', 'Stokes', 'home', '3272292367', 'EhteDUG@gmail.com', 'work', 'eUiAjmGBTK, Snk, FzCGA, gT 67982', 'home') ,

(47, 'William', 'VWO', 'Wooster', 'home', '9110421294', 'TvflJXJ@hotmail.com', 'personal', 'GYQLyzjmOw, bzG, fQerE, TJ 77208', 'home') ,

(48, 'Rosa', 'faf', 'Cook', 'home', '8215564504', 'uRFUeLP@hotmail.com', 'work', 'KJqBhCEiAQ, Xpb, zbcqb, XB 96162', 'work') ,

(49, 'Matthew', 'VQM', 'Colter', 'work', '0919846293', 'xRfBVbv@hotmail.com', 'work', 'EJiuYuMCvO, INo, wmTnL, Bs 68564', 'home') ,

(50, 'Jose', 'oEN', 'Snead', 'work', '0420263128', 'wXzeBaq@outlook.com', 'personal', 'DYLfEpzRCQ, uiJ, Qhjir, gK 23046', 'home') ,

(51, 'Chase', 'Zwm', 'Thomas', 'home', '5823318471', 'HgEXQbn@yahoo.com', 'personal', 'wQAcJQNHdx, twP, mXBMU, eY 29843', 'home') ,

(52, 'Jessica', 'mKu', 'Olson', 'work', '4719055149', 'bqwmTpN@hotmail.com', 'work', 'LKkWSCCnAC, ipn, OTtdY, TR 77869', 'home') ,

(53, 'Michael', 'Izj', 'Cooper', 'work', '0381814611', 'rJFZPLX@outlook.com', 'work', 'SqZQyiFxlb, SOh, czUSA, La 23833', 'work') ,

(54, 'Gabriel', 'auk', 'Frey', 'home', '1874998579', 'khzNEYK@outlook.com', 'work', 'xMxWGSLovi, zwQ, EClCt, cw 39696', 'home') ,

(55, 'Richard', 'QlP', 'Beaver', 'work', '9964965407', 'CnpxbeY@yahoo.com', 'work', 'KpKUFkJZDO, LQf, WZrsD, HD 05252', 'work') ,

(56, 'Kathy', 'zxW', 'Presnell', 'home', '8271353865', 'sLYJInX@gmail.com', 'personal', 'xcwjtVfore, Ikj, pTbWN, AA 52967', 'home') ,

(57, 'Rosemary', 'CrH', 'Weaver', 'home', '0676489355', 'rSZHfpw@outlook.com', 'work', 'vtuNRjcLOc, Bwm, urAQf, Qj 94255', 'home') ,

(58, 'Donna', 'CUs', 'Stollsteimer', 'work', '1922898461', 'TjTYasr@outlook.com', 'personal', 'qbMdetDXkJ, vNa, DHRvr, kK 78936', 'home') ,

(59, 'Brianna', 'pyC', 'Emery', 'work', '1213080214', 'ewolmhC@hotmail.com', 'personal', 'ocOenbrXtI, Bfv, wkyEU, pc 54066', 'home') ,

(60, 'Kristina', 'vkg', 'Clay', 'work', '1983121642', 'hBCHnRC@yahoo.com', 'work', 'qTZZnVJPys, sqh, VRXdm, Kb 68515', 'work') ,

(61, 'Constance', 'kuQ', 'Carnes', 'work', '5749074875', 'JHPEpGo@outlook.com', 'work', 'tPyTfTvCHw, sTF, mQOTY, un 23824', 'home') ,

(62, 'Nadine', 'lUg', 'Pfeiff', 'work', '3873196815', 'WbtQwvf@outlook.com', 'personal', 'EeMavyEfLS, UQY, RuBsq, Le 15398', 'home') ,

(63, 'Diana', 'VEO', 'Broadnax', 'work', '7114765315', 'skzYSNJ@outlook.com', 'personal', 'sskJVrrNbX, NNP, TbZES, Di 41692', 'home') ,

(64, 'Richard', 'CoK', 'Dowdle', 'home', '6514547744', 'rqgWTSa@outlook.com', 'work', 'vZIJWAhbME, BaF, XnwbP, yo 30173', 'work') ,

(65, 'Lisa', 'tgc', 'Guinn', 'home', '3360680539', 'JFLkvzI@outlook.com', 'work', 'HYcvDDNOWy, eSN, XXMir, Sy 65059', 'work') ,

(66, 'Jose', 'pYt', 'Oakman', 'work', '8755915590', 'HnXLYad@gmail.com', 'personal', 'OVWrsxmuVs, QJZ, kqJPM, ue 23077', 'work') ,

(67, 'Franchesca', 'kRp', 'Amundsen', 'work', '8925504657', 'NebLgEb@gmail.com', 'personal', 'TlxCyLyYGr, UnL, Mkehx, Ni 02522', 'work') ,

(68, 'Brenda', 'oRP', 'Seaberry', 'home', '3776620531', 'XsPDozX@outlook.com', 'work', 'yiHeGkMYzF, WMq, vWxnk, eo 48984', 'work') ,

(69, 'Gregory', 'Khc', 'Miller', 'work', '0612225238', 'UuTVjrC@yahoo.com', 'personal', 'RsnJWsdGjq, vcD, bIwsu, Wu 37518', 'home') ,

(70, 'Cheryl', 'hgV', 'King', 'work', '7951763189', 'eHBHeLm@gmail.com', 'personal', 'NAWpqSEcqu, jVu, wHQWn, qv 37832', 'work') ,

(71, 'Gloria', 'PrY', 'Whitcher', 'work', '6379287105', 'DliGnPf@yahoo.com', 'personal', 'csYRTdxmlr, Yqz, WIJLS, rc 63559', 'work') ,

(72, 'Dean', 'GfR', 'Richardson', 'home', '6322704322', 'CxwUsXn@hotmail.com', 'work', 'KHxOQEGIcg, mdI, ejkWO, Ah 24201', 'home') ,

(73, 'Rosa', 'FBw', 'Quilliams', 'work', '0673419503', 'MTqRLTF@outlook.com', 'personal', 'OtYAYedYwq, Iwp, MtAtP, DO 07160', 'work') ,

(74, 'Ali', 'uob', 'Moons', 'home', '5029995808', 'GABDuzM@outlook.com', 'work', 'cibfzzunsf, bpI, jvfLT, cr 39055', 'work') ,

(75, 'Wesley', 'eBb', 'Starkes', 'work', '4440555133', 'NwiXMQP@yahoo.com', 'personal', 'HnCaaqTssL, knA, URrBI, eR 74665', 'work') ,

(76, 'Raymond', 'RXm', 'Kim', 'home', '2273318764', 'qWVjErT@hotmail.com', 'work', 'IwzXghVFKB, Xws, jYlbE, re 61324', 'home') ,

(77, 'William', 'Htc', 'Loftin', 'home', '4562356319', 'fKHGuUv@outlook.com', 'personal', 'iLPmgfKKqP, DIv, TpzlB, nG 28324', 'home') ,

(78, 'Thomas', 'KQU', 'Richmond', 'home', '3727085745', 'BiZPdUc@hotmail.com', 'work', 'XAhhOCwiBy, wgd, SzEbx, KC 76574', 'work') ,

(79, 'Darlene', 'pHA', 'Polston', 'home', '4276455332', 'fxpAhqg@outlook.com', 'personal', 'KSmHQOgktz, VoG, tQVvC, KC 15905', 'home') ,

(80, 'Sharon', 'kNb', 'Vaughan', 'home', '9025247945', 'uejkGTV@yahoo.com', 'work', 'PZCQBEeNqO, yXH, sWBMw, fV 52781', 'home') ,

(81, 'Pamela', 'naI', 'Ellis', 'home', '5800936308', 'KWySxLe@hotmail.com', 'personal', 'HfTEnVGvHq, Shs, quPZj, no 18624', 'work') ,

(82, 'Terry', 'ryR', 'Calloway', 'home', '1737053230', 'NdztFln@yahoo.com', 'work', 'zyhhbYfvyt, DtP, VpMpt, Qa 14927', 'work') ,

(83, 'Jeanene', 'ELO', 'Koetje', 'home', '5471110370', 'SyiJlDd@hotmail.com', 'personal', 'gjYyavyuHR, XaH, JQvvW, Bh 31396', 'work') ,

(84, 'Marie', 'Owd', 'King', 'home', '4561318702', 'KfLxELn@yahoo.com', 'work', 'dUWFvbbhTb, Jdm, zFjXZ, AW 46088', 'home') ,

(85, 'Henry', 'cZf', 'Lester', 'home', '5895023285', 'MVpXiPi@yahoo.com', 'work', 'LhbxzYnwHY, EFj, XwXAw, YM 38125', 'work') ,

(86, 'Douglas', 'lLX', 'Babcock', 'work', '7772047482', 'oOQcwKo@yahoo.com', 'personal', 'GBEtwoZGci, GTv, LtjbH, He 07522', 'home') ,

(87, 'Sara', 'IEl', 'Bickford', 'home', '5753853703', 'mdefmqP@hotmail.com', 'personal', 'jYnzqJTPLo, qHl, zGtdP, TZ 21959', 'home') ,

(88, 'Casey', 'QPp', 'Trew', 'home', '0123920387', 'dBiADxr@hotmail.com', 'work', 'IpnrGhQzCN, CZB, qTYgA, mZ 85391', 'home') ,

(89, 'Jacob', 'qpf', 'Repine', 'work', '6158287369', 'IVhzDzX@gmail.com', 'work', 'nEIuMicNUi, gzm, Diaui, YB 53716', 'work') ,

(90, 'Robert', 'gZj', 'Helmus', 'work', '8402356813', 'kJCoXBU@yahoo.com', 'work', 'iaQVHSIwMe, Ulr, IdUGb, sC 88092', 'home') ,

(91, 'Nicole', 'vzj', 'Torres', 'home', '7012378844', 'SBnWbRo@outlook.com', 'personal', 'ubTGsQrKqO, Ayo, KpYkm, qX 57849', 'home') ,

(92, 'Dale', 'pvC', 'Oliver', 'home', '1328901274', 'TyZbRdF@gmail.com', 'work', 'uDIKEpFchj, haG, JTYqb, Dd 40274', 'home') ,

(93, 'Eric', 'tRq', 'Bickerstaff', 'work', '7202287764', 'kbofLor@outlook.com', 'personal', 'vwXBVSObjQ, rpT, IYBaX, lc 91438', 'home') ,

(94, 'Toni', 'oaD', 'Moro', 'home', '8100192451', 'LsRmfvr@gmail.com', 'work', 'alxGLyGjUj, pwe, OSGQO, lK 35884', 'work') ,

(95, 'Kurt', 'niR', 'Perry', 'home', '9755988222', 'XvNScpx@hotmail.com', 'personal', 'NEbwaXxjyi, pQx, awrEz, Rr 59413', 'work') ,

(96, 'Walter', 'BQD', 'Parker', 'home', '3929707857', 'bPChqhh@hotmail.com', 'personal', 'yHoeYcJnaL, NIP, ZQjTA, VY 31165', 'work') ,

(97, 'Thomas', 'wAe', 'Lewis', 'home', '4272304990', 'dwyQvjm@outlook.com', 'work', 'mMwFDxOxnB, pOB, KHWhp, Vk 61024', 'home') ,

(98, 'Jodi', 'JNV', 'Lester', 'work', '3517585728', 'PgKBBJT@hotmail.com', 'work', 'XEZrUnFomV, REv, XmbNL, Gc 50430', 'home') ,

(99, 'Octavia', 'fzT', 'Yeager', 'home', '0899690696', 'kbrfWax@yahoo.com', 'work', 'loocJlKGyZ, Ajd, sHsMW, An 86777', 'home') ,

(100, 'June', 'SAF', 'Figueroa', 'home', '0172297412', 'MyRCrPN@yahoo.com', 'work', 'PDpiwSHwKe, Mhj, VnfbY, wK 73559', 'work');

INSERT INTO Medicines (MedicineID, Name, Composition, Ingredient, Type, Price, Cost, Currency, SupplierID)
VALUES (1, 'Blaine Talley', 'Blaine Talley Compound', 'Hollis Extract', 'Tablet', 20.58, 14.41, 'CAD', 1) ,

(2, 'Mary Ashcraft', 'Mary Ashcraft Compound', 'Gerald Extract', 'Injection', 67.09, 46.96, 'CAD', 2) ,

(3, 'Kelley Rodriguez', 'Kelley Rodriguez Compound', 'Charles Extract', 'Capsule', 12.04, 8.43, 'EUR', 3) ,

(4, 'Paris Parkman', 'Paris Parkman Compound', 'Charles Extract', 'Tablet', 53.81, 37.67, 'CAD', 4) ,

(5, 'Frank Hogg', 'Frank Hogg Compound', 'Doreen Extract', 'Injection', 49.56, 34.69, 'GBP', 5) ,

(6, 'Bonnie Lucia', 'Bonnie Lucia Compound', 'Richard Extract', 'Injection', 95.72, 67.0, 'USD', 6) ,

(7, 'Jennifer Morales', 'Jennifer Morales Compound', 'Craig Extract', 'Drops', 59.4, 41.58, 'USD', 7) ,

(8, 'Deborah Ramirez', 'Deborah Ramirez Compound', 'Nicholas Extract', 'Injection', 8.1, 5.67, 'GBP', 8) ,

(9, 'Connie Fuller', 'Connie Fuller Compound', 'Joel Extract', 'Capsule', 35.76, 25.03, 'CAD', 9) ,

(10, 'Gordon Lee', 'Gordon Lee Compound', 'Logan Extract', 'Injection', 43.69, 30.58, 'EUR', 10) ,

(11, 'Paul Fletcher', 'Paul Fletcher Compound', 'Claude Extract', 'Injection', 18.43, 12.9, 'EUR', 11) ,

(12, 'Joshua Hogan', 'Joshua Hogan Compound', 'Beverly Extract', 'Injection', 99.71, 69.8, 'EUR', 12) ,

(13, 'Dale Gendron', 'Dale Gendron Compound', 'Sylvia Extract', 'Injection', 99.43, 69.6, 'GBP', 13) ,

(14, 'Diane Widener', 'Diane Widener Compound', 'Julie Extract', 'Tablet', 20.8, 14.56, 'CAD', 14) ,

(15, 'Anna Hargrove', 'Anna Hargrove Compound', 'Stephen Extract', 'Syrup', 33.76, 23.63, 'USD', 15) ,

(16, 'Keith Schertz', 'Keith Schertz Compound', 'Charlotte Extract', 'Injection', 56.79, 39.75, 'USD', 16) ,

(17, 'Barbara Self', 'Barbara Self Compound', 'Holly Extract', 'Injection', 48.98, 34.29, 'CAD', 17) ,

(18, 'Geraldine Roberge', 'Geraldine Roberge Compound', 'Sarah Extract', 'Tablet', 76.07, 53.25, 'EUR', 18) ,

(19, 'Viola Mitchell', 'Viola Mitchell Compound', 'Julie Extract', 'Drops', 12.19, 8.53, 'USD', 19) ,

(20, 'Nadine Stark', 'Nadine Stark Compound', 'Thomas Extract', 'Tablet', 23.25, 16.27, 'GBP', 20) ,

(21, 'Constance Fernberg', 'Constance Fernberg Compound', 'John Extract', 'Capsule', 15.9, 11.13, 'USD', 21) ,

(22, 'Jack Soria', 'Jack Soria Compound', 'Gloria Extract', 'Tablet', 15.86, 11.1, 'USD', 22) ,

(23, 'Lauren Chafin', 'Lauren Chafin Compound', 'Luise Extract', 'Syrup', 33.18, 23.23, 'USD', 23) ,

(24, 'Ashley Romain', 'Ashley Romain Compound', 'Cassandra Extract', 'Capsule', 18.63, 13.04, 'INR', 24) ,

(25, 'Billy Young', 'Billy Young Compound', 'Ramon Extract', 'Syrup', 24.28, 17.0, 'USD', 25) ,

(26, 'Carl Fryar', 'Carl Fryar Compound', 'Luis Extract', 'Capsule', 13.66, 9.56, 'INR', 26) ,

(27, 'Sharon Mitchell', 'Sharon Mitchell Compound', 'Martha Extract', 'Tablet', 36.8, 25.76, 'CAD', 27) ,

(28, 'Helen Smith', 'Helen Smith Compound', 'David Extract', 'Capsule', 86.36, 60.45, 'USD', 28) ,

(29, 'Phoebe James', 'Phoebe James Compound', 'Patrick Extract', 'Drops', 80.1, 56.07, 'INR', 29) ,

(30, 'Julia Langston', 'Julia Langston Compound', 'Janet Extract', 'Injection', 68.01, 47.61, 'INR', 30) ,

(31, 'Richard Stein', 'Richard Stein Compound', 'Minerva Extract', 'Capsule', 77.56, 54.29, 'INR', 31) ,

(32, 'Jose Nolan', 'Jose Nolan Compound', 'Carolyn Extract', 'Syrup', 78.8, 55.16, 'GBP', 32) ,

(33, 'Robert Williams', 'Robert Williams Compound', 'Abbie Extract', 'Syrup', 64.99, 45.49, 'USD', 33) ,

(34, 'Cynthia Toon', 'Cynthia Toon Compound', 'Robyn Extract', 'Tablet', 61.62, 43.13, 'INR', 34) ,

(35, 'Martin Dacosta', 'Martin Dacosta Compound', 'Harold Extract', 'Drops', 76.8, 53.76, 'USD', 35) ,

(36, 'Susan Sadler', 'Susan Sadler Compound', 'Belinda Extract', 'Drops', 88.44, 61.91, 'EUR', 36) ,

(37, 'Justin Lopez', 'Justin Lopez Compound', 'Brenda Extract', 'Capsule', 48.48, 33.94, 'CAD', 37) ,

(38, 'Leroy Knost', 'Leroy Knost Compound', 'Mina Extract', 'Syrup', 58.02, 40.61, 'INR', 38) ,

(39, 'Kittie Carpenter', 'Kittie Carpenter Compound', 'Bobby Extract', 'Drops', 59.19, 41.43, 'CAD', 39) ,

(40, 'Cynthia Green', 'Cynthia Green Compound', 'Janice Extract', 'Capsule', 19.56, 13.69, 'CAD', 40) ,

(41, 'Adrienne Patrone', 'Adrienne Patrone Compound', 'Ethel Extract', 'Capsule', 98.7, 69.09, 'USD', 41) ,

(42, 'Willie Ross', 'Willie Ross Compound', 'Florentino Extract', 'Tablet', 35.27, 24.69, 'GBP', 42) ,

(43, 'Shawn Rose', 'Shawn Rose Compound', 'Randal Extract', 'Injection', 82.54, 57.78, 'EUR', 43) ,

(44, 'Mary Guzman', 'Mary Guzman Compound', 'Patricia Extract', 'Tablet', 18.62, 13.03, 'INR', 44) ,

(45, 'Robert Hernandez', 'Robert Hernandez Compound', 'Mark Extract', 'Syrup', 24.05, 16.84, 'INR', 45) ,

(46, 'Raymond Perry', 'Raymond Perry Compound', 'Joseph Extract', 'Drops', 21.16, 14.81, 'EUR', 46) ,

(47, 'Joseph Knight', 'Joseph Knight Compound', 'Corrinne Extract', 'Syrup', 95.6, 66.92, 'EUR', 47) ,

(48, 'Alison Dolan', 'Alison Dolan Compound', 'Renee Extract', 'Tablet', 33.31, 23.32, 'EUR', 48) ,

(49, 'Reatha Duque', 'Reatha Duque Compound', 'Ryan Extract', 'Capsule', 84.33, 59.03, 'CAD', 49) ,

(50, 'Marguerite Greenwell', 'Marguerite Greenwell Compound', 'Charles Extract', 'Syrup', 69.94, 48.96, 'INR', 50) ,

(51, 'Heike Scott', 'Heike Scott Compound', 'Donald Extract', 'Syrup', 5.9, 4.13, 'INR', 51) ,

(52, 'Carol Penrose', 'Carol Penrose Compound', 'Ricardo Extract', 'Capsule', 88.4, 61.88, 'USD', 52) ,

(53, 'Lauren Clark', 'Lauren Clark Compound', 'Molly Extract', 'Tablet', 51.86, 36.3, 'USD', 53) ,

(54, 'Nina Edge', 'Nina Edge Compound', 'Kathleen Extract', 'Tablet', 1.97, 1.38, 'CAD', 54) ,

(55, 'Frank Carson', 'Frank Carson Compound', 'Kimberly Extract', 'Capsule', 10.27, 7.19, 'GBP', 55) ,

(56, 'Dustin Campbell', 'Dustin Campbell Compound', 'Krystal Extract', 'Drops', 7.81, 5.47, 'INR', 56) ,

(57, 'William Boner', 'William Boner Compound', 'Barbara Extract', 'Drops', 83.81, 58.67, 'GBP', 57) ,

(58, 'Jose Elliott', 'Jose Elliott Compound', 'Matthew Extract', 'Drops', 77.59, 54.31, 'EUR', 58) ,

(59, 'Jack Carr', 'Jack Carr Compound', 'Irwin Extract', 'Tablet', 5.55, 3.88, 'GBP', 59) ,

(60, 'Karen Bulloch', 'Karen Bulloch Compound', 'Jeremy Extract', 'Drops', 77.6, 54.32, 'EUR', 60) ,

(61, 'Perry Murray', 'Perry Murray Compound', 'Patricia Extract', 'Capsule', 23.53, 16.47, 'EUR', 61) ,

(62, 'Terry Kresge', 'Terry Kresge Compound', 'Randy Extract', 'Capsule', 64.81, 45.37, 'EUR', 62) ,

(63, 'Latoya Radley', 'Latoya Radley Compound', 'Jonathan Extract', 'Drops', 38.9, 27.23, 'EUR', 63) ,

(64, 'Mathew Awalt', 'Mathew Awalt Compound', 'Jed Extract', 'Drops', 55.78, 39.05, 'GBP', 64) ,

(65, 'Mary Sellers', 'Mary Sellers Compound', 'Demetrius Extract', 'Drops', 83.04, 58.13, 'EUR', 65) ,

(66, 'Mary Walt', 'Mary Walt Compound', 'David Extract', 'Tablet', 44.13, 30.89, 'USD', 66) ,

(67, 'Eric Ruiz', 'Eric Ruiz Compound', 'Marie Extract', 'Drops', 65.28, 45.7, 'INR', 67) ,

(68, 'Brenda Baez', 'Brenda Baez Compound', 'Maria Extract', 'Drops', 61.71, 43.2, 'EUR', 68) ,

(69, 'Shawn Chapman', 'Shawn Chapman Compound', 'Marie Extract', 'Capsule', 53.67, 37.57, 'EUR', 69) ,

(70, 'Beverley Brown', 'Beverley Brown Compound', 'Gene Extract', 'Syrup', 71.76, 50.23, 'CAD', 70) ,

(71, 'Joan Marciniak', 'Joan Marciniak Compound', 'Justin Extract', 'Capsule', 79.84, 55.89, 'INR', 71) ,

(72, 'Gladys Dick', 'Gladys Dick Compound', 'Laverne Extract', 'Capsule', 61.89, 43.32, 'INR', 72) ,

(73, 'Henrietta Palma', 'Henrietta Palma Compound', 'Joseph Extract', 'Capsule', 29.33, 20.53, 'EUR', 73) ,

(74, 'Stephen Martinez', 'Stephen Martinez Compound', 'Charlie Extract', 'Tablet', 74.33, 52.03, 'EUR', 74) ,

(75, 'Dale Barnes', 'Dale Barnes Compound', 'David Extract', 'Tablet', 88.58, 62.01, 'INR', 75) ,

(76, 'Hector Decaire', 'Hector Decaire Compound', 'Michael Extract', 'Syrup', 1.06, 0.74, 'INR', 76) ,

(77, 'Mary Peterson', 'Mary Peterson Compound', 'Martin Extract', 'Injection', 19.02, 13.31, 'INR', 77) ,

(78, 'Michael May', 'Michael May Compound', 'Gary Extract', 'Capsule', 64.26, 44.98, 'USD', 78) ,

(79, 'Darline Reed', 'Darline Reed Compound', 'Peter Extract', 'Injection', 33.72, 23.6, 'CAD', 79) ,

(80, 'Margaret Vandy', 'Margaret Vandy Compound', 'Rickey Extract', 'Drops', 11.13, 7.79, 'USD', 80) ,

(81, 'Tamara Gunderson', 'Tamara Gunderson Compound', 'Aaron Extract', 'Capsule', 39.94, 27.96, 'INR', 81) ,

(82, 'Lauren Schulte', 'Lauren Schulte Compound', 'Ursula Extract', 'Tablet', 6.3, 4.41, 'USD', 82) ,

(83, 'Patricia Reis', 'Patricia Reis Compound', 'Jeffrey Extract', 'Syrup', 66.42, 46.49, 'GBP', 83) ,

(84, 'Frances Solomons', 'Frances Solomons Compound', 'Ralph Extract', 'Capsule', 37.08, 25.96, 'INR', 84) ,

(85, 'Jennifer Griffin', 'Jennifer Griffin Compound', 'Emery Extract', 'Capsule', 87.87, 61.51, 'EUR', 85) ,

(86, 'Phylis Pinneo', 'Phylis Pinneo Compound', 'Larry Extract', 'Drops', 87.98, 61.59, 'GBP', 86) ,

(87, 'Jill Goff', 'Jill Goff Compound', 'Virginia Extract', 'Tablet', 67.02, 46.91, 'CAD', 87) ,

(88, 'Willie Watson', 'Willie Watson Compound', 'Dennis Extract', 'Tablet', 28.07, 19.65, 'EUR', 88) ,

(89, 'Fanny Hicks', 'Fanny Hicks Compound', 'Eva Extract', 'Tablet', 14.01, 9.81, 'CAD', 89) ,

(90, 'Daniel Leblanc', 'Daniel Leblanc Compound', 'Charles Extract', 'Drops', 72.54, 50.78, 'CAD', 90) ,

(91, 'Michael Priest', 'Michael Priest Compound', 'Jessica Extract', 'Capsule', 63.16, 44.21, 'CAD', 91) ,

(92, 'Peter Flett', 'Peter Flett Compound', 'Kathleen Extract', 'Capsule', 34.76, 24.33, 'INR', 92) ,

(93, 'Amanda Mullenbach', 'Amanda Mullenbach Compound', 'Stephen Extract', 'Capsule', 5.66, 3.96, 'GBP', 93) ,

(94, 'Michael Wilkerson', 'Michael Wilkerson Compound', 'Lavonne Extract', 'Syrup', 85.84, 60.09, 'CAD', 94) ,

(95, 'Howard Lobato', 'Howard Lobato Compound', 'Larry Extract', 'Tablet', 90.22, 63.15, 'EUR', 95) ,

(96, 'Angela Rembert', 'Angela Rembert Compound', 'Mike Extract', 'Injection', 29.36, 20.55, 'EUR', 96) ,

(97, 'Juana Borne', 'Juana Borne Compound', 'Veronica Extract', 'Drops', 26.97, 18.88, 'EUR', 97) ,

(98, 'Ronda Goldbeck', 'Ronda Goldbeck Compound', 'Shirley Extract', 'Drops', 70.49, 49.34, 'GBP', 98) ,

(99, 'Renee Linares', 'Renee Linares Compound', 'Keenan Extract', 'Syrup', 71.43, 50.0, 'EUR', 99) ,

(100, 'Ruth Stanley', 'Ruth Stanley Compound', 'Elaine Extract', 'Capsule', 15.67, 10.97, 'INR', 100);

INSERT INTO Prescription (PrescriptionID, DoctorID, PatientID, MedicineID, Dosage, Duration_Days, StartDate, EndDate, Date, DateWritten)
VALUES (1, 3, 51, 11, 20, 6, '2020-07-04', '2020-07-10', '2020-07-04', '2020-07-04') ,

(2, 67, 41, 68, 40, 7, '2021-11-14', '2021-11-21', '2021-11-14', '2021-11-14') ,

(3, 28, 67, 84, 10, 6, '2021-01-05', '2021-01-11', '2021-01-05', '2021-01-05') ,

(4, 59, 16, 87, 50, 3, '2021-03-14', '2021-03-17', '2021-03-14', '2021-03-14') ,

(5, 42, 93, 96, 20, 5, '2021-07-15', '2021-07-20', '2021-07-15', '2021-07-15') ,

(6, 58, 63, 51, 80, 21, '2020-10-12', '2020-11-02', '2020-10-12', '2020-10-12') ,

(7, 57, 55, 37, 40, 7, '2020-05-10', '2020-05-17', '2020-05-10', '2020-05-10') ,

(8, 57, 48, 65, 60, 6, '2021-05-04', '2021-05-10', '2021-05-04', '2021-05-04') ,

(9, 56, 88, 75, 70, 1, '2020-06-22', '2020-06-23', '2020-06-22', '2020-06-22') ,

(10, 4, 77, 3, 70, 4, '2021-05-31', '2021-06-04', '2021-05-31', '2021-05-31') ,

(11, 3, 67, 53, 30, 3, '2020-08-03', '2020-08-06', '2020-08-03', '2020-08-03') ,

(12, 29, 61, 9, 40, 7, '2020-08-31', '2020-09-07', '2020-08-31', '2020-08-31') ,

(13, 64, 48, 83, 10, 2, '2020-01-26', '2020-01-28', '2020-01-26', '2020-01-26') ,

(14, 29, 99, 53, 30, 1, '2021-12-17', '2021-12-18', '2021-12-17', '2021-12-17') ,

(15, 69, 58, 15, 20, 3, '2020-03-28', '2020-03-31', '2020-03-28', '2020-03-28') ,

(16, 94, 22, 49, 100, 30, '2021-04-22', '2021-05-22', '2021-04-22', '2021-04-22') ,

(17, 8, 60, 3, 20, 7, '2020-09-01', '2020-09-08', '2020-09-01', '2020-09-01') ,

(18, 58, 31, 24, 80, 2, '2020-11-15', '2020-11-17', '2020-11-15', '2020-11-15') ,

(19, 99, 78, 99, 50, 1, '2020-02-20', '2020-02-21', '2020-02-20', '2020-02-20') ,

(20, 4, 57, 76, 80, 21, '2020-05-04', '2020-05-25', '2020-05-04', '2020-05-04') ,

(21, 41, 67, 89, 10, 14, '2020-04-08', '2020-04-22', '2020-04-08', '2020-04-08') ,

(22, 47, 55, 3, 70, 5, '2021-11-10', '2021-11-15', '2021-11-10', '2021-11-10') ,

(23, 90, 44, 55, 80, 30, '2021-01-29', '2021-02-28', '2021-01-29', '2021-01-29') ,

(24, 87, 18, 85, 20, 14, '2020-09-24', '2020-10-08', '2020-09-24', '2020-09-24') ,

(25, 26, 11, 80, 40, 21, '2020-02-10', '2020-03-02', '2020-02-10', '2020-02-10') ,

(26, 77, 53, 46, 10, 21, '2020-01-04', '2020-01-25', '2020-01-04', '2020-01-04') ,

(27, 97, 47, 20, 10, 30, '2020-12-10', '2021-01-09', '2020-12-10', '2020-12-10') ,

(28, 44, 44, 29, 90, 3, '2021-01-17', '2021-01-20', '2021-01-17', '2021-01-17') ,

(29, 55, 72, 42, 100, 6, '2020-06-09', '2020-06-15', '2020-06-09', '2020-06-09') ,

(30, 49, 61, 78, 100, 1, '2020-05-31', '2020-06-01', '2020-05-31', '2020-05-31') ,

(31, 19, 74, 40, 10, 14, '2020-05-28', '2020-06-11', '2020-05-28', '2020-05-28') ,

(32, 74, 40, 79, 90, 7, '2021-04-07', '2021-04-14', '2021-04-07', '2021-04-07') ,

(33, 64, 3, 65, 30, 1, '2020-02-13', '2020-02-14', '2020-02-13', '2020-02-13') ,

(34, 81, 67, 11, 70, 3, '2020-01-23', '2020-01-26', '2020-01-23', '2020-01-23') ,

(35, 64, 30, 17, 90, 30, '2020-10-09', '2020-11-08', '2020-10-09', '2020-10-09') ,

(36, 82, 8, 3, 60, 5, '2020-07-15', '2020-07-20', '2020-07-15', '2020-07-15') ,

(37, 88, 17, 32, 30, 21, '2020-03-16', '2020-04-06', '2020-03-16', '2020-03-16') ,

(38, 17, 69, 100, 40, 2, '2020-03-15', '2020-03-17', '2020-03-15', '2020-03-15') ,

(39, 47, 67, 73, 60, 6, '2020-04-26', '2020-05-02', '2020-04-26', '2020-04-26') ,

(40, 65, 100, 30, 30, 7, '2020-02-27', '2020-03-05', '2020-02-27', '2020-02-27') ,

(41, 58, 17, 92, 20, 7, '2021-04-25', '2021-05-02', '2021-04-25', '2021-04-25') ,

(42, 4, 4, 79, 30, 6, '2021-10-24', '2021-10-30', '2021-10-24', '2021-10-24') ,

(43, 73, 84, 93, 50, 2, '2021-07-07', '2021-07-09', '2021-07-07', '2021-07-07') ,

(44, 54, 76, 85, 100, 14, '2021-06-01', '2021-06-15', '2021-06-01', '2021-06-01') ,

(45, 73, 75, 46, 50, 30, '2021-04-04', '2021-05-04', '2021-04-04', '2021-04-04') ,

(46, 33, 37, 48, 100, 1, '2020-12-03', '2020-12-04', '2020-12-03', '2020-12-03') ,

(47, 89, 39, 21, 20, 6, '2021-04-11', '2021-04-17', '2021-04-11', '2021-04-11') ,

(48, 55, 90, 97, 40, 4, '2020-02-08', '2020-02-12', '2020-02-08', '2020-02-08') ,

(49, 20, 98, 47, 100, 5, '2020-11-17', '2020-11-22', '2020-11-17', '2020-11-17') ,

(50, 71, 78, 92, 30, 5, '2020-11-21', '2020-11-26', '2020-11-21', '2020-11-21') ,

(51, 79, 22, 26, 50, 5, '2020-08-13', '2020-08-18', '2020-08-13', '2020-08-13') ,

(52, 4, 42, 15, 30, 30, '2021-04-22', '2021-05-22', '2021-04-22', '2021-04-22') ,

(53, 84, 4, 19, 90, 21, '2021-04-08', '2021-04-29', '2021-04-08', '2021-04-08') ,

(54, 35, 74, 81, 10, 5, '2020-09-03', '2020-09-08', '2020-09-03', '2020-09-03') ,

(55, 3, 54, 29, 20, 4, '2021-08-19', '2021-08-23', '2021-08-19', '2021-08-19') ,

(56, 74, 99, 79, 70, 7, '2020-07-27', '2020-08-03', '2020-07-27', '2020-07-27') ,

(57, 39, 23, 53, 20, 14, '2020-12-12', '2020-12-26', '2020-12-12', '2020-12-12') ,

(58, 7, 25, 81, 50, 4, '2020-12-14', '2020-12-18', '2020-12-14', '2020-12-14') ,

(59, 14, 70, 35, 40, 7, '2020-11-24', '2020-12-01', '2020-11-24', '2020-11-24') ,

(60, 92, 15, 34, 40, 2, '2020-09-11', '2020-09-13', '2020-09-11', '2020-09-11') ,

(61, 87, 21, 41, 30, 14, '2020-08-24', '2020-09-07', '2020-08-24', '2020-08-24') ,

(62, 55, 84, 51, 40, 6, '2021-10-19', '2021-10-25', '2021-10-19', '2021-10-19') ,

(63, 93, 66, 75, 80, 6, '2020-10-02', '2020-10-08', '2020-10-02', '2020-10-02') ,

(64, 32, 75, 84, 90, 5, '2020-03-11', '2020-03-16', '2020-03-11', '2020-03-11') ,

(65, 92, 41, 5, 90, 5, '2021-10-26', '2021-10-31', '2021-10-26', '2021-10-26') ,

(66, 35, 10, 58, 90, 30, '2020-02-01', '2020-03-02', '2020-02-01', '2020-02-01') ,

(67, 27, 70, 52, 90, 30, '2020-07-31', '2020-08-30', '2020-07-31', '2020-07-31') ,

(68, 4, 80, 90, 50, 3, '2021-05-31', '2021-06-03', '2021-05-31', '2021-05-31') ,

(69, 7, 15, 22, 60, 21, '2021-08-17', '2021-09-07', '2021-08-17', '2021-08-17') ,

(70, 80, 44, 42, 40, 30, '2021-07-21', '2021-08-20', '2021-07-21', '2021-07-21') ,

(71, 41, 95, 58, 100, 3, '2021-12-09', '2021-12-12', '2021-12-09', '2021-12-09') ,

(72, 52, 87, 98, 20, 4, '2021-08-24', '2021-08-28', '2021-08-24', '2021-08-24') ,

(73, 70, 91, 64, 100, 30, '2021-07-03', '2021-08-02', '2021-07-03', '2021-07-03') ,

(74, 19, 24, 8, 40, 14, '2020-09-09', '2020-09-23', '2020-09-09', '2020-09-09') ,

(75, 18, 62, 36, 70, 5, '2020-01-05', '2020-01-10', '2020-01-05', '2020-01-05') ,

(76, 88, 3, 41, 100, 14, '2020-12-25', '2021-01-08', '2020-12-25', '2020-12-25') ,

(77, 19, 39, 36, 20, 7, '2020-10-14', '2020-10-21', '2020-10-14', '2020-10-14') ,

(78, 44, 39, 34, 60, 3, '2020-04-19', '2020-04-22', '2020-04-19', '2020-04-19') ,

(79, 21, 67, 95, 90, 21, '2020-07-09', '2020-07-30', '2020-07-09', '2020-07-09') ,

(80, 99, 94, 93, 20, 2, '2021-06-11', '2021-06-13', '2021-06-11', '2021-06-11') ,

(81, 57, 46, 91, 20, 3, '2021-03-18', '2021-03-21', '2021-03-18', '2021-03-18') ,

(82, 78, 74, 47, 50, 5, '2020-04-14', '2020-04-19', '2020-04-14', '2020-04-14') ,

(83, 48, 89, 26, 90, 1, '2021-12-21', '2021-12-22', '2021-12-21', '2021-12-21') ,

(84, 14, 72, 23, 90, 7, '2021-12-05', '2021-12-12', '2021-12-05', '2021-12-05') ,

(85, 52, 36, 83, 40, 3, '2020-01-02', '2020-01-05', '2020-01-02', '2020-01-02') ,

(86, 34, 39, 5, 40, 1, '2020-10-25', '2020-10-26', '2020-10-25', '2020-10-25') ,

(87, 3, 50, 57, 50, 7, '2021-09-06', '2021-09-13', '2021-09-06', '2021-09-06') ,

(88, 49, 86, 8, 60, 1, '2020-10-05', '2020-10-06', '2020-10-05', '2020-10-05') ,

(89, 98, 25, 59, 30, 4, '2020-03-24', '2020-03-28', '2020-03-24', '2020-03-24') ,

(90, 46, 17, 20, 20, 2, '2021-11-20', '2021-11-22', '2021-11-20', '2021-11-20') ,

(91, 47, 87, 23, 10, 5, '2020-01-07', '2020-01-12', '2020-01-07', '2020-01-07') ,

(92, 67, 4, 81, 80, 1, '2020-09-01', '2020-09-02', '2020-09-01', '2020-09-01') ,

(93, 15, 89, 65, 90, 30, '2020-08-12', '2020-09-11', '2020-08-12', '2020-08-12') ,

(94, 51, 34, 43, 30, 1, '2020-08-09', '2020-08-10', '2020-08-09', '2020-08-09') ,

(95, 14, 84, 13, 50, 6, '2021-02-24', '2021-03-02', '2021-02-24', '2021-02-24') ,

(96, 62, 59, 94, 90, 14, '2020-06-24', '2020-07-08', '2020-06-24', '2020-06-24') ,

(97, 36, 96, 51, 70, 6, '2021-10-16', '2021-10-22', '2021-10-16', '2021-10-16') ,

(98, 55, 14, 75, 70, 1, '2021-02-01', '2021-02-02', '2021-02-01', '2021-02-01') ,

(99, 95, 30, 18, 50, 6, '2021-10-03', '2021-10-09', '2021-10-03', '2021-10-03') ,

(100, 52, 74, 52, 10, 3, '2020-01-21', '2020-01-24', '2020-01-21', '2020-01-21');

ALTER TABLE Pharmacists
MODIFY ContactNumber_number BIGINT;

INSERT INTO Pharmacists (PharmacistID, Pharmacists_Name_Fname, Pharmacists_Name_Mname, Pharmacists_Name_Lname, ContactNumber_type, ContactNumber_number, Email_Address, Email_Type, Qualification_yearOfGraduation, Qualification_FieldOfStudy) 
VALUES  (1, 'Ernestine', 'Jean', 'Steele', 'Mobile', '126124844', 'Ernestine.Steele@example.com', 'Personal', 2019, 'Pharmacology') ,

(2, 'Thelma', 'Alicia', 'Bowl', 'Work', '949461992', 'Thelma.Bowl@example.com', 'Personal', 1987, 'Pharmacology') ,

(3, 'Edward', 'Robert', 'Scott', 'Home', '826187706', 'Edward.Scott@example.com', 'Personal', 2014, 'Pharmacology') ,

(4, 'Jeffrey', 'Jeanine', 'Schmidt', 'Home', '342609596', 'Jeffrey.Schmidt@example.com', 'Personal', 1985, 'Pharmaceutical Science') ,

(5, 'Lawanda', 'Irene', 'Donaldson', 'Mobile', '980333551', 'Lawanda.Donaldson@example.com', 'Work', 1992, 'Pharmaceutical Science') ,

(6, 'Cornelia', 'Nicole', 'Hazel', 'Work', '124025388', 'Cornelia.Hazel@example.com', 'Personal', 2020, 'Pharmacy') ,

(7, 'Raymond', 'Rose', 'Mercer', 'Mobile', '856629441', 'Raymond.Mercer@example.com', 'Personal', 2007, 'Pharmacy') ,

(8, 'Haywood', 'Luis', 'Pasillas', 'Mobile', '702471229', 'Haywood.Pasillas@example.com', 'Work', 2017, 'Pharmaceutical Science') ,

(9, 'Christina', 'Mark', 'Johnson', 'Mobile', '998999287', 'Christina.Johnson@example.com', 'Work', 2014, 'Pharmacy') ,

(10, 'Cassandra', 'Debbie', 'Prewitt', 'Work', '462412383', 'Cassandra.Prewitt@example.com', 'Work', 1984, 'Pharmacology') ,

(11, 'George', 'Wilfredo', 'Gonzalez', 'Work', '358679125', 'George.Gonzalez@example.com', 'Work', 1993, 'Pharmacology') ,

(12, 'Sheryl', 'Billy', 'Koonce', 'Work', '652292641', 'Sheryl.Koonce@example.com', 'Work', 1995, 'Pharmacology') ,

(13, 'Ethelyn', 'Stanley', 'Sicard', 'Mobile', '496070354', 'Ethelyn.Sicard@example.com', 'Work', 2008, 'Pharmacy') ,

(14, 'Jeremy', 'Dennis', 'Hyman', 'Work', '834636350', 'Jeremy.Hyman@example.com', 'Work', 2004, 'Pharmaceutical Science') ,

(15, 'Timothy', 'Charles', 'Santiago', 'Work', '192124896', 'Timothy.Santiago@example.com', 'Personal', 1998, 'Pharmacy') ,

(16, 'Anthony', 'Angela', 'Rayome', 'Work', '838335419', 'Anthony.Rayome@example.com', 'Work', 2014, 'Pharmacology') ,

(17, 'Todd', 'Robert', 'Rude', 'Work', '541547243', 'Todd.Rude@example.com', 'Work', 2005, 'Pharmacy') ,

(18, 'Michael', 'Natalie', 'Smith', 'Home', '382044355', 'Michael.Smith@example.com', 'Personal', 1999, 'Pharmaceutical Science') ,

(19, 'Frank', 'Stanley', 'Ross', 'Mobile', '335044866', 'Frank.Ross@example.com', 'Work', 2005, 'Pharmacology') ,

(20, 'Wallace', 'Clint', 'Ross', 'Work', '989668116', 'Wallace.Ross@example.com', 'Personal', 1999, 'Pharmacy') ,

(21, 'Martha', 'Matthew', 'Miller', 'Home', '152784818', 'Martha.Miller@example.com', 'Work', 1985, 'Pharmacology') ,

(22, 'William', 'Claude', 'Poore', 'Mobile', '368823773', 'William.Poore@example.com', 'Work', 1999, 'Pharmacy') ,

(23, 'Ethel', 'Jean', 'Sofia', 'Work', '952814281', 'Ethel.Sofia@example.com', 'Personal', 2006, 'Pharmacology') ,

(24, 'Joseph', 'Martha', 'Jones', 'Home', '541336098', 'Joseph.Jones@example.com', 'Work', 2012, 'Pharmaceutical Science') ,

(25, 'Susan', 'Betty', 'Bancroft', 'Home', '815938359', 'Susan.Bancroft@example.com', 'Personal', 1983, 'Pharmaceutical Science') ,

(26, 'Isabelle', 'Kathleen', 'Perez', 'Work', '793147475', 'Isabelle.Perez@example.com', 'Work', 1996, 'Pharmacology') ,

(27, 'Rashad', 'Karen', 'Schmitt', 'Home', '627646999', 'Rashad.Schmitt@example.com', 'Work', 1998, 'Pharmaceutical Science') ,

(28, 'Isaiah', 'Elizabeth', 'Coffell', 'Home', '654220363', 'Isaiah.Coffell@example.com', 'Work', 1980, 'Pharmaceutical Science') ,

(29, 'Pamela', 'Beverly', 'Hawkins', 'Work', '906995537', 'Pamela.Hawkins@example.com', 'Personal', 2006, 'Pharmacy') ,

(30, 'Robbie', 'Brian', 'Skinner', 'Mobile', '206940090', 'Robbie.Skinner@example.com', 'Personal', 1989, 'Pharmacy') ,

(31, 'Ashley', 'Lindy', 'Ryan', 'Home', '612105950', 'Ashley.Ryan@example.com', 'Work', 1989, 'Pharmaceutical Science') ,

(32, 'Jermaine', 'Roy', 'Morvant', 'Work', '436902127', 'Jermaine.Morvant@example.com', 'Personal', 2019, 'Pharmacology') ,

(33, 'Winifred', 'Julia', 'Mcgrath', 'Work', '253624703', 'Winifred.Mcgrath@example.com', 'Work', 2003, 'Pharmaceutical Science') ,

(34, 'Tamara', 'Leonard', 'Collins', 'Work', '412143613', 'Tamara.Collins@example.com', 'Work', 2007, 'Pharmacy') ,

(35, 'Richard', 'Charles', 'Brandt', 'Home', '924825597', 'Richard.Brandt@example.com', 'Work', 2000, 'Pharmacology') ,

(36, 'Timothy', 'Peter', 'Hudson', 'Work', '381602957', 'Timothy.Hudson@example.com', 'Work', 1982, 'Pharmaceutical Science') ,

(37, 'Shane', 'Damian', 'Hubbard', 'Mobile', '979233404', 'Shane.Hubbard@example.com', 'Work', 2007, 'Pharmacy') ,

(38, 'Victor', 'Tiffany', 'Klein', 'Home', '675040890', 'Victor.Klein@example.com', 'Personal', 2009, 'Pharmaceutical Science') ,

(39, 'Edna', 'Linda', 'Balliew', 'Mobile', '709555827', 'Edna.Balliew@example.com', 'Personal', 1992, 'Pharmacy') ,

(40, 'Pat', 'Evelyn', 'Larkins', 'Work', '166372110', 'Pat.Larkins@example.com', 'Personal', 1992, 'Pharmaceutical Science') ,

(41, 'Juan', 'Mary', 'Griffin', 'Mobile', '877349904', 'Juan.Griffin@example.com', 'Personal', 2020, 'Pharmaceutical Science') ,

(42, 'Ruby', 'Helen', 'Ramirez', 'Work', '675359213', 'Ruby.Ramirez@example.com', 'Work', 1987, 'Pharmaceutical Science') ,

(43, 'Samuel', 'Irene', 'Wine', 'Mobile', '437971200', 'Samuel.Wine@example.com', 'Personal', 1998, 'Pharmaceutical Science') ,

(44, 'Sara', 'Carole', 'Gills', 'Mobile', '833063916', 'Sara.Gills@example.com', 'Work', 2020, 'Pharmaceutical Science') ,

(45, 'Lawrence', 'Dave', 'Poyner', 'Mobile', '405247162', 'Lawrence.Poyner@example.com', 'Personal', 1996, 'Pharmacology') ,

(46, 'Mary', 'Cheri', 'Pope', 'Work', '347436756', 'Mary.Pope@example.com', 'Work', 2019, 'Pharmacology') ,

(47, 'Noe', 'Charles', 'Larson', 'Home', '468596104', 'Noe.Larson@example.com', 'Personal', 1983, 'Pharmaceutical Science') ,

(48, 'Karl', 'Lettie', 'Root', 'Mobile', '956014503', 'Karl.Root@example.com', 'Personal', 2003, 'Pharmaceutical Science') ,

(49, 'Roy', 'Jamie', 'Wiley', 'Home', '502736600', 'Roy.Wiley@example.com', 'Work', 2000, 'Pharmacy') ,

(50, 'Ruben', 'Gerald', 'Coleman', 'Work', '132968770', 'Ruben.Coleman@example.com', 'Personal', 2013, 'Pharmacy') ,

(51, 'Wade', 'Grace', 'Sum', 'Mobile', '664056223', 'Wade.Sum@example.com', 'Personal', 1981, 'Pharmaceutical Science') ,

(52, 'Kristine', 'Bonnie', 'Erway', 'Home', '411402237', 'Kristine.Erway@example.com', 'Work', 1980, 'Pharmaceutical Science') ,

(53, 'Mauricio', 'John', 'Reyes', 'Work', '320563164', 'Mauricio.Reyes@example.com', 'Personal', 2005, 'Pharmacy') ,

(54, 'Dario', 'Susan', 'Toon', 'Work', '286725227', 'Dario.Toon@example.com', 'Personal', 2008, 'Pharmaceutical Science') ,

(55, 'Mary', 'Pauline', 'Hall', 'Mobile', '797767560', 'Mary.Hall@example.com', 'Work', 1981, 'Pharmaceutical Science') ,

(56, 'Monica', 'Mary', 'Rivera', 'Home', '498019406', 'Monica.Rivera@example.com', 'Personal', 2010, 'Pharmacy') ,

(57, 'Carey', 'Juan', 'Grossen', 'Home', '514206201', 'Carey.Grossen@example.com', 'Work', 1998, 'Pharmacology') ,

(58, 'Lisa', 'Felicitas', 'Motte', 'Mobile', '525712842', 'Lisa.Motte@example.com', 'Work', 2003, 'Pharmacology') ,

(59, 'Hubert', 'Emily', 'Ray', 'Mobile', '390727804', 'Hubert.Ray@example.com', 'Work', 2019, 'Pharmaceutical Science') ,

(60, 'Frances', 'Jeanne', 'Jennings', 'Work', '673463275', 'Frances.Jennings@example.com', 'Work', 2001, 'Pharmacology') ,

(61, 'Max', 'Jeffrey', 'Lopez', 'Home', '290739883', 'Max.Lopez@example.com', 'Work', 1984, 'Pharmacology') ,

(62, 'Consuela', 'Roy', 'Murphy', 'Home', '245468832', 'Consuela.Murphy@example.com', 'Work', 2017, 'Pharmacology') ,

(63, 'Elizabeth', 'Robert', 'Jacobs', 'Home', '561570071', 'Elizabeth.Jacobs@example.com', 'Personal', 1987, 'Pharmaceutical Science') ,

(64, 'Jonathan', 'Doris', 'Parsons', 'Work', '528003476', 'Jonathan.Parsons@example.com', 'Work', 1988, 'Pharmacology') ,

(65, 'Mary', 'Veronica', 'Amante', 'Mobile', '571643380', 'Mary.Amante@example.com', 'Work', 2011, 'Pharmacology') ,

(66, 'Steve', 'Lannie', 'Seay', 'Work', '854057678', 'Steve.Seay@example.com', 'Work', 2003, 'Pharmacology') ,

(67, 'Leslie', 'Lorena', 'Rossano', 'Mobile', '828392760', 'Leslie.Rossano@example.com', 'Personal', 2003, 'Pharmaceutical Science') ,

(68, 'Lee', 'Carolyn', 'Roby', 'Work', '733711353', 'Lee.Roby@example.com', 'Work', 1995, 'Pharmacology') ,

(69, 'Robert', 'James', 'Clark', 'Home', '332213173', 'Robert.Clark@example.com', 'Work', 2020, 'Pharmacology') ,

(70, 'Randy', 'Claude', 'Lorello', 'Work', '111207011', 'Randy.Lorello@example.com', 'Work', 1983, 'Pharmaceutical Science') ,

(71, 'Shelly', 'Kenneth', 'Gloeckner', 'Home', '755431060', 'Shelly.Gloeckner@example.com', 'Work', 1996, 'Pharmacy') ,

(72, 'Thomas', 'Carlos', 'Phelan', 'Work', '713854913', 'Thomas.Phelan@example.com', 'Work', 2012, 'Pharmacology') ,

(73, 'Adolfo', 'Donald', 'Strong', 'Home', '915520698', 'Adolfo.Strong@example.com', 'Personal', 1988, 'Pharmacology') ,

(74, 'Nicole', 'Bill', 'Johnson', 'Home', '477778243', 'Nicole.Johnson@example.com', 'Work', 1991, 'Pharmacy') ,

(75, 'Carole', 'Eloise', 'Avent', 'Home', '679252792', 'Carole.Avent@example.com', 'Work', 2018, 'Pharmacology') ,

(76, 'Peter', 'Vivian', 'Redding', 'Mobile', '370720818', 'Peter.Redding@example.com', 'Work', 2000, 'Pharmaceutical Science') ,

(77, 'Lindsay', 'Mike', 'Hentz', 'Work', '404627022', 'Lindsay.Hentz@example.com', 'Personal', 2017, 'Pharmaceutical Science') ,

(78, 'Sandy', 'Jonathon', 'Natera', 'Home', '129789991', 'Sandy.Natera@example.com', 'Work', 1988, 'Pharmacology') ,

(79, 'Roni', 'Elizabeth', 'Akim', 'Home', '457847551', 'Roni.Akim@example.com', 'Work', 1993, 'Pharmacology') ,

(80, 'Eugene', 'Jane', 'Veazey', 'Mobile', '264120425', 'Eugene.Veazey@example.com', 'Work', 1981, 'Pharmaceutical Science') ,

(81, 'Brett', 'Eric', 'Coleman', 'Mobile', '538290209', 'Brett.Coleman@example.com', 'Work', 1982, 'Pharmacology') ,

(82, 'Rosaura', 'Stacy', 'Jones', 'Mobile', '277438319', 'Rosaura.Jones@example.com', 'Work', 1996, 'Pharmacology') ,

(83, 'Cheryl', 'John', 'Banks', 'Work', '836149157', 'Cheryl.Banks@example.com', 'Personal', 1983, 'Pharmacy') ,

(84, 'Mae', 'Jose', 'Webb', 'Work', '720699598', 'Mae.Webb@example.com', 'Work', 1991, 'Pharmaceutical Science') ,

(85, 'James', 'Edna', 'Overstreet', 'Home', '747541401', 'James.Overstreet@example.com', 'Work', 1992, 'Pharmaceutical Science') ,

(86, 'Terry', 'Dortha', 'Loose', 'Mobile', '979030000', 'Terry.Loose@example.com', 'Work', 2005, 'Pharmaceutical Science') ,

(87, 'Cleo', 'John', 'Vaquera', 'Home', '134215572', 'Cleo.Vaquera@example.com', 'Personal', 1983, 'Pharmaceutical Science') ,

(88, 'Adrian', 'Patty', 'Channel', 'Work', '574508452', 'Adrian.Channel@example.com', 'Personal', 2019, 'Pharmacology') ,

(89, 'Yvonne', 'Terry', 'Maohu', 'Work', '412094590', 'Yvonne.Maohu@example.com', 'Personal', 2000, 'Pharmaceutical Science') ,

(90, 'Lisa', 'Jamie', 'Stone', 'Mobile', '747292848', 'Lisa.Stone@example.com', 'Personal', 2015, 'Pharmacology') ,

(91, 'Wayne', 'Roslyn', 'Morgan', 'Home', '219624892', 'Wayne.Morgan@example.com', 'Personal', 1993, 'Pharmacology') ,

(92, 'Faith', 'Consuelo', 'Amore', 'Mobile', '352082507', 'Faith.Amore@example.com', 'Personal', 1981, 'Pharmacy') ,

(93, 'Harold', 'Nellie', 'Johnson', 'Work', '740322246', 'Harold.Johnson@example.com', 'Work', 2008, 'Pharmacology') ,

(94, 'Jennifer', 'Paula', 'Powell', 'Mobile', '923276071', 'Jennifer.Powell@example.com', 'Work', 1990, 'Pharmacology') ,

(95, 'Jose', 'Donald', 'Mcleod', 'Mobile', '870085480', 'Jose.Mcleod@example.com', 'Personal', 2014, 'Pharmaceutical Science') ,

(96, 'Rodrigo', 'Rosemary', 'Johnson', 'Mobile', '482162257', 'Rodrigo.Johnson@example.com', 'Personal', 1982, 'Pharmacy') ,

(97, 'Martha', 'Merle', 'Farish', 'Work', '648857250', 'Martha.Farish@example.com', 'Work', 1996, 'Pharmacology') ,

(98, 'Mark', 'Valentin', 'Kinney', 'Home', '150471405', 'Mark.Kinney@example.com', 'Personal', 2019, 'Pharmacy') ,

(99, 'Thomas', 'Stephen', 'Anderson', 'Mobile', '226477284', 'Thomas.Anderson@example.com', 'Personal', 2015, 'Pharmaceutical Science') ,

(100, 'Morris', 'John', 'Dodson', 'Mobile', '692945613', 'Morris.Dodson@example.com', 'Work', 2002, 'Pharmaceutical Science');

INSERT INTO MedicalHistory (MedicalHistID, PatientID, Description)
VALUES(1, 1, 'Diabetes'),
(2, 2, 'Cancer'),
(3, 3, 'Stroke'),
(4, 4, 'Dengue'),
(5, 5, 'Depression and anxiety'),
(6, 6, 'Hypertension'),
(7, 7, 'Hepatitis B'),
(8, 8, 'Arthritis'),
(9, 9, 'Hepatitis B'),
(10, 10, 'Thyroid Disorders'),
(11, 11, 'Asthma'),
(12, 12, 'Stroke'),
(13, 13, 'Dengue'),
(14, 14, 'Dengue'),
(15, 15, 'Stroke'),
(16, 16, 'Gastrointestinal Disorders'),
(17, 17, 'Hypertension'),
(18, 18, 'History of heart disease'),
(19, 19, 'Obesity'),
(20, 20, 'Stroke'),
(21, 21, 'Hypertension'),
(22, 22, 'Heart Disease'),
(23, 23, 'Depression'),
(24, 24, 'Cancer'),
(25, 25, 'Hypertension'),
(26, 26, 'Chronic Kidney Disease'),
(27, 27, 'Obesity'),
(28, 28, 'Type 2 diabetes'),
(29, 29, 'Heart Disease'),
(30, 30, 'Anemia'),
(31, 31, 'Obesity'),
(32, 32, 'Hypertension'),
(33, 33, 'Depression and anxiety'),
(34, 34, 'Depression'),
(35, 35, 'Type 2 diabetes'),
(36, 36, 'Arthritis'),
(37, 37, 'Dengue'),
(38, 38, 'Tuberculosis'),
(39, 39, 'Cancer'),
(40, 40, 'Obesity'),
(41, 41, 'History of heart disease'),
(42, 42, 'Arthritis'),
(43, 43, 'Chikungunya'),
(44, 44, 'Malaria'),
(45, 45, 'History of heart disease'),
(46, 46, 'Cancer'),
(47, 47, 'Asthma'),
(48, 48, 'Heart Disease'),
(49, 49, 'Chronic asthma'),
(50, 50, 'Dengue'),
(51, 51, 'Diabetes'),
(52, 52, 'Chikungunya'),
(53, 53, 'Chronic asthma'),
(54, 54, 'Heart Disease'),
(55, 55, 'Depression and anxiety'),
(56, 56, 'Chronic Kidney Disease'),
(57, 57, 'Asthma'),
(58, 58, 'Gastrointestinal Disorders'),
(59, 59, 'Thyroid Disorders'),
(60, 60, 'Hepatitis B'),
(61, 61, 'Hepatitis B'),
(62, 62, 'Hepatitis B'),
(63, 63, 'Depression'),
(64, 64, 'Chikungunya'),
(65, 65, 'Depression'),
(66, 66, 'Abdominal Pain'),
(67, 67, 'Malaria'),
(68, 68, 'Diabetes'),
(69, 69, 'Dengue'),
(70, 70, 'Allergic rhinitis'),
(71, 71, 'Hepatitis B'),
(72, 72, 'History of heart disease'),
(73, 73, 'History of heart disease'),
(74, 74, 'Thyroid Disorders'),
(75, 75, 'Chronic asthma'),
(76, 76, 'Hepatitis B'),
(77, 77, 'Hypertension'),
(78, 78, 'Hepatitis B'),
(79, 79, 'Chronic Kidney Disease'),
(80, 80, 'Depression and anxiety'),
(81, 81, 'Chronic Kidney Disease'),
(82, 82, 'Hepatitis B'),
(83, 83, 'Malaria'),
(84, 84, 'Cancer'),
(85, 85, 'Asthma'),
(86, 86, 'Chronic Kidney Disease'),
(87, 87, 'Allergic rhinitis'),
(88, 88, 'Depression'),
(89, 89, 'Malaria'),
(90, 90, 'Hypertension'),
(91, 91, 'Gastrointestinal Disorders'),
(92, 92, 'Heart Disease'),
(93, 93, 'Type 2 diabetes'),
(94, 94, 'Diabetes'),
(95, 95, 'History of heart disease'),
(96, 96, 'Type 2 diabetes'),
(97, 97, 'Anemia'),
(98, 98, 'Allergic rhinitis'),
(99, 99, 'Depression'),
(100, 100, 'Depression and anxiety');

INSERT INTO Payment (PaymentID, OrderID, Amount, PaymentMethod, PaymentDate)
VALUES (1, 510, 3766.38, 'Debit Card', '2020-07-11'),
(2, 343, 2524.62, 'PayPal', '2015-08-14'),
(3, 264, 4612.93, 'Credit Card', '2002-05-26'),
(4, 119, 8259.74, 'Credit Card', '2013-05-31'),
(5, 527, 358.95, 'Credit Card', '2014-02-06'),
(6, 494, 3167.0, 'Credit Card', '2004-07-13'),
(7, 861, 9783.63, 'PayPal', '2012-03-01'),
(8, 4, 9650.99, 'PayPal', '2016-05-20'),
(9, 485, 2486.48, 'Debit Card', '2000-02-17'),
(10, 603, 3732.86, 'Debit Card', '2016-05-04'),
(11, 449, 1659.29, 'Credit Card', '2007-11-25'),
(12, 466, 3573.57, 'Credit Card', '2000-04-02'),
(13, 508, 777.4, 'Debit Card', '2014-05-30'),
(14, 593, 8369.77, 'Debit Card', '2012-12-08'),
(15, 502, 5215.64, 'Cash', '2019-02-20'),
(16, 237, 8057.14, 'PayPal', '2003-06-21'),
(17, 113, 1992.01, 'Net Banking', '2003-05-04'),
(18, 475, 7023.68, 'Cash', '2016-04-03'),
(19, 881, 5137.83, 'Credit Card', '2015-03-02'),
(20, 911, 6384.86, 'Cash', '2009-05-09'),
(21, 695, 2273.93, 'Debit Card', '2004-05-12'),
(22, 394, 9660.37, 'PayPal', '2017-02-20'),
(23, 726, 1026.4, 'PayPal', '2006-07-18'),
(24, 14, 4275.14, 'Credit Card', '2000-10-14'),
(25, 397, 1691.89, 'Credit Card', '2004-05-16'),
(26, 449, 897.11, 'Cash', '2020-05-14'),
(27, 245, 4785.37, 'Credit Card', '2018-01-08'),
(28, 693, 4903.73, 'Credit Card', '2002-03-01'),
(29, 448, 6077.82, 'Net Banking', '2013-10-02'),
(30, 805, 2082.26, 'Cash', '2007-11-09'),
(31, 581, 2858.41, 'PayPal', '2009-11-13'),
(32, 4, 6395.02, 'PayPal', '2018-02-14'),
(33, 495, 301.74, 'Credit Card', '2002-04-04'),
(34, 994, 9521.14, 'Cash', '2021-11-20'),
(35, 840, 3667.2, 'Debit Card', '2008-04-27'),
(36, 789, 236.89, 'Debit Card', '2009-12-29'),
(37, 49, 6737.01, 'Cash', '2001-03-30'),
(38, 477, 1865.06, 'Credit Card', '2013-03-29'),
(39, 986, 3989.08, 'Debit Card', '2020-01-27'),
(40, 319, 4913.0, 'Debit Card', '2015-08-25'),
(41, 405, 5472.65, 'PayPal', '2017-01-01'),
(42, 255, 9293.66, 'Net Banking', '2010-02-24'),
(43, 836, 9452.84, 'Debit Card', '2016-05-04'),
(44, 154, 9346.36, 'Net Banking', '2020-08-19'),
(45, 550, 678.46, 'Credit Card', '2010-08-20'),
(46, 29, 1406.49, 'Net Banking', '2010-06-01'),
(47, 171, 7858.81, 'Net Banking', '2011-11-10'),
(48, 659, 2084.3, 'Credit Card', '2015-04-27'),
(49, 174, 9206.6, 'Net Banking', '2010-09-03'),
(50, 733, 9938.19, 'Credit Card', '2013-08-03'),
(51, 508, 9372.86, 'PayPal', '2012-12-17'),
(52, 901, 5891.92, 'Cash', '2000-04-03'),
(53, 975, 6972.92, 'PayPal', '2003-02-16'),
(54, 505, 9744.53, 'PayPal', '2012-10-17'),
(55, 848, 7053.85, 'Net Banking', '2000-09-06'),
(56, 390, 7745.59, 'Net Banking', '2014-07-14'),
(57, 171, 1899.69, 'Credit Card', '2013-07-20'),
(58, 384, 6630.77, 'Debit Card', '2014-06-26'),
(59, 406, 7598.51, 'Credit Card', '2009-07-13'),
(60, 790, 6816.62, 'Net Banking', '2012-09-01'),
(61, 305, 7049.6, 'Debit Card', '2015-03-04'),
(62, 559, 1821.49, 'PayPal', '2011-01-12'),
(63, 127, 8442.89, 'Credit Card', '2010-02-03'),
(64, 366, 71.04, 'Cash', '2014-09-19'),
(65, 413, 1760.19, 'Net Banking', '2007-04-07'),
(66, 309, 6830.7, 'Credit Card', '2007-08-07'),
(67, 4, 1855.16, 'Cash', '2008-10-02'),
(68, 554, 6047.75, 'Net Banking', '2016-10-22'),
(69, 943, 517.14, 'Debit Card', '2020-08-21'),
(70, 100, 1383.92, 'Net Banking', '2020-07-09'),
(71, 359, 8045.81, 'Credit Card', '2000-12-31'),
(72, 543, 4058.96, 'PayPal', '2013-11-22'),
(73, 94, 1152.37, 'Credit Card', '2011-12-12'),
(74, 622, 8897.08, 'Cash', '2014-11-01'),
(75, 209, 2376.76, 'PayPal', '2014-06-17'),
(76, 702, 7127.42, 'Debit Card', '2002-12-02'),
(77, 673, 1147.35, 'Debit Card', '2009-12-29'),
(78, 303, 3801.4, 'Credit Card', '2018-07-18'),
(79, 433, 1598.13, 'Net Banking', '2001-06-24'),
(80, 346, 1596.18, 'Debit Card', '2017-03-30'),
(81, 735, 9265.73, 'Net Banking', '2019-07-28'),
(82, 199, 5980.3, 'Net Banking', '2020-09-29'),
(83, 72, 5270.95, 'Cash', '2003-12-10'),
(84, 494, 8004.05, 'Net Banking', '2013-06-05'),
(85, 703, 2701.88, 'Debit Card', '2016-01-30'),
(86, 520, 3649.66, 'Cash', '2021-07-22'),
(87, 534, 4547.15, 'PayPal', '2002-08-09'),
(88, 675, 7434.72, 'Cash', '2016-09-17'),
(89, 710, 7362.52, 'Cash', '2012-10-13'),
(90, 142, 4005.26, 'Debit Card', '2017-07-08'),
(91, 929, 1921.78, 'Debit Card', '2000-02-05'),
(92, 789, 3426.97, 'Credit Card', '2011-05-04'),
(93, 221, 4508.71, 'Credit Card', '2014-06-19'),
(94, 74, 9814.32, 'Credit Card', '2012-04-27'),
(95, 167, 803.93, 'Net Banking', '2018-01-28'),
(96, 979, 5077.5, 'Debit Card', '2018-10-20'),
(97, 135, 4933.01, 'Credit Card', '2017-07-05'),
(98, 656, 1457.96, 'Net Banking', '2006-07-03'),
(99, 473, 6790.48, 'Credit Card', '2012-11-13'),
(100, 150, 8573.13, 'Debit Card', '2002-07-15');

ALTER TABLE Branches
MODIFY ContactNumber BIGINT;

INSERT INTO Branches (BranchID, street_number, street_name, apt_number, city, zipCode, state, country, ContactNumber, Email)
VALUES (1, 181, 'gaxwxfsnqmwbswx', '24H', 'hzvtmbviurvm', 90358, 'CL', 'India', 988863664, 'dtjbwgksmj@email.com'),
(2, 782, 'lumogcbeajclusg', '32Q', 'gsxnwyxcdhld', 92375, 'WE', 'India', 604399142, 'vikfkvbuht@email.com'),
(3, 555, 'jxppzgkvtlxdjir', '46G', 'sebeiqcvvdjq', 89072, 'XX', 'India', 527735871, 'iqmzchccbs@email.com'),
(4, 104, 'azrlwnpyoxtuccr', '48P', 'dlcrwqopeqax', 45224, 'FQ', 'India', 362863298, 'vkckswyypv@email.com'),
(5, 280, 'uvqkglhxwrepkti', '60B', 'oqoowpizjolz', 56062, 'GO', 'India', 558300399, 'wrrpljofvl@email.com'),
(6, 539, 'rbrkqwtautmyghr', '6J', 'kjcznhxzynvg', 52546, 'ZU', 'India', 201935829, 'vgmziiybrv@email.com'),
(7, 951, 'jipbjdjlbamykng', '33G', 'ovaqgmoujywx', 94369, 'QD', 'India', 394024382, 'fwwnsdqtqd@email.com'),
(8, 303, 'vsxqyqkzsyhurhd', '93H', 'hgdlyhhtibys', 77055, 'AQ', 'India', 866688949, 'uljdevugxn@email.com'),
(9, 884, 'dayuydhaxywaczd', '20T', 'kcqnjcqmxegc', 70741, 'BH', 'India', 195486380, 'lszdsegmhk@email.com'),
(10, 816, 'fnghcvlajhjyltp', '43Y', 'iywzygfkidus', 79191, 'MB', 'India', 546481271, 'iflrnyylwa@email.com'),
(11, 563, 'zemvblrspipbokl', '88C', 'ezptvjlezbgl', 33437, 'YP', 'India', 441920038, 'kkhilssaho@email.com'),
(12, 839, 'fdwgypwgbdxxcle', '61A', 'nriqyifasdyh', 82445, 'JE', 'India', 465598881, 'menxiyrnpy@email.com'),
(13, 329, 'xiidyfbiemovqyh', '17Z', 'iyirsogdtzvv', 75953, 'FI', 'India', 859484820, 'zzjovzyajr@email.com'),
(14, 364, 'hrdjrnndtvmqrqb', '82Q', 'wzoeiblihjds', 69839, 'AR', 'India', 393283663, 'oedyiuprrc@email.com'),
(15, 807, 'dzckwwpsrkmhntx', '67N', 'xbwmzpiuhych', 30722, 'XH', 'India', 265480781, 'jbupknpuao@email.com'),
(16, 795, 'ypdcdqmvgjaresh', '46B', 'mqzdikqqjbbk', 48815, 'ZB', 'India', 739672868, 'fhujwaxkkw@email.com'),
(17, 379, 'zszsccpivjmrtqs', '17B', 'qtfdtlnxzoib', 19082, 'VH', 'India', 873474248, 'rhbaoxwksg@email.com'),
(18, 302, 'iprzkaqkzulfzyz', '40N', 'viwvxiqryfvl', 21000, 'WN', 'India', 611807314, 'zylhifkrsj@email.com'),
(19, 807, 'xiuqrricokwkdto', '61B', 'rnbvjtdacobi', 72307, 'JQ', 'India', 772055085, 'imtovyomjl@email.com'),
(20, 510, 'vrdhpzmzkjfzopj', '60X', 'cndiyfrxmfqe', 89999, 'DY', 'India', 942715813, 'degfgrtpvv@email.com'),
(21, 831, 'abkjbmtprxrkhle', '32P', 'dsoffsbfgevv', 13242, 'NI', 'India', 761107280, 'fisltpstep@email.com'),
(22, 120, 'ixugasezcqiyqqo', '22D', 'lduwdlcgqvpr', 76124, 'FZ', 'India', 447073430, 'femcnxutij@email.com'),
(23, 410, 'ahrfhblusyhgnkj', '82M', 'oltpmwdugurx', 12463, 'KV', 'India', 756151505, 'wnatdxcifm@email.com'),
(24, 556, 'ojkwxrrwrpzyebb', '16N', 'jmedqkdsmzys', 63856, 'KX', 'India', 420497931, 'pyuvtewxsm@email.com'),
(25, 794, 'zbrdavwhlanvmon', '7Y', 'strmgnbzybtx', 25391, 'LU', 'India', 420124017, 'bfvwskszzt@email.com'),
(26, 158, 'ybxuwcuixengwxy', '39A', 'ycudadzgznqj', 78824, 'VC', 'India', 761284431, 'qnnhyqcskm@email.com'),
(27, 882, 'uulxfqmtssyoqac', '100Y', 'hleqmkxqbaxr', 29768, 'BQ', 'India', 291250891, 'nvovvkoikz@email.com'),
(28, 549, 'cljuadnptgkpczj', '9O', 'mlcecdhugxog', 60308, 'KF', 'India', 279919038, 'jfuisvtdkz@email.com'),
(29, 723, 'zgjuvyhhmdnlphy', '73M', 'nlhebaxtpdiq', 92454, 'YO', 'India', 291647514, 'rundduqbhm@email.com'),
(30, 938, 'ntuhdjmzyvozbjz', '68L', 'wlbbcpqcmuht', 40050, 'VD', 'India', 159364914, 'pwkbjlhhxp@email.com'),
(31, 819, 'jfkgnotcvzrtkuy', '46T', 'vgxnbnjngdmw', 38936, 'PG', 'India', 452735590, 'asnalepzeo@email.com'),
(32, 581, 'vunbuxycryaslbx', '42R', 'dakgroybvlso', 91758, 'OR', 'India', 347094283, 'csjjakuctr@email.com'),
(33, 650, 'stgevrvpwrwkqki', '72M', 'rxjlzaebogff', 58295, 'EM', 'India', 894035822, 'gcfkuhmxcx@email.com'),
(34, 189, 'tbjlqywevfbuiww', '13Y', 'atndhgfvbsjh', 33462, 'SG', 'India', 151991660, 'vxynbrmlyv@email.com'),
(35, 514, 'kbpdoemoxebqlck', '26W', 'bgwihhbtisyg', 81019, 'DZ', 'India', 689005195, 'xhbipcezbm@email.com'),
(36, 535, 'jknrarnwahuklvn', '68R', 'hyfofbgkpkns', 43743, 'IA', 'India', 481413765, 'dwygcdaxse@email.com'),
(37, 144, 'jxpynjoksfmkwqh', '92M', 'kzozftcmpjjm', 99069, 'CW', 'India', 202211182, 'qsirunjouc@email.com'),
(38, 151, 'nevykdmamwfxkaq', '20B', 'jlfjxbvrjpun', 97574, 'FL', 'India', 411594773, 'hvvglyyprt@email.com'),
(39, 141, 'flamogoexcenpqy', '21I', 'nqeomfuqfwse', 39942, 'ED', 'India', 294459621, 'kgwewcxmca@email.com'),
(40, 803, 'twqwwitjxcetsti', '36I', 'fgbjopgdrbmq', 66239, 'AN', 'India', 903650251, 'oyymnoptpb@email.com'),
(41, 653, 'batgxkqkguvfjub', '65Y', 'syippxqnfbqc', 73171, 'RJ', 'India', 729976856, 'mljbbhswpy@email.com'),
(42, 433, 'wdtdqwsdwpkovbx', '88Y', 'uvwtkllckcla', 72168, 'QO', 'India', 150727901, 'giiyampbpg@email.com'),
(43, 488, 'oxieigvoyamehjf', '13Y', 'jlokavuyqvaz', 47805, 'WK', 'India', 271465148, 'sxasvtvzxh@email.com'),
(44, 589, 'vetnghbxmzbkgvr', '53Y', 'albjnjrrxuyg', 40395, 'ZY', 'India', 646483024, 'eobqitabkt@email.com'),
(45, 115, 'dpqmzvbhwcnskqa', '1Y', 'ipfrsegukuzg', 47957, 'YA', 'India', 950190144, 'ttrqjufcih@email.com'),
(46, 368, 'gzwynmhvnuefmyb', '66L', 'bhpgzrkhbpep', 21076, 'SP', 'India', 309745633, 'lexrqydtmr@email.com'),
(47, 114, 'ibpgincumfmspgc', '24Y', 'cosxkpidxqxr', 55850, 'NT', 'India', 626329649, 'ngtuuaxzxi@email.com'),
(48, 882, 'gqjavyausqqtabd', '67E', 'fzkblquvrbkb', 25746, 'PV', 'India', 716480837, 'luwqlxbdpc@email.com'),
(49, 630, 'mxzpjoftgbfdmeg', '57O', 'kfinctslhqjk', 59130, 'FT', 'India', 568135785, 'eztfxnyghb@email.com'),
(50, 566, 'waxzpwsmaowbylg', '27Q', 'tvmvdwxbrnoy', 23311, 'BF', 'India', 638793251, 'hloxhesbno@email.com'),
(51, 407, 'vwxedodpnyszmqy', '92W', 'ctfrhupjqzdn', 95163, 'ZC', 'India', 830680348, 'yvpowwrvxc@email.com'),
(52, 426, 'hdszegmfmmidgxn', '25B', 'wfpjafngpksg', 43886, 'CO', 'India', 820108619, 'vthbkzjvff@email.com'),
(53, 671, 'axiothoofbdnnap', '90W', 'vpdjrxpdihfu', 85168, 'KL', 'India', 983194931, 'icomoeuqjd@email.com'),
(54, 458, 'drdfnqplrcxroiz', '68P', 'qigjmclgzcsw', 86047, 'LM', 'India', 851332126, 'hohlegctrj@email.com'),
(55, 127, 'uxmfhgncjlbreab', '56L', 'uhogbaxbvwuy', 13806, 'WJ', 'India', 869532836, 'uwwxkfwblg@email.com'),
(56, 692, 'ptfyjpcjhrztyfd', '40Q', 'syntizxvtzyv', 19968, 'HW', 'India', 291304257, 'xdspyaysgv@email.com'),
(57, 908, 'bilmjqbyajtewts', '24A', 'kfczqobhvghg', 44604, 'HQ', 'India', 545890187, 'fostldceuw@email.com'),
(58, 652, 'wyqzjwvydfigxzp', '76B', 'qrgjcetphykb', 51360, 'QG', 'India', 537637958, 'jihieqtkzm@email.com'),
(59, 720, 'pqsexgmmuvxodrt', '86Y', 'kjshvdxparbg', 40430, 'XE', 'India', 806257277, 'hlfekmvken@email.com'),
(60, 368, 'meojumxlzgwuqbx', '9K', 'xkdljnjjyhdm', 39169, 'FC', 'India', 488308343, 'hwgnudmpno@email.com'),
(61, 235, 'akpmkbkejakjbvi', '17P', 'pjhbzvrzwpdj', 90308, 'AV', 'India', 972770972, 'beadnyhezi@email.com'),
(62, 556, 'nwzihaizdpobpfq', '49W', 'apadyhfnnzbn', 32342, 'NS', 'India', 330110113, 'cyokzllcpe@email.com'),
(63, 317, 'rbnfuhfjgiuqmfc', '52T', 'nkmwkumdcjnh', 61859, 'ZP', 'India', 497862692, 'ejdlfbttqt@email.com'),
(64, 933, 'xpaymylqlexoinf', '52D', 'lbpneliwyxnh', 96720, 'NS', 'India', 508264590, 'lcyfkpfnwg@email.com'),
(65, 489, 'xgztvtrwuywukwb', '17T', 'gkordjkdqmep', 14431, 'DW', 'India', 964699099, 'lyqabztqvm@email.com'),
(66, 448, 'fnqllmcajcygwpb', '64Z', 'ldskjrlqbzxo', 83735, 'WJ', 'India', 702376679, 'mbnrnxsise@email.com'),
(67, 314, 'zsaibrdvgczmfgu', '33Z', 'dwhlqhxyzxjm', 97006, 'VA', 'India', 521134652, 'atvkesfkpt@email.com'),
(68, 379, 'zfepxruishdjbrl', '33V', 'nojixfmwjohn', 69821, 'SV', 'India', 727713894, 'cfvppsjhpz@email.com'),
(69, 592, 'karvjtaxgavveey', '40C', 'ohrcrdhdvogu', 11633, 'QM', 'India', 190653565, 'ltiaucroid@email.com'),
(70, 821, 'rosqomibuwamths', '92C', 'zuelqvfqhuvt', 71527, 'KW', 'India', 650812815, 'wdubhhcstj@email.com'),
(71, 557, 'itpvjavwqjdryll', '15I', 'pufhwzhaeiqy', 76432, 'VA', 'India', 741032767, 'ueatqriksn@email.com'),
(72, 852, 'dmgbnjhdoipuwcy', '30W', 'jksxskjnhbxh', 65175, 'XK', 'India', 864515975, 'zcyjgeqyzc@email.com'),
(73, 283, 'eywdmpphipuevuj', '24F', 'fcdmhzzhqfyx', 45126, 'JS', 'India', 486139003, 'jxqpsofazn@email.com'),
(74, 857, 'uuoqhpztzngjecr', '62G', 'ipknzkyjgoho', 23158, 'QQ', 'India', 177507945, 'xmdcfmqiox@email.com'),
(75, 196, 'fztzfldgtqaqffu', '19Q', 'vkghftihzjen', 62752, 'CA', 'India', 518218584, 'vujktgltvs@email.com'),
(76, 980, 'rdriziqsdcatulq', '23T', 'olbttfbnizir', 76831, 'FD', 'India', 542031996, 'pwhhgvlzry@email.com'),
(77, 554, 'clojtavrqchuoxf', '46H', 'plyqukzmezgi', 86177, 'MS', 'India', 587475920, 'cqszeychqz@email.com'),
(78, 160, 'ablfkqdmnduqhrv', '50B', 'ustemswxvadj', 35707, 'YC', 'India', 235472114, 'bvxzvxndpd@email.com'),
(79, 792, 'jznlcdjlvzfrvwr', '93T', 'iyvgvznslkkv', 28099, 'VJ', 'India', 966269033, 'ouppjpycph@email.com'),
(80, 355, 'xouznynuxribfib', '77E', 'dnslzyirutgf', 19301, 'SF', 'India', 929454586, 'xiiffrhprc@email.com'),
(81, 703, 'djpfvbpefijnelj', '72O', 'gekmkarbqzhr', 42638, 'OE', 'India', 475188003, 'fncydwosfm@email.com'),
(82, 121, 'brfiplmdopquwqv', '4R', 'qbtwsafjcdhz', 20635, 'TJ', 'India', 818066910, 'ygpyzaekry@email.com'),
(83, 488, 'ngfrgfnbqsvqpou', '6X', 'arkmagkwcmmg', 19702, 'IW', 'India', 155000518, 'bshlkxnrtj@email.com'),
(84, 113, 'gwbvwnkdesufrsk', '33K', 'egtegvgsfppo', 58971, 'NJ', 'India', 408822253, 'rpmcqdeier@email.com'),
(85, 228, 'eqvzpwplbrivaie', '77T', 'ndmnqiossghn', 32261, 'NS', 'India', 429135435, 'olbxrsryku@email.com'),
(86, 265, 'virlimkkfsmwvzw', '87R', 'zxdtjnaecbeg', 75194, 'YA', 'India', 437114496, 'bmdxphykny@email.com'),
(87, 222, 'ftolvkvuhaidatp', '21D', 'ppdxljebopvf', 39772, 'OZ', 'India', 431013252, 'njgdtnsnsh@email.com'),
(88, 886, 'vqegotwpcvtprby', '72E', 'usfprnwvaqnn', 80378, 'MV', 'India', 569432150, 'qmdkbvfgbd@email.com'),
(89, 223, 'thkhlvdnjfofzzt', '74T', 'kdyqhqaegxof', 73544, 'GT', 'India', 882902636, 'wsthmqnghu@email.com'),
(90, 879, 'iqosmlkkaszlbvh', '26V', 'ihwnswybwucp', 46252, 'DQ', 'India', 354292679, 'tcboncxtlb@email.com'),
(91, 753, 'grkuyprnzlatrmd', '34E', 'thmoqlfdnxtd', 72306, 'UA', 'India', 218285423, 'waoybbgtgx@email.com'),
(92, 148, 'izfmmlmyshhntke', '68X', 'ixndeizlffii', 94139, 'ZF', 'India', 883043975, 'hxuevljfez@email.com'),
(93, 577, 'ccnobbeotpoxost', '3D', 'hqwsecftnvuv', 27703, 'IM', 'India', 758859914, 'armmmydamj@email.com'),
(94, 348, 'ixgjjpbcsnnkrxt', '1Z', 'qumpbklradxc', 67352, 'CO', 'India', 820648164, 'oissjldkow@email.com'),
(95, 274, 'pnocjjomgvuspsa', '48T', 'cnijnbbpczhf', 96753, 'JO', 'India', 516992130, 'jsafvapsst@email.com'),
(96, 849, 'fqrravpbivrdnup', '32W', 'ddnykzhwoilu', 90977, 'EJ', 'India', 987013666, 'yxdoxbfquw@email.com'),
(97, 124, 'yqinjkifjopvgmt', '40Y', 'ycvdpsvkbhrj', 36068, 'BB', 'India', 950670403, 'uaeclererz@email.com'),
(98, 175, 'tzzxkkjoccywyva', '72J', 'tpualzckjtjt', 91746, 'CO', 'India', 223370812, 'nnekxgcfrf@email.com'),
(99, 946, 'xwfquvivulaieyn', '70H', 'bkbshjopkniv', 97196, 'CF', 'India', 141941317, 'jehboaziwp@email.com'),
(100, 373, 'bopzflglannhqwj', '86F', 'wfhnkpmuvkiw', 33477, 'KK', 'India', 583282139, 'wsgfwwmdos@email.com');

INSERT INTO Stock (StockID, MedicineID, BranchID, Quantity, Threshold, PharmacistID)
VALUES (1, 1, 1, 89, 33, 1),
(2, 2, 2, 92, 81, 2),
(3, 3, 3, 112, 59, 3),
(4, 4, 4, 119, 91, 4),
(5, 5, 5, 129, 90, 5),
(6, 6, 6, 145, 55, 6),
(7, 7, 7, 128, 29, 7),
(8, 8, 8, 23, 82, 8),
(9, 9, 9, 45, 24, 9),
(10, 10, 10, 90, 87, 10),
(11, 11, 11, 60, 19, 11),
(12, 12, 12, 147, 97, 12),
(13, 13, 13, 45, 90, 13),
(14, 14, 14, 93, 20, 14),
(15, 15, 15, 135, 86, 15),
(16, 16, 16, 128, 42, 16),
(17, 17, 17, 128, 16, 17),
(18, 18, 18, 136, 11, 18),
(19, 19, 19, 136, 51, 19),
(20, 20, 20, 52, 58, 20),
(21, 21, 21, 42, 99, 21),
(22, 22, 22, 98, 40, 22),
(23, 23, 23, 150, 66, 23),
(24, 24, 24, 59, 70, 24),
(25, 25, 25, 45, 46, 25),
(26, 26, 26, 26, 77, 26),
(27, 27, 27, 77, 66, 27),
(28, 28, 28, 25, 31, 28),
(29, 29, 29, 96, 30, 29),
(30, 30, 30, 135, 83, 30),
(31, 31, 31, 43, 72, 31),
(32, 32, 32, 146, 75, 32),
(33, 33, 33, 125, 70, 33),
(34, 34, 34, 132, 10, 34),
(35, 35, 35, 129, 55, 35),
(36, 36, 36, 15, 48, 36),
(37, 37, 37, 66, 76, 37),
(38, 38, 38, 13, 49, 38),
(39, 39, 39, 28, 40, 39),
(40, 40, 40, 35, 36, 40),
(41, 41, 41, 101, 86, 41),
(42, 42, 42, 126, 32, 42),
(43, 43, 43, 17, 56, 43),
(44, 44, 44, 117, 91, 44),
(45, 45, 45, 109, 47, 45),
(46, 46, 46, 105, 82, 46),
(47, 47, 47, 34, 80, 47),
(48, 48, 48, 90, 70, 48),
(49, 49, 49, 21, 53, 49),
(50, 50, 50, 145, 11, 50),
(51, 51, 51, 72, 51, 51),
(52, 52, 52, 144, 58, 52),
(53, 53, 53, 74, 40, 53),
(54, 54, 54, 128, 66, 54),
(55, 55, 55, 46, 28, 55),
(56, 56, 56, 25, 83, 56),
(57, 57, 57, 98, 54, 57),
(58, 58, 58, 61, 73, 58),
(59, 59, 59, 76, 54, 59),
(60, 60, 60, 75, 85, 60),
(61, 61, 61, 112, 13, 61),
(62, 62, 62, 83, 75, 62),
(63, 63, 63, 121, 71, 63),
(64, 64, 64, 74, 64, 64),
(65, 65, 65, 136, 31, 65),
(66, 66, 66, 38, 63, 66),
(67, 67, 67, 127, 99, 67),
(68, 68, 68, 81, 75, 68),
(69, 69, 69, 22, 48, 69),
(70, 70, 70, 36, 99, 70),
(71, 71, 71, 142, 59, 71),
(72, 72, 72, 126, 25, 72),
(73, 73, 73, 114, 23, 73),
(74, 74, 74, 84, 97, 74),
(75, 75, 75, 33, 18, 75),
(76, 76, 76, 104, 90, 76),
(77, 77, 77, 50, 65, 77),
(78, 78, 78, 44, 74, 78),
(79, 79, 79, 139, 35, 79),
(80, 80, 80, 21, 99, 80),
(81, 81, 81, 64, 48, 81),
(82, 82, 82, 24, 25, 82),
(83, 83, 83, 27, 35, 83),
(84, 84, 84, 58, 11, 84),
(85, 85, 85, 138, 18, 85),
(86, 86, 86, 38, 24, 86),
(87, 87, 87, 49, 68, 87),
(88, 88, 88, 73, 86, 88),
(89, 89, 89, 64, 10, 89),
(90, 90, 90, 68, 68, 90),
(91, 91, 91, 103, 67, 91),
(92, 92, 92, 132, 75, 92),
(93, 93, 93, 89, 80, 93),
(94, 94, 94, 90, 50, 94),
(95, 95, 95, 33, 21, 95),
(96, 96, 96, 116, 44, 96),
(97, 97, 97, 147, 41, 97),
(98, 98, 98, 61, 39, 98),
(99, 99, 99, 150, 17, 99),
(100, 100, 100, 85, 25, 100);

INSERT INTO Appointment (AppointmentID, PatientID, DoctorID, Date, Time, Reason)
VALUES (1, 1, 1, '2004-03-14', '06:17:38', 'Vaccination'),
(2, 2, 2, '2017-09-29', '18:45:19', 'Specialist consultation'),
(3, 3, 3, '2018-12-11', '03:24:49', 'Annual physical'),
(4, 4, 4, '2000-02-07', '18:49:48', 'Surgery consultation'),
(5, 5, 5, '2021-06-08', '04:30:13', 'Follow-up appointment'),
(6, 6, 6, '2005-02-18', '15:35:20', 'Injury'), 	
(7, 7, 7, '2002-07-14', '20:09:22', 'Follow-up appointment'),
(8, 8, 8, '2012-10-09', '08:11:21', 'Injury'), 	
(9, 9, 9, '2020-05-10', '08:36:38', 'Injury'), 	
(10, 10, 10, '2018-09-09', '16:46:07', 'Surgery consultation'),
(11, 11, 11, '2005-09-14', '06:21:09', 'Sickness'),
(12, 12, 12, '2012-01-02', '19:35:19', 'Specialist consultation'),
(13, 13, 13, '2018-02-17', '10:24:13', 'Screening tests'),
(14, 14, 14, '2015-12-30', '02:32:32', 'Surgery consultation'),
(15, 15, 15, '2022-12-30', '19:55:00', 'Follow-up appointment'),
(16, 16, 16, '2016-12-28', '23:23:02', 'Annual physical'),
(17, 17, 17, '2018-03-03', '02:11:27', 'Screening tests'),
(18, 18, 18, '2017-06-01', '17:31:09', 'Surgery consultation'),
(19, 19, 19, '2007-03-22', '16:46:47', 'Specialist consultation'),
(20, 20, 20, '2005-10-23', '01:59:15', 'Follow-up appointment'),
(21, 21, 21, '2015-02-04', '11:42:19', 'Regular check-up'),
(22, 22, 22, '2006-06-23', '05:08:59', 'Chronic condition management'),
(23, 23, 23, '2013-06-24', '12:41:23', 'Specialist consultation'),
(24, 24, 24, '2009-04-29', '14:07:23', 'Vaccination'),
(25, 25, 25, '2009-09-22', '22:29:17', 'Follow-up appointment'),
(26, 26, 26, '2017-05-18', '06:04:58', 'Sickness'),
(27, 27, 27, '2016-10-14', '00:07:14', 'Surgery consultation'),
(28, 28, 28, '2002-01-25', '11:36:21', 'Sickness'),
(29, 29, 29, '2021-11-16', '15:27:00', 'Sickness'),
(30, 30, 30, '2018-04-26', '15:33:49', 'Chronic condition management'),
(31, 31, 31, '2010-04-12', '20:53:10', 'Screening tests'),
(32, 32, 32, '2019-08-30', '19:34:02', 'Sickness'),
(33, 33, 33, '2012-11-27', '02:07:00', 'Follow-up appointment'),
(34, 34, 34, '2004-09-10', '16:25:06', 'Injury'), 
(35, 35, 35, '2017-03-15', '05:59:41', 'Screening tests'),
(36, 36, 36, '2003-02-04', '18:43:38', 'Follow-up appointment'),
(37, 37, 37, '2011-12-02', '07:21:12', 'Surgery consultation'),
(38, 38, 38, '2016-03-09', '17:42:34', 'Annual physical'),
(39, 39, 39, '2001-01-24', '00:41:06', 'Specialist consultation'),
(40, 40, 40, '2002-07-27', '01:29:23', 'Follow-up appointment'),
(41, 41, 41, '2011-02-14', '04:06:25', 'Annual physical'),
(42, 42, 42, '2016-02-09', '01:58:50', 'Injury'), 
(43, 43, 43, '2012-04-02', '19:50:32', 'Regular check-up'),
(44, 44, 44, '2015-11-03', '05:43:52', 'Vaccination'),
(45, 45, 45, '2017-09-11', '13:40:42', 'Follow-up appointment'),
(46, 46, 46, '2000-11-24', '09:14:43', 'Sickness'),
(47, 47, 47, '2015-02-09', '07:06:22', 'Sickness'),
(48, 48, 48, '2011-08-05', '22:48:59', 'Chronic condition management'),
(49, 49, 49, '2009-02-16', '12:55:23', 'Chronic condition management'),
(50, 50, 50, '2007-07-05', '21:18:40', 'Specialist consultation'),
(51, 51, 51, '2021-05-26', '17:12:35', 'Annual physical'),
(52, 52, 52, '2019-12-05', '11:38:44', 'Screening tests'),
(53, 53, 53, '2001-07-19', '11:45:05', 'Chronic condition management'),
(54, 54, 54, '2020-04-02', '22:14:33', 'Follow-up appointment'),
(55, 55, 55, '2002-09-10', '21:35:12', 'Injury'), 
(56, 56, 56, '2007-05-24', '10:23:36', 'Chronic condition management'),
(57, 57, 57, '2015-06-25', '21:26:26', 'Sickness'),
(58, 58, 58, '2003-04-30', '07:01:39', 'Vaccination'),
(59, 59, 59, '2005-10-31', '01:42:48', 'Specialist consultation'),
(60, 60, 60, '2008-07-12', '02:52:18', 'Specialist consultation'),
(61, 61, 61, '2015-05-24', '16:49:17', 'Surgery consultation'),
(62, 62, 62, '2017-12-06', '00:30:36', 'Regular check-up'),
(63, 63, 63, '2014-06-24', '21:51:22', 'Sickness'),
(64, 64, 64, '2019-02-09', '21:45:55', 'Follow-up appointment'),
(65, 65, 65, '2017-11-12', '16:36:21', 'Injury'), 
(66, 66, 66, '2012-08-01', '01:10:35', 'Sickness'),
(67, 67, 67, '2013-07-25', '14:16:22', 'Screening tests'),
(68, 68, 68, '2022-04-04', '21:47:29', 'Vaccination'),
(69, 69, 69, '2011-06-03', '13:03:43', 'Regular check-up'),
(70, 70, 70, '2017-12-08', '12:32:57', 'Screening tests'),
(71, 71, 71, '2021-07-22', '15:27:27', 'Vaccination'),
(72, 72, 72, '2006-09-29', '19:44:16', 'Screening tests'),
(73, 73, 73, '2011-12-23', '15:16:20', 'Sickness'),
(74, 74, 74, '2022-03-31', '08:10:07', 'Surgery consultation'),
(75, 75, 75, '2000-03-08', '04:36:14', 'Annual physical'),
(76, 76, 76, '2012-09-23', '18:47:52', 'Screening tests'),
(77, 77, 77, '2015-01-09', '01:37:39', 'Follow-up appointment'),
(78, 78, 78, '2003-09-13', '09:11:19', 'Annual physical'),
(79, 79, 79, '2005-11-28', '19:31:10', 'Regular check-up'),
(80, 80, 80, '2018-09-18', '20:33:55', 'Regular check-up'),
(81, 81, 81, '2001-10-26', '18:45:16', 'Sickness'),
(82, 82, 82, '2014-05-06', '03:49:49', 'Sickness'),
(83, 83, 83, '2000-10-10', '11:34:54', 'Surgery consultation'),
(84, 84, 84, '2017-04-20', '05:39:43', 'Annual physical'),
(85, 85, 85, '2012-05-15', '12:47:57', 'Follow-up appointment'),
(86, 86, 86, '2022-04-14', '05:27:51', 'Screening tests'),
(87, 87, 87, '2005-06-15', '19:20:34', 'Annual physical'),
(88, 88, 88, '2007-11-12', '05:05:30', 'Specialist consultation'),
(89, 89, 89, '2003-10-29', '00:35:22', 'Chronic condition management'),
(90, 90, 90, '2003-07-06', '08:13:45', 'Surgery consultation'),
(91, 91, 91, '2008-08-30', '21:55:00', 'Annual physical'),
(92, 92, 92, '2009-05-24', '19:03:10', 'Surgery consultation'),
(93, 93, 93, '2007-08-22', '17:55:04', 'Vaccination'),
(94, 94, 94, '2016-08-19', '23:21:29', 'Vaccination'),
(95, 95, 95, '2004-07-04', '11:27:32', 'Follow-up appointment'),
(96, 96, 96, '2000-02-27', '22:18:49', 'Follow-up appointment'),
(97, 97, 97, '2019-08-05', '12:14:40', 'Regular check-up'),
(98, 98, 98, '2000-10-31', '03:36:05', 'Vaccination'),
(99, 99, 99, '2004-05-06', '04:12:32', 'Follow-up appointment'),
(100, 100, 100, '2011-04-26', '04:04:26', 'Sickness');

INSERT INTO Orders (OrderID, PatientID, MedicineID, PharmacistID, Quantity, Date, DeliveryStatus)
VALUES (1, 1, 1, 1, 1, '2006-06-26', 'Cancelled'),
(2, 2, 2, 2, 13, '2016-04-02', 'Cancelled'),   	
(3, 3, 3, 3, 18, '2006-04-25', 'Shipped'),
(4, 4, 4, 4, 15, '2001-03-12', 'Delivered'),   	
(5, 5, 5, 5, 11, '2014-04-27', 'Cancelled'),   	
(6, 6, 6, 6, 10, '2022-09-25', 'Shipped'),
(7, 7, 7, 7, 6, '2020-03-24', 'Cancelled'),    	
(8, 8, 8, 8, 2, '2022-10-24', 'Pending'),
(9, 9, 9, 9, 7, '2004-01-08', 'Cancelled'),    	
(10, 10, 10, 10, 5, '2014-09-01', 'Cancelled'),	
(11, 11, 11, 11, 6, '2002-09-28', 'Pending'),  	
(12, 12, 12, 12, 15, '2004-09-16', 'In Transit'), 
(13, 13, 13, 13, 11, '2004-08-24', 'Shipped'), 	
(14, 14, 14, 14, 1, '2010-01-27', 'Shipped'),  	
(15, 15, 15, 15, 9, '2020-02-23', 'Delivered'),	
(16, 16, 16, 16, 15, '2010-01-02', 'Pending'), 	
(17, 17, 17, 17, 13, '2004-02-05', 'Cancelled'),  
(18, 18, 18, 18, 20, '2021-07-28', 'Cancelled'),  
(19, 19, 19, 19, 3, '2018-02-12', 'Shipped'),  	
(20, 20, 20, 20, 16, '2018-12-05', 'In Transit'), 
(21, 21, 21, 21, 3, '2001-12-15', 'Cancelled'),
(22, 22, 22, 22, 16, '2003-10-19', 'Delivered'),  
(23, 23, 23, 23, 19, '2006-11-01', 'Pending'), 	
(24, 24, 24, 24, 12, '2004-09-23', 'In Transit'), 
(25, 25, 25, 25, 11, '2006-12-18', 'Pending'),     
(26, 26, 26, 26, 1, '2003-05-11', 'In Transit'),  
(27, 27, 27, 27, 3, '2015-10-11', 'Delivered'),	
(28, 28, 28, 28, 10, '2003-09-18', 'Pending'), 	
(29, 29, 29, 29, 13, '2018-05-04', 'Cancelled'),  
(30, 30, 30, 30, 6, '2003-06-02', 'In Transit'),  
(31, 31, 31, 31, 16, '2012-02-12', 'Shipped'), 	
(32, 32, 32, 32, 18, '2010-02-15', 'Pending'), 	
(33, 33, 33, 33, 4, '2006-03-17', 'Delivered'),
(34, 34, 34, 34, 20, '2006-09-17', 'Pending'), 	
(35, 35, 35, 35, 6, '2013-08-16', 'Cancelled'),	
(36, 36, 36, 36, 1, '2003-02-27', 'In Transit'),  
(37, 37, 37, 37, 20, '2013-03-19', 'Shipped'), 	
(38, 38, 38, 38, 12, '2022-12-14', 'Delivered'),  
(39, 39, 39, 39, 6, '2013-04-01', 'In Transit'),  
(40, 40, 40, 40, 1, '2006-09-04', 'Delivered'),	
(41, 41, 41, 41, 9, '2021-10-07', 'In Transit'),  
(42, 42, 42, 42, 13, '2008-02-09', 'Cancelled'),  
(43, 43, 43, 43, 16, '2012-04-18', 'Delivered'),  
(44, 44, 44, 44, 1, '2007-09-26', 'Delivered'),	
(45, 45, 45, 45, 4, '2021-07-05', 'Cancelled'),	
(46, 46, 46, 46, 17, '2004-02-08', 'Pending'), 	
(47, 47, 47, 47, 19, '2017-02-03', 'Pending'), 	
(48, 48, 48, 48, 18, '2020-01-28', 'Cancelled'),  
(49, 49, 49, 49, 14, '2018-03-10', 'Shipped'),     
(50, 50, 50, 50, 20, '2012-05-01', 'Pending'), 	
(51, 51, 51, 51, 3, '2022-07-08', 'Delivered'),	
(52, 52, 52, 52, 18, '2017-04-11', 'Delivered'),  
(53, 53, 53, 53, 12, '2017-08-31', 'In Transit'),
(54, 54, 54, 54, 18, '2010-06-18', 'Delivered'),  
(55, 55, 55, 55, 2, '2021-12-06', 'Shipped'),  	
(56, 56, 56, 56, 8, '2002-05-14', 'Cancelled'),	
(57, 57, 57, 57, 14, '2018-02-05', 'Delivered'),  
(58, 58, 58, 58, 16, '2004-12-30', 'Cancelled'),  
(59, 59, 59, 59, 12, '2013-12-20', 'In Transit'), 
(60, 60, 60, 60, 9, '2022-03-16', 'Pending'),  	
(61, 61, 61, 61, 20, '2005-03-25', 'Pending'), 	
(62, 62, 62, 62, 17, '2014-01-13', 'Pending'), 	
(63, 63, 63, 63, 12, '2016-10-16', 'Delivered'),  
(64, 64, 64, 64, 18, '2014-04-21', 'Delivered'),  
(65, 65, 65, 65, 8, '2006-09-16', 'Pending'),  	
(66, 66, 66, 66, 6, '2021-05-03', 'Delivered'),	
(67, 67, 67, 67, 18, '2003-04-15', 'Cancelled'),  
(68, 68, 68, 68, 19, '2012-07-23', 'Cancelled'),  
(69, 69, 69, 69, 10, '2007-01-29', 'Delivered'),  
(70, 70, 70, 70, 5, '2000-03-11', 'In Transit'),  
(71, 71, 71, 71, 3, '2008-02-24', 'In Transit'),  
(72, 72, 72, 72, 16, '2018-07-01', 'Cancelled'),  
(73, 73, 73, 73, 7, '2007-11-16', 'In Transit'),  
(74, 74, 74, 74, 5, '2021-12-24', 'Delivered'),	
(75, 75, 75, 75, 8, '2018-03-26', 'Shipped'),  	
(76, 76, 76, 76, 8, '2014-08-18', 'Shipped'),  	
(77, 77, 77, 77, 14, '2005-11-26', 'Pending'), 	
(78, 78, 78, 78, 11, '2014-11-05', 'In Transit'), 
(79, 79, 79, 79, 20, '2005-06-28', 'In Transit'), 
(80, 80, 80, 80, 19, '2000-12-09', 'Shipped'), 	
(81, 81, 81, 81, 9, '2021-10-06', 'Delivered'),	
(82, 82, 82, 82, 8, '2014-12-18', 'Cancelled'),	
(83, 83, 83, 83, 13, '2008-03-04', 'Shipped'), 	
(84, 84, 84, 84, 9, '2014-01-19', 'Pending'),  	
(85, 85, 85, 85, 13, '2015-08-31', 'Cancelled'),  
(86, 86, 86, 86, 15, '2013-07-01', 'In Transit'), 
(87, 87, 87, 87, 19, '2019-07-19', 'Pending'), 	
(88, 88, 88, 88, 9, '2018-03-03', 'Shipped'),  	
(89, 89, 89, 89, 8, '2018-09-24', 'Shipped'),  	
(90, 90, 90, 90, 11, '2022-09-13', 'Shipped'), 	
(91, 91, 91, 91, 10, '2000-11-22', 'Shipped'), 	
(92, 92, 92, 92, 8, '2008-06-04', 'Pending'),  	
(93, 93, 93, 93, 5, '2022-04-07', 'Pending'),  	
(94, 94, 94, 94, 20, '2000-10-11', 'Delivered'),  
(95, 95, 95, 95, 10, '2009-05-14', 'Shipped'), 	
(96, 96, 96, 96, 9, '2010-08-11', 'Cancelled'),	
(97, 97, 97, 97, 20, '2021-05-02', 'Pending'), 	
(98, 98, 98, 98, 6, '2012-03-31', 'Cancelled'),	
(99, 99, 99, 99, 5, '2014-09-15', 'Pending'),  	
(100, 100, 100, 100, 17, '2000-08-09', 'In Transit');

ALTER TABLE PolicyProvider 
MODIFY ContactNumber BIGINT NOT NULL;

INSERT INTO PolicyProvider (PolicyProviderID, PolicyProvider_Name_Fname, PolicyProvider_Name_Mname, PolicyProvider_Name_Lname, ContactNumber, Email, Address, PatientID)
VALUES (1, 'James', 'Matteo', 'Ziemba', 806978812, 'fyiwrplidt@email.com', '709 - ehzibjsjrczsauu', 1),  	
(2, 'Dina', 'Rioux', 'Denman', 678797277, 'uojikduqgu@email.com', '381 - opeticqppstjflv', 2),    	
(3, 'Susan', 'Davis', 'Bretz', 555820167, 'kdwuyxlggh@email.com', '855 - eciwuihvbdsrnss', 3),    	
(4, 'Nichole', 'Kennedy', 'Bernier', 796539854, 'rygkrnvffr@email.com', '370 - lfwdynbdxlucjgh', 4), 
(5, 'Phyllis', 'Choat', 'Vaughn', 395565604, 'kihgmpuojc@email.com', '503 - bagjxpqbjseorfk', 5),     
(6, 'Andrea', 'Jenkins', 'Harting', 888211220, 'kizwmpryhr@email.com', '503 - nvosfmhwdiilqsl', 6),  
(7, 'Richard', 'Bird', 'Flores', 725137491, 'yhpvjneagt@email.com', '928 - shubysqnmyispsz', 7),  	
(8, 'Carol', 'Williams', 'Bren', 417441318, 'cpybgopqib@email.com', '794 - mbuijncwgkvntxz', 8),  	
(9, 'George', 'Luckman', 'Sharkey', 558103013, 'uigdixbulr@email.com', '749 - gycatdvdfuciotv', 9),  
(10, 'Roslyn', 'Lindsay', 'Smith', 983412856, 'edlapjayxq@email.com', '986 - dlhfoskbpmyftix', 10),  
(11, 'Yuonne', 'Graham', 'Riddle', 816186640, 'ustownygvd@email.com', '205 - dbblemmwxsnwieg', 11),  
(12, 'Tyrone', 'Redford', 'Harris', 774100904, 'vimkbtgfyr@email.com', '376 - ozvwmdyuppoqclq', 12), 
(13, 'Mildred', 'Carver', 'Fisher', 738744476, 'lqxkmrqxtm@email.com', '137 - koyeruklcdkalzf', 13), 
(14, 'Brian', 'Porter', 'Meinke', 236445459, 'aulkanrgtn@email.com', '432 - dpqlsasmytockfp', 14),	
(15, 'Willis', 'Cooper', 'Clester', 582620734, 'ivfjyxkbwt@email.com', '631 - unhziumbpzbfmeo', 15), 
(16, 'Clarence', 'Golojuch', 'Muros', 417788895, 'kxndhsnlvf@email.com', '468 - aocbahywgizjeen', 16),
(17, 'Jeffery', 'Silva', 'Hartman', 662788179, 'lknentudvu@email.com', '748 - hdkgjdrtrmgfyur', 17), 
(18, 'Peter', 'Jordon', 'Smith', 560552904, 'savmafgqrr@email.com', '499 - nrttmnydlkjhnbq', 18), 	
(19, 'Timothy', 'Whittenburg', 'Tran', 701553935, 'jmpywlqnvc@email.com', '937 - sgimscijuyodvxm', 19),
(20, 'Nathan', 'Mcdaniel', 'Garcia', 812846949, 'bjekumeghb@email.com', '619 - hynckreyjevkqcs', 20),
(21, 'Mai', 'Thomas', 'Riley', 736744802, 'hjuntjbxhg@email.com', '868 - vstunicastqjevk', 21),   	
(22, 'Ann', 'Brown', 'Paquette', 111145964, 'naeilabnkb@email.com', '336 - fxmmseusukydrnu', 22), 	
(23, 'Clarence', 'White', 'Reddick', 341797056, 'hhflempqsy@email.com', '662 - vkaipcyltcqituk', 23),
(24, 'Alicia', 'Lozano', 'Chang', 103874768, 'puvkgkllwf@email.com', '921 - tftzgspdaqerqhv', 24),	
(25, 'Janet', 'Kirkpatrick', 'Power', 709339239, 'obhickcndy@email.com', '167 - tgzvtkxtzohwnlr', 25),
(26, 'Benjamin', 'Lewis', 'Underhill', 724872162, 'cvkncgplcm@email.com', '153 - kczjwdwprmkslyp', 26),
(27, 'Shannon', 'Turner', 'Dewitt', 318540490, 'lpgynykcof@email.com', '495 - jtbqtxyqikbybfn', 27), 
(28, 'Jeanette', 'Neu', 'Tibbits', 425181818, 'dtmmiqduep@email.com', '545 - qfidwkwsnsvaekn', 28),  
(29, 'Troy', 'Bender', 'Kolinski', 775636532, 'vwiocpgdov@email.com', '166 - ownbsznzoeekpsl', 29),  
(30, 'Thelma', 'Osegueda', 'Lapage', 228809285, 'jloyghwqlg@email.com', '594 - jtegsmqyfkgdtpe', 30),
(31, 'Tania', 'Kusuma', 'Hackett', 265594847, 'xkhtvvksua@email.com', '238 - qwwtatljywnxqro', 31),   
(32, 'Eric', 'Quelette', 'Turner', 933283006, 'mznyglfcjl@email.com', '418 - atrnracovtriryz', 32),  
(33, 'Wilhelmina', 'Martinez', 'Yelverton', 863674124, 'sdklmphiwa@email.com', '767 - emlrzowobnzvrld', 33),
(34, 'Daniel', 'Palmer', 'Johnson', 783752563, 'cjmykrhmup@email.com', '126 - rsvqbnylwyonvqd', 34), 
(35, 'Harry', 'Bivens', 'Allen', 797591107, 'jpkqjccgup@email.com', '921 - beuudtzaxhslfpa', 35), 	
(36, 'Staci', 'Protain', 'Flowers', 952099985, 'wgkwiwkcoz@email.com', '915 - eeotjatjwhsqlik', 36), 
(37, 'Dorothy', 'Pybus', 'Evans', 287537014, 'nsvlikwhyf@email.com', '690 - ssawkkqxgwkmeox', 37),	
(38, 'Roberta', 'Mccay', 'Scales', 219212337, 'kkyliunwxt@email.com', '356 - bopewcbpfglezlp', 38),  
(39, 'Adeline', 'Spencer', 'Duley', 247709784, 'mbwbigfpql@email.com', '397 - visqagdjtuiuplw', 39), 
(40, 'Susan', 'Hardy', 'Wheeler', 256197288, 'xutfqhutuv@email.com', '495 - fabbdffhgtcnban', 40),	
(41, 'Christinia', 'Lewandowski', 'Hunter', 888072526, 'gcywzfveik@email.com', '831 - oajiyzwvnhbwupv', 41),
(42, 'Sandra', 'Andress', 'Monahan', 945989564, 'oiafwbgemh@email.com', '836 - snbdzgstbubvpdb', 42),
(43, 'Carmen', 'Amadon', 'Forbes', 251255555, 'acvohxpisg@email.com', '242 - kxgxfjjflndqdcz', 43),  
(44, 'Saul', 'Fleming', 'Ephriam', 914565742, 'hnqgpnfrqn@email.com', '132 - jhfjohxqkaipnyd', 44),  
(45, 'Robert', 'Tanksley', 'Vasquez', 594821847, 'xrgcwacapx@email.com', '921 - cxtzmuzssslidic', 45),
(46, 'Sandra', 'Jones', 'Nichols', 289199933, 'cdcokuclek@email.com', '448 - ukfqqkbfggsnlah', 46),  
(47, 'Mary', 'Washington', 'Mckellar', 350552641, 'ezxcjmqgtz@email.com', '309 - hbyozcunldbbjwv', 47),
(48, 'Guy', 'Ferrer', 'Sommer', 878005873, 'gxnwfnaond@email.com', '333 - valoghherwgjtnb', 48),  	
(49, 'Sandra', 'Mikowski', 'Kragt', 280490130, 'fbazhtyxre@email.com', '700 - mnxscutabrkodxu', 49), 
(50, 'Jackson', 'Ramseur', 'Ross', 774267087, 'zrbnwjunls@email.com', '248 - chjwdnltljmlthi', 50),  
(51, 'Heidy', 'Applegate', 'Nickerson', 743726329, 'riefiaiymq@email.com', '683 - ewnwrztfkuihbbr', 51),
(52, 'Hilda', 'Beauchamp', 'Berg', 876954660, 'nowywqavdo@email.com', '338 - iymdrunsntfbsqj', 52),  
(53, 'Cecelia', 'Harris', 'Roberts', 277800252, 'lmwusnsumv@email.com', '214 - thacpngrstvhbar', 53),
(54, 'Kenneth', 'Sharley', 'Bradford', 643206134, 'gbvzodbbwf@email.com', '367 - uwiooaayijhvmit', 54),
(55, 'James', 'Hui', 'Green', 578094163, 'xybnbnxkfo@email.com', '576 - bvkyflfbuhigvtw', 55),    	
(56, 'Pamela', 'Atkins', 'Carver', 102229614, 'cmszaoykkd@email.com', '641 - cgogglbskqemzbk', 56),  
(57, 'James', 'Meyer', 'Phelps', 343525996, 'pghfovfkus@email.com', '493 - lwfxsvbnosoyggy', 57), 	
(58, 'Brigitte', 'Pioske', 'Johnson', 912131037, 'ctmpgsiowa@email.com', '465 - mjkykxvtqelejaj', 58),
(59, 'Paul', 'Sullivan', 'Owens', 589373819, 'bpguonjmld@email.com', '636 - xdfseuyumgxdoac', 59),    
(60, 'Edward', 'Falls', 'Powel', 574936288, 'crulxenvhx@email.com', '963 - nhpsguzmqqvksrx', 60), 	
(61, 'Robert', 'Hospelhorn', 'Newman', 578046918, 'idbjxgrwon@email.com', '575 - pmwajfruzfjfoto', 61),
(62, 'Virginia', 'Armstrong', 'Lawson', 515111505, 'kogrcxgtdu@email.com', '579 - esiponqaopqzbsi', 62),
(63, 'Billy', 'Gibbs', 'Schultz', 561821814, 'luixheryio@email.com', '685 - taqehllmfkuvzhv', 63),	
(64, 'James', 'Claeys', 'Segars', 816563534, 'aizklzyhia@email.com', '177 - rmlqrthakdfmiva', 64),	
(65, 'Mable', 'Pelkey', 'Hernandez', 490323689, 'uzwqiapxar@email.com', '130 - tsunyjzimkqokbc', 65),
(66, 'Edward', 'Luna', 'Willet', 413046573, 'cjusqvjkeo@email.com', '579 - fravuusimdyrlmu', 66), 	
(67, 'Kacie', 'Reinwald', 'Hawley', 280868260, 'jzyhbdnnyr@email.com', '876 - kxsymrhrapgpbrq', 67), 
(68, 'Helen', 'Wolfe', 'Moore', 183493470, 'cwzbrbyazg@email.com', '328 - fnxmcodcgeexnoo', 68),  	
(69, 'Donald', 'Reynolds', 'Maloney', 639781893, 'jdyvuognaz@email.com', '647 - hsfzgfljjedrgxp', 69),
(70, 'William', 'Marcus', 'Mccabe', 516642203, 'hzqfivfapy@email.com', '474 - ljccnpozjijeghd', 70), 
(71, 'Thomas', 'Williamson', 'Martinez', 963417786, 'dkpoqzoodr@email.com', '868 - hilnavzrxntpymk', 71),
(72, 'Joseph', 'Martinez', 'Close', 417616476, 'kgoxwverur@email.com', '110 - wcqchpvzdqbxxtw', 72), 
(73, 'Thomas', 'Read', 'Dicostanzo', 743561891, 'piljszezlk@email.com', '566 - uyeqeveugytthlu', 73),
(74, 'Nancy', 'Strickland', 'Ketner', 390283203, 'nwlnvyhjtt@email.com', '286 - laduktjkdslcwws', 74),
(75, 'Ruby', 'Salmon', 'Robertson', 636162004, 'fvywenlpxz@email.com', '306 - tamawgvjlmjdhgz', 75), 
(76, 'William', 'Kozak', 'Sanots', 234707788, 'lwxqweywiy@email.com', '691 - ansifyljihugtsh', 76),  
(77, 'Todd', 'Sink', 'Niedzwiecki', 340784145, 'lsnymrqhqv@email.com', '407 - qzernmktqmuuqdr', 77), 
(78, 'David', 'Cole', 'Woods', 504276732, 'hsnsjqkcft@email.com', '872 - wtmdmoaghuvbyhh', 78),   	
(79, 'James', 'Heyman', 'Ebling', 753966620, 'syavjnohlj@email.com', '923 - raqhoyeyylcproe', 79),	
(80, 'Johnna', 'Rankin', 'Lahey', 680346942, 'vmyvqvyhbn@email.com', '800 - cwrlucjfwifookv', 80),	
(81, 'Jonathon', 'Sullivan', 'Wilson', 353683472, 'pxcuafdgwv@email.com', '214 - aajlacwlapzketh', 81),
(82, 'Catherine', 'Kang', 'Silva', 820017447, 'vkjxxgkgdm@email.com', '460 - muvuwozjgolgdkh', 82),  
(83, 'Lawrence', 'Johnson', 'Baker', 924813081, 'gjstwztilf@email.com', '351 - nnlkhhisvbvudpl', 83),
(84, 'Gary', 'Paine', 'Starrick', 960141417, 'ybiulagdoe@email.com', '906 - nmqdscxkhfwchxl', 84),	
(85, 'Tamiko', 'Bunch', 'Tang', 663839622, 'umwzqijnvd@email.com', '256 - lnkkpndrguyzxye', 85),  	
(86, 'Stephanie', 'Brooks', 'Rivera', 316136691, 'zwqxqqgfwr@email.com', '434 - geezosmjjkgwsgp', 86),
(87, 'Kim', 'Mccarthy', 'Toney', 464020415, 'nnbqhhgilk@email.com', '294 - qduzxsflgxctpxe', 87), 	
(88, 'Antonio', 'Lindsay', 'Dempsey', 493785308, 'ftixnpucqh@email.com', '987 - bnntdanhvxswfnq', 88),
(89, 'Martina', 'Davenport', 'Hunnicutt', 809997814, 'iucexrmtoy@email.com', '207 - jqbyjdygmsjcbax', 89),
(90, 'Dewey', 'Glandon', 'Kean', 970099606, 'erigeiqqqd@email.com', '167 - vpylqrvatgxosxa', 90), 	
(91, 'Kesha', 'Garcia', 'Pena', 687923329, 'cxepixpujy@email.com', '813 - ltievyugfshxamh', 91),  	
(92, 'Sybil', 'Turner', 'Forbes', 320044894, 'rigokwldhc@email.com', '164 - eqwuqoxgzclmmub', 92),	
(93, 'Joel', 'Brockway', 'Glass', 308242297, 'gcuhgivufc@email.com', '720 - bmtaxtuoftanwxk', 93),	
(94, 'James', 'Ault', 'Hardiman', 613818090, 'zxyrrtbtrf@email.com', '233 - smvjbslqunxmely', 94),	
(95, 'Marva', 'Wells', 'Barnes', 171022184, 'lwtbtlvktg@email.com', '139 - vyjtuydduufxwil', 95), 	
(96, 'Philip', 'Baldwin', 'Hubbard', 645449833, 'lprwrrobkc@email.com', '875 - uwtwhllqeckshbe', 96),
(97, 'Pamela', 'Stoner', 'Oconnor', 921135393, 'yjkzmuveop@email.com', '938 - zdqcxhapmnhsify', 97), 
(98, 'Elizabeth', 'Ocasio', 'Poirier', 320609019, 'ouoanzvfwe@email.com', '163 - szeplkmktuerjgl', 98),
(99, 'Harry', 'Shea', 'Amari', 593275036, 'qhjhcrzbyw@email.com', '260 - ukojjfogwfjtoeg', 99),   	
(100, 'Alice', 'Austin', 'Hopkins', 306754081, 'jdwwrejkrc@email.com', '760 - icodiaxasezzkik', 100);



CREATE TABLE Pres_medicine (
    PMID int NOT NULL PRIMARY KEY,
    MedicineID int NOT NULL,
    PrescriptionID int NOT NULL,
    FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID),
    FOREIGN KEY (PrescriptionID) REFERENCES Prescription(PrescriptionID)
);
CREATE TABLE Med_Supp(
    MSID int NOT NULL PRIMARY KEY,
    MedicineID int NOT NULL,
    SupplierID int NOT NULL,
    FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);
INSERT INTO Med_Supp (MSID, MedicineID, SupplierID)
VALUES (1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20),
(21, 21, 21),
(22, 22, 22),
(23, 23, 23),
(24, 24, 24),
(25, 25, 25),
(26, 26, 26),
(27, 27, 27),
(28, 28, 28),
(29, 29, 29),
(30, 30, 30),
(31, 31, 31),
(32, 32, 32),
(33, 33, 33),
(34, 34, 34),
(35, 35, 35),
(36, 36, 36),
(37, 37, 37),
(38, 38, 38),
(39, 39, 39),
(40, 40, 40),
(41, 41, 41),
(42, 42, 42),
(43, 43, 43),
(44, 44, 44),
(45, 45, 45),
(46, 46, 46),
(47, 47, 47),
(48, 48, 48),
(49, 49, 49),
(50, 50, 50),
(51, 51, 51),
(52, 52, 52),
(53, 53, 53),
(54, 54, 54),
(55, 55, 55),
(56, 56, 56),
(57, 57, 57),
(58, 58, 58),
(59, 59, 59),
(60, 60, 60),
(61, 61, 61),
(62, 62, 62),
(63, 63, 63),
(64, 64, 64),
(65, 65, 65),
(66, 66, 66),
(67, 67, 67),
(68, 68, 68),
(69, 69, 69),
(70, 70, 70),
(71, 71, 71),
(72, 72, 72),
(73, 73, 73),
(74, 74, 74),
(75, 75, 75),
(76, 76, 76),
(77, 77, 77),
(78, 78, 78),
(79, 79, 79),
(80, 80, 80),
(81, 81, 81),
(82, 82, 82),
(83, 83, 83),
(84, 84, 84),
(85, 85, 85),
(86, 86, 86),
(87, 87, 87),
(88, 88, 88),
(89, 89, 89),
(90, 90, 90),
(91, 91, 91),
(92, 92, 92),
(93, 93, 93),
(94, 94, 94),
(95, 95, 95),
(96, 96, 96),
(97, 97, 97),
(98, 98, 98),
(99, 99, 99),
(100, 100, 100);

INSERT INTO Pres_medicine (PMID, MedicineID, PrescriptionID)
VALUES (1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10),
(11, 11, 11),
(12, 12, 12),
(13, 13, 13),
(14, 14, 14),
(15, 15, 15),
(16, 16, 16),
(17, 17, 17),
(18, 18, 18),
(19, 19, 19),
(20, 20, 20),
(21, 21, 21),
(22, 22, 22),
(23, 23, 23),
(24, 24, 24),
(25, 25, 25),
(26, 26, 26),
(27, 27, 27),
(28, 28, 28),
(29, 29, 29),
(30, 30, 30),
(31, 31, 31),
(32, 32, 32),
(33, 33, 33),
(34, 34, 34),
(35, 35, 35),
(36, 36, 36),
(37, 37, 37),
(38, 38, 38),
(39, 39, 39),
(40, 40, 40),
(41, 41, 41),
(42, 42, 42),
(43, 43, 43),
(44, 44, 44),
(45, 45, 45),
(46, 46, 46),
(47, 47, 47),
(48, 48, 48),
(49, 49, 49),
(50, 50, 50),
(51, 51, 51),
(52, 52, 52),
(53, 53, 53),
(54, 54, 54),
(55, 55, 55),
(56, 56, 56),
(57, 57, 57),
(58, 58, 58),
(59, 59, 59),
(60, 60, 60),
(61, 61, 61),
(62, 62, 62),
(63, 63, 63),
(64, 64, 64),
(65, 65, 65),
(66, 66, 66),
(67, 67, 67),
(68, 68, 68),
(69, 69, 69),
(70, 70, 70),
(71, 71, 71),
(72, 72, 72),
(73, 73, 73),
(74, 74, 74),
(75, 75, 75),
(76, 76, 76),
(77, 77, 77),
(78, 78, 78),
(79, 79, 79),
(80, 80, 80),
(81, 81, 81),
(82, 82, 82),
(83, 83, 83),
(84, 84, 84),
(85, 85, 85),
(86, 86, 86),
(87, 87, 87),
(88, 88, 88),
(89, 89, 89),
(90, 90, 90),
(91, 91, 91),
(92, 92, 92),
(93, 93, 93),
(94, 94, 94),
(95, 95, 95),
(96, 96, 96),
(97, 97, 97),
(98, 98, 98),
(99, 99, 99),
(100, 100, 100);

CREATE INDEX idx_PatientID ON Patients (PatientID);
CREATE INDEX idx_DoctorID ON Doctors (DoctorID);
CREATE INDEX idx_MedicineID  ON Medicines (MedicineID);
CREATE INDEX idx_PrescriptionID ON Prescription (PrescriptionID);
CREATE INDEX idx_PharmacistID ON Pharmacists (PharmacistID);
CREATE INDEX idx_MedicalHistID ON MedicalHistory (MedicalHistID);
CREATE INDEX idx_PaymentID ON Payment (PaymentID);
CREATE INDEX idx_BranchID ON Branches (BranchID);
CREATE INDEX idx_StockID ON Stock (StockID);
CREATE INDEX idx_AppointmentID ON Appointment (AppointmentID);
CREATE INDEX idx_OrderID ON Orders (OrderID);
CREATE INDEX idx_PolicyProviderID ON  PolicyProvider (PolicyProviderID);
CREATE INDEX idx_PMID ON Pres_medicine (PMID);
CREATE INDEX idx_MSID ON Med_Supp (MSID);

ALTER TABLE Patients ADD CONSTRAINT check_zipCode CHECK (Address_zipCode BETWEEN 10000 AND 999999);
ALTER TABLE Patients ADD CONSTRAINT check_email_address CHECK (Email_address LIKE '%@%.%');
ALTER TABLE Patients ADD CONSTRAINT check_age CHECK (Age >= 0 AND Age <= 150);
ALTER TABLE Doctors ADD CONSTRAINT doc_check_email_address CHECK (Email_address LIKE '%@%.%');
ALTER TABLE Doctors ADD CONSTRAINT unique_email UNIQUE (Email_address);
ALTER TABLE Doctors ADD CONSTRAINT unique_contact UNIQUE (ContactNumber_number);
ALTER TABLE Suppliers ADD CONSTRAINT supp_check_email_address CHECK (Email_Address LIKE '%@%.%');
ALTER TABLE Suppliers ADD CONSTRAINT sup_unique_email UNIQUE (Email_Address);
ALTER TABLE Suppliers ADD CONSTRAINT sup_unique_contact UNIQUE (ContactNumber_number);
ALTER TABLE Suppliers ADD CONSTRAINT sup_check_contact_type CHECK (ContactNumber_type IN ('Mobile', 'Home', 'Work'));
ALTER TABLE Medicines ADD CONSTRAINT unique_medicine_name UNIQUE (Name);
ALTER TABLE Medicines ADD CONSTRAINT med_price_positive CHECK (Price >= 0);
ALTER TABLE Medicines ADD CONSTRAINT med_cost_positive CHECK (Cost >= 0);
ALTER TABLE Pharmacists ADD CONSTRAINT pharma_unique_contact_number UNIQUE (ContactNumber_number);
ALTER TABLE Stock ADD CONSTRAINT check_threshold CHECK (Threshold >= 0);
ALTER TABLE Stock ADD CONSTRAINT check_quantity CHECK (Quantity >= 0);
ALTER TABLE Orders ADD CONSTRAINT check_orders_quantity CHECK (Quantity >= 0);
ALTER TABLE PolicyProvider ADD CONSTRAINT pp_check_email_address CHECK (Email LIKE '%@%.%');
ALTER TABLE PolicyProvider ADD CONSTRAINT pp_unique_email UNIQUE (Email);
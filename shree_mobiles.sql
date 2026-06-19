create table products (
	id serial primary key,
	product_name text not null,
	brand text,
	category text,
	description text
);

create table product_images (
	id serial primary key,
	product_id int references products(id),
	image_url text
);

select * from product_images;

INSERT INTO products (product_name, brand, category, description) VALUES ('IOS Automatic OCA Lamination Machine', 'FORWARD', 'OCA MACHINE', 'All in one oca machine. Wide Compatibility: 16-inch workspace supports all flat smartphone screens and iPad Pro. Fully Automatic operation. Safe & Precise. ');
INSERT INTO products (product_name, brand, category, description) VALUES ('NA-Supa Lite LCD Laminating Machine', 'NASAN', 'OCA MACHINE', 'Function: Phone (Flat/Curved) LCD Laminator. Work space : upto 8 inches.  Adjustable pressure, maximum pressure 9KG. Comes along with a vaccum.');
INSERT INTO products (product_name, brand, category, description) VALUES ('NA-Supa Lite Pro LCD Laminating Machine', 'NASAN', 'OCA MACHINE', 'Function: Phone (Flat/Curved) LCD Laminator. Work space : upto 8 inches.  Adjustable pressure, maximum pressure 9KG. Built-in pump.');
INSERT INTO products (product_name, brand, category, description) VALUES ('NA-Supa Lite Max LCD Laminating Machine', 'NASAN', 'OCA MACHINE', 'Function: Phone (Flat/Curved) LCD Laminator. Work space : upto 15  inches. Comes along with a vaccum and compressor(8litre).');
INSERT INTO products (product_name, brand, category, description) VALUES ('LiuLon 2025 Q1 2in1 Lamination Machine', 'LIULON', 'OCA MACHINE', 'Function: Phone (Flat/Curved) LCD Laminator. Work space : upto 9 inches. Built-in pump.');
INSERT INTO products (product_name, brand, category, description) VALUES ('FW-1082 Vaccum seperator', 'FORWARD', 'SEPARATOR', 'Work space : 8 inches.  Independant buttons for temperature and vaccum control, equipped with special seperator mat.');
INSERT INTO products (product_name, brand, category, description) VALUES ('FW 361 MAX 7 in 1 edge seperator', 'FORWARD', 'SEPARATOR', 'Work space : 7 inches.  7 in 1 edge screen mid frame removal and seperator. equipped with double vaccum.');
INSERT INTO products (product_name, brand, category, description) VALUES ('FW-108N vaccum seperator', 'FORWARD', 'SEPARATOR', 'Work space : 15 inches. manual built in dual pump seperator. equipped with 2 seperator rubber mats.');
INSERT INTO products (product_name, brand, category, description) VALUES ('S-918F PLUS Edge Lcd Separator', 'SUNSHINE', 'SEPARATOR', 'Work space : 7 inches. built-in precision bearings, 360° rotation smoothly. precise temperature control.');
INSERT INTO products (product_name, brand, category, description) VALUES ('YCS Multi-functional frame remover', 'YCS', 'SEPARATOR', 'For both flat and curved screens. precise temperature and pressure settings. pre equipped with universal hole for mobile camera lens.');
INSERT INTO products (product_name, brand, category, description) VALUES ('YCS 6065X', 'YCS', 'MICROSCOPE', 'Trinocular Microscope with large base. 6X-65X zoom adjustment.  WF10X23MM high eye-point wide-angle eyepieces. Compatible with 4K cameras for digital observation (camera sold separately).');
INSERT INTO products (product_name, brand, category, description) VALUES ('YCS 6558X', 'YCS', 'MICROSCOPE', 'Trinocular Microscope. 10X/23 high eye-point wide-angle eyepieces. 6.5X-58X zoom adjustment. the lens module can be adjusted 360°. Dustproof ring lampshade, touch adjustable light source');
INSERT INTO products (product_name, brand, category, description) VALUES ('YCS 6575X', 'YCS', 'MICROSCOPE', 'Trinocular microscope. WF10X/23MM wide-field eyepieces. zoom magnification ranging from 6.5X to 75X. The head can be inclined 45° and swiveled 360° ');
INSERT INTO products (product_name, brand, category, description) VALUES ('YCS 7060X', 'YCS', 'MICROSCOPE', 'Trinocular stereo zoom, with a third port for a camera. 10X23MM high eye-point eyepiece. 7X to 60X continuous zoom. Compatible with C-mount 4K cameras for digital observation (camera sold separately).');
INSERT INTO products (product_name, brand, category, description) VALUES ('YCS 71 ULTRA', 'YCS', 'MICROSCOPE', 'Trinocular microscope. Equipped with PL10X/23mm widefield eyepieces. Zoom magnification ranging from 6.5X to 45X. The head can be inclined 45° and 110mm working distance. ');
INSERT INTO products (product_name, brand, category, description) VALUES ('YCS 6558S', 'YCS', 'MICROSCOPE', '');
INSERT INTO products (product_name, brand, category, description) VALUES ('D75T B-11', 'MECHANIC', 'MICROSCOPE', 'Trinocular stereo zoom, with a third port for a camera. WF 10X22MM high eye-point eyepiece. 7X to 50X zoom adjustment. head 45° tilt and 360° rotation.');
INSERT INTO products (product_name, brand, category, description) VALUES ('MOS300-B11', 'MECHANIC', 'MICROSCOPE', 'Trinocular stereo zoom microscope. WF 10X22MM high eye-point eyepiece. 6X to 45X zoom adjustment. head 45° tilt and the lens module can be adjusted 360°.');
INSERT INTO products (product_name, brand, category, description) VALUES ('FW-7050 Pro-T', 'FORWARD', 'MICROSCOPE', '');
INSERT INTO products (product_name, brand, category, description) VALUES ('KA3005DS', 'KORAD', 'DC POWER SUPPLY', '');
INSERT INTO products (product_name, brand, category, description) VALUES ('3005A', 'SUNSHINE', 'DC POWER SUPPLY', '');
INSERT INTO products (product_name, brand, category, description) VALUES ('FW-DC', 'FORWARD', 'DC POWER SUPPLY', '');
INSERT INTO products (product_name, brand, category, description) VALUES ('DP3010', 'MECHANIC', 'DC POWER SUPPLY', '');
INSERT INTO products (product_name, brand, category, description) VALUES ('YCS 3060', 'YCS', 'DC POWER SUPPLY', '');
INSERT INTO products (product_name, brand, category, description) VALUES ('YIHUA 502D mini DC ', 'YIHUA', 'DC POWER SUPPLY', '');
INSERT INTO products (product_name, brand, category, description) VALUES ('HA01', 'FORWARD', 'SMD REWORK STATION', '');
INSERT INTO products (product_name, brand, category, description) VALUES ('HA02', 'FORWARD', 'SMD REWORK STATION', '');
INSERT INTO products (product_name, brand, category, description) VALUES ('BF4', 'FORWARD', 'SMD REWORK STATION', '');
INSERT INTO products (product_name, brand, category, description) VALUES ('QUICK 858D', 'QUICK', 'SMD REWORK STATION', '');
INSERT INTO products (product_name, brand, category, description) VALUES ('QUICK 857DW+', 'QUICK', 'SMD REWORK STATION', '');
INSERT INTO products (product_name, brand, category, description) VALUES ('QUICK 861DW', 'QUICK', 'SMD REWORK STATION', '');
INSERT INTO products (product_name, brand, category, description) VALUES ('SUGON 858D', 'SUGON', 'SMD REWORK STATION', '');
INSERT INTO products (product_name, brand, category, description) VALUES ('SUGON 202', 'SUGON', 'SMD REWORK STATION', '');
INSERT INTO products (product_name, brand, category, description) VALUES ('SUGON 2020D', 'SUGON', 'SMD REWORK STATION', '');
INSERT INTO products (product_name, brand, category, description) VALUES ('SUGON 8650PRO', 'SUGON', 'SMD REWORK STATION', '');
INSERT INTO products (product_name, brand, category, description) VALUES ('KADA 2018D+', 'KADA', 'SMD REWORK STATION', '');

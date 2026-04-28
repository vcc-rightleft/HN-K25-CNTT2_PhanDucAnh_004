create database bus;
use bus;

create table Passengers(
	passenger_id varchar(5) primary key not null,
    full_name varchar(100) not null,
    phone varchar(15) unique not null,
    card_type varchar(50) not null,
    balance decimal(10,2) not null,
    join_date date not null
);
create table Routes(
	route_id varchar(5) primary key not null,
    route_name varchar(100) not null,
    start_point varchar(100) not null,
    end_point varchar(100) not null,
    distance decimal(5,2) not null,
    base_fare decimal(10,2) not null
);
create table buses(
	bus_id varchar(5) primary key not null ,
    plate_number varchar(15) unique not null,
    route_id varchar(5) not null,
    foreign key (route_id) references routes(route_id),
    capacity int not null,
    battery_level int not null
);
create table tickets(
	ticket_id int auto_increment primary key not null,
    passenger_id varchar(5) not null,
    foreign key (passenger_id) references passengers(passenger_id),
    bus_id varchar(5) not null,
    foreign key (bus_id)references buses(bus_id),
    tap_time datetime not null,
    status varchar(20)
);

INSERT INTO Passengers (passenger_id, full_name, phone, card_type, balance, join_date) 
VALUES
('P01', 'Nguyễn Văn Hùng', '0911222333', 'Student', 50000, '2025-01-01'),
('P02', 'Lê Thị Mai', '0988777666', 'Elder', 100000, '2025-02-10'),
('P03', 'Trần Hoàng Long', '0905444333', 'Normal', 20000, '2025-03-05'),
('P04', 'Phạm Thu Thảo', '0977111222', 'Student', 30000, '2025-04-15');


INSERT INTO Routes (route_id, route_name, start_point, end_point, distance, base_fare) 
VALUES
('R01', 'Tuyến E01', 'Bến xe Mỹ Đình', 'Công viên Thống Nhất', 15.5, 7000),
('R02', 'Tuyến E02', 'Hào Nam', 'Khu đô thị Ocean Park', 22.0, 9000),
('R03', 'Tuyến E03', 'Sân bay Nội Bài', 'Cầu Giấy', 30.0, 15000);

INSERT INTO Buses (bus_id, plate_number, route_id, capacity, battery_level) 
VALUES
('B01', '29E-001.01', 'R01', 45, 85),
('B02', '29E-002.15', 'R02', 50, 40),
('B03', '29E-003.09', 'R01', 45, 15);

INSERT INTO Tickets (ticket_id, passenger_id, bus_id, tap_time, status) 
VALUES
(1, 'P01', 'B01', '2025-11-10 07:15:00', 'Success'),
(2, 'P02', 'B02', '2025-11-10 08:30:00', 'Success'),
(3, 'P03', 'B01', '2025-11-11 17:45:00', 'Failed'),
(4, 'P01', 'B03', '2025-11-12 06:00:00', 'Success');

update routes
set base_fare =base_fare*1.10
where route_id='R02';

update Passengers
set card_type='premium'
where passenger_id='P03';

delete from tickets
where status='failed';

select*from routes
where distance>20;

select full_name, phone from passengers
where card_type='student';

update routes
set base_fare=base_fare*0.5
where start_point='Hào Nam';

select bus_id,plate_number,battery_level from buses
order by battery_level desc;
 
update routes
set start_point=upper(start_point),
end_point=upper(end_point);

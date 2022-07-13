CLASS zju_generate_demo_data_ju DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zju_generate_demo_data_ju IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
     DELETE FROM ZJU_ATRAV_JU.
   DELETE FROM ZJU_ABOOK_JU.

   INSERT ZJU_ATRAV_JU FROM ( SELECT
   FROM /dmo/travel
   fields
   " INSERT TRAVEL DEMO DATA
  uuid(   )        as    travel_uuid,   "/* sysuuid_x16 not null;
  travel_id        as    travel_id,    "         : /dmo/travel_id;
  agency_id        as    agency_id,    "       : /dmo/agency_id;
  customer_id      as   customer_id,  "     : /dmo/customer_id;
  begin_date       as   begin_date,    "     : /dmo/begin_date;
  end_date         as   end_date,      "    : /dmo/end_date;
  BOOKING_FEE      AS   BOOKING_FEE, "
  total_price      as   total_price, "       : /dmo/total_price;
  currency_code    as   currency_code, "    : /dmo/currency_code;
  description      as  description,
  case  status
     when 'B' then 'A'  "accepted
     when 'X' then 'X'  "cencelled
     else 'O'           "open
   end as overall_status   , "     : /dmo/overall_status;
  createdby       as     created_by ,  "       : syuname;
  createdat       as      created_at , "         : timestampl;
  lastchangedby   as  last_changed_by , "      : syuname;
  lastchangedat   as  last_changed_at ,  "
  lastchangedat   as  local_last_changed_at
  order by travel_id UP TO 200 rows
    ).
  COMMIT WORK.

  " INSERT BOOKING DEMO DATA
     INSERT ZJU_ABOOK_JU FROM ( SELECT
   FROM /dmo/booking as booking
   join ZJU_ATRAV_JU as z
   on booking~travel_id = z~travel_id
   fields
" --------INSERT TRAVEL DEMO DATA
  uuid(  )                as     booking_uuid,   "/* sysuuid_x16 not null;
  z~travel_uuid           as     travel_uuid,    "         : /dmo/travel_id;
  booking~booking_id      as     booking_id,       " : /dmo/booking_id;
  booking~booking_date    as     booking_date,       " ;
  booking~customer_id     as     customer_id,       ";
  booking~carrier_id      as     carrier_id,       ";
  booking~connection_id   as     connection_id,       ";
  booking~flight_date     as     flight_date,       ";
  booking~flight_price    as     flight_price,       ";
  booking~currency_code   as     currency_code,       ";
  z~created_by            as     created_by ,
  z~last_changed_by       as     last_changed_by ,
  z~last_changed_at       as     local_last_changed_at
     ).
  COMMIT WORK.
 out->write(  'Travel anf booking demo data inserted' ) .
  ENDMETHOD.
ENDCLASS.

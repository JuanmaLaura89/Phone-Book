--------------------------------------------------------
--  File created - Thursday-June-13-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View AQ$DEF$_AQCALL
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$DEF$_AQCALL" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON") AS 
  SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   'READY',
                                1,   'WAIT',
                                2,   'PROCESSED',
                                3,   'EXPIRED',
                                10,  'BUFFERED_EXPIRED') MSG_STATE, cast(FROM_TZ(delay, '00:00')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, '00:00')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema, 
                                  1, exception_qschema, 
                                  2, exception_qschema,  
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                  1, exception_queue, 
                                  2, exception_queue,  
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3, 
                     decode(deq_time, NULL, 
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , 'MAX_RETRY_EXCEEDED',
                            'TIME_EXPIRATION'),
                              'INVALID_TRANSACTION', NULL,
                              'MAX_RETRY_EXCEEDED'), NULL), NULL) 
                             EXPIRATION_REASON  FROM "DEF$_AQCALL" WHERE state != 7 AND   state != 9 WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View AQ$DEF$_AQERROR
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$DEF$_AQERROR" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON") AS 
  SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   'READY',
                                1,   'WAIT',
                                2,   'PROCESSED',
                                3,   'EXPIRED',
                                10,  'BUFFERED_EXPIRED') MSG_STATE, cast(FROM_TZ(delay, '00:00')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, '00:00')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema, 
                                  1, exception_qschema, 
                                  2, exception_qschema,  
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                  1, exception_queue, 
                                  2, exception_queue,  
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3, 
                     decode(deq_time, NULL, 
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , 'MAX_RETRY_EXCEEDED',
                            'TIME_EXPIRATION'),
                              'INVALID_TRANSACTION', NULL,
                              'MAX_RETRY_EXCEEDED'), NULL), NULL) 
                             EXPIRATION_REASON  FROM "DEF$_AQERROR" WHERE state != 7 AND   state != 9 WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View AQ$_DEF$_AQCALL_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$_DEF$_AQCALL_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA", "QUEUE_ID") AS 
  SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "DEF$_AQCALL" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = 'SYSTEM' WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View AQ$_DEF$_AQERROR_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$_DEF$_AQERROR_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA", "QUEUE_ID") AS 
  SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "DEF$_AQERROR" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = 'SYSTEM' WITH READ ONLY
;
--------------------------------------------------------
--  DDL for View MVIEW_EVALUATIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_EVALUATIONS" ("RUNID", "MVIEW_OWNER", "MVIEW_NAME", "RANK", "STORAGE_IN_BYTES", "FREQUENCY", "CUMULATIVE_BENEFIT", "BENEFIT_TO_COST_RATIO") AS 
  select
  t1.runid# as runid,
  summary_owner AS mview_owner,
  summary_name AS mview_name,
  rank# as rank,
  storage_in_bytes,
  frequency,
  cumulative_benefit,
  benefit_to_cost_ratio
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 1
order by t1.rank#;

   COMMENT ON TABLE "SYSTEM"."MVIEW_EVALUATIONS"  IS 'This view gives DBA access to summary evaluation output'
;
--------------------------------------------------------
--  DDL for View MVIEW_EXCEPTIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_EXCEPTIONS" ("RUNID", "OWNER", "TABLE_NAME", "DIMENSION_NAME", "RELATIONSHIP", "BAD_ROWID") AS 
  select
  t1.runid# as runid,
  owner,
  table_name,
  dimension_name,
  relationship,
  bad_rowid
from SYSTEM.MVIEW$_ADV_EXCEPTIONS t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_EXCEPTIONS"  IS 'This view gives DBA access to dimension validation results'
;
--------------------------------------------------------
--  DDL for View MVIEW_FILTER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_FILTER" ("FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS 
  select
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from system.mview$_adv_filter a, system.mview$_adv_log b, ALL_USERS u
   WHERE a.filterid# = b.runid#
   AND b.uname = u.username
   AND u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_FILTER"  IS 'Workload filter records'
;
--------------------------------------------------------
--  DDL for View MVIEW_FILTERINSTANCE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_FILTERINSTANCE" ("RUNID", "FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS 
  select
      a.runid# as runid,
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from system.mview$_adv_filterinstance a;

   COMMENT ON TABLE "SYSTEM"."MVIEW_FILTERINSTANCE"  IS 'Workload filter instance records'
;
--------------------------------------------------------
--  DDL for View MVIEW_LOG
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_LOG" ("ID", "FILTERID", "RUN_BEGIN", "RUN_END", "TYPE", "STATUS", "MESSAGE", "COMPLETED", "TOTAL", "ERROR_CODE") AS 
  select
      m.runid# as id,
      m.filterid# as filterid,
      m.run_begin,
      m.run_end,
      decode(m.run_type,1,'EVALUATE',2,'EVALUATE_W',3,'RECOMMEND',
                      4,'RECOMMEND_W',5,'VALIDATE',6,'WORKLOAD',
                      7,'FILTER','UNKNOWN') AS type,
      decode(m.status,0,'UNUSED',1,'CANCELLED',2,'IN_PROGRESS',3,'COMPLETED',
                    4,'ERROR','UNKNOWN') AS status,
      m.message,
      m.completed,
      m.total,
      m.error_code
   from system.mview$_adv_log m, all_users u
   where m.uname = u.username
   and   u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_LOG"  IS 'Advisor session log'
;
--------------------------------------------------------
--  DDL for View MVIEW_RECOMMENDATIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_RECOMMENDATIONS" ("RUNID", "ALL_TABLES", "FACT_TABLES", "GROUPING_LEVELS", "QUERY_TEXT", "RECOMMENDATION_NUMBER", "RECOMMENDED_ACTION", "MVIEW_OWNER", "MVIEW_NAME", "STORAGE_IN_BYTES", "PCT_PERFORMANCE_GAIN", "BENEFIT_TO_COST_RATIO") AS 
  select
  t1.runid# as runid,
  t1.from_clause as all_tables,
  fact_tables,
  grouping_levels,
  query_text,
  rank# as recommendation_number,
  action_type as recommended_action,
  summary_owner as mview_owner,
  summary_name as mview_name,
  storage_in_bytes,
  pct_performance_gain,
  benefit_to_cost_ratio
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 0
order by t1.rank#;

   COMMENT ON TABLE "SYSTEM"."MVIEW_RECOMMENDATIONS"  IS 'This view gives DBA access to summary recommendations'
;
--------------------------------------------------------
--  DDL for View MVIEW_WORKLOAD
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_WORKLOAD" ("WORKLOADID", "IMPORT_TIME", "QUERYID", "APPLICATION", "CARDINALITY", "RESULTSIZE", "LASTUSE", "FREQUENCY", "OWNER", "PRIORITY", "QUERY", "RESPONSETIME") AS 
  select
  a.collectionid# as workloadid,
  a.collecttime as import_time,
  a.queryid# as queryid,
  a.application,
  a.cardinality,
  a.resultsize,
  a.qdate as lastuse,
  a.frequency,
  a.uname as owner,
  a.priority,
  a.sql_text as query,
  a.exec_time as responsetime
from SYSTEM.MVIEW$_ADV_WORKLOAD A, SYSTEM.MVIEW$_ADV_LOG B, ALL_USERS D
WHERE a.collectionid# = b.runid#
AND b.uname = d.username
AND d.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_WORKLOAD"  IS 'This view gives DBA access to shared workload'
;
--------------------------------------------------------
--  DDL for View PRODUCT_PRIVS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."PRODUCT_PRIVS" ("PRODUCT", "USERID", "ATTRIBUTE", "SCOPE", "NUMERIC_VALUE", "CHAR_VALUE", "DATE_VALUE", "LONG_VALUE") AS 
  SELECT PRODUCT, USERID, ATTRIBUTE, SCOPE,
         NUMERIC_VALUE, CHAR_VALUE, DATE_VALUE, LONG_VALUE
  FROM SQLPLUS_PRODUCT_PROFILE
  WHERE USERID = 'PUBLIC' OR USER LIKE USERID
;
--------------------------------------------------------
--  DDL for Type REPCAT$_OBJECT_NULL_VECTOR
--------------------------------------------------------

  CREATE OR REPLACE TYPE "SYSTEM"."REPCAT$_OBJECT_NULL_VECTOR" AS OBJECT
(
  -- type owner, name, hashcode for the type represented by null_vector
  type_owner      VARCHAR2(30),
  type_name       VARCHAR2(30),
  type_hashcode   RAW(17),
  -- null_vector for a particular object instance
  -- ROBJ REVISIT: should only contain the null image, and not version#
  null_vector     RAW(2000)
)

/
--------------------------------------------------------
--  DDL for Table AQ$_INTERNET_AGENTS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AQ$_INTERNET_AGENTS" 
   (	"AGENT_NAME" VARCHAR2(30 BYTE), 
	"PROTOCOL" NUMBER(*,0), 
	"SPARE1" VARCHAR2(128 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table AQ$_INTERNET_AGENT_PRIVS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AQ$_INTERNET_AGENT_PRIVS" 
   (	"AGENT_NAME" VARCHAR2(30 BYTE), 
	"DB_USERNAME" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table AQ$_QUEUES
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AQ$_QUEUES" 
   (	"OID" RAW(16), 
	"EVENTID" NUMBER, 
	"NAME" VARCHAR2(30 BYTE), 
	"TABLE_OBJNO" NUMBER, 
	"USAGE" NUMBER, 
	"ENABLE_FLAG" NUMBER, 
	"MAX_RETRIES" NUMBER, 
	"RETRY_DELAY" NUMBER, 
	"PROPERTIES" NUMBER, 
	"RET_TIME" NUMBER, 
	"QUEUE_COMMENT" VARCHAR2(2000 BYTE), 
	"SUBSCRIBERS" "SYS"."AQ$_SUBSCRIBERS" , 
	"MEMORY_THRESHOLD" NUMBER, 
	"SERVICE_NAME" VARCHAR2(64 BYTE), 
	"NETWORK_NAME" VARCHAR2(256 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table AQ$_QUEUE_TABLES
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AQ$_QUEUE_TABLES" 
   (	"SCHEMA" VARCHAR2(30 BYTE), 
	"NAME" VARCHAR2(30 BYTE), 
	"UDATA_TYPE" NUMBER, 
	"OBJNO" NUMBER, 
	"FLAGS" NUMBER, 
	"SORT_COLS" NUMBER, 
	"TIMEZONE" VARCHAR2(64 BYTE), 
	"TABLE_COMMENT" VARCHAR2(2000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table AQ$_SCHEDULES
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."AQ$_SCHEDULES" 
   (	"OID" RAW(16), 
	"DESTINATION" VARCHAR2(128 BYTE), 
	"START_TIME" DATE, 
	"DURATION" VARCHAR2(8 BYTE), 
	"NEXT_TIME" VARCHAR2(128 BYTE), 
	"LATENCY" VARCHAR2(8 BYTE), 
	"LAST_TIME" DATE, 
	"JOBNO" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table CORREO
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."CORREO" 
   (	"IDCONTACT" NUMBER(10,0), 
	"EMAILADDRESS" VARCHAR2(255 BYTE), 
	"EMAILTYPE" VARCHAR2(12 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table DEF$_CALLDEST
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."DEF$_CALLDEST" 
   (	"ENQ_TID" VARCHAR2(22 BYTE), 
	"STEP_NO" NUMBER, 
	"DBLINK" VARCHAR2(128 BYTE), 
	"SCHEMA_NAME" VARCHAR2(30 BYTE), 
	"PACKAGE_NAME" VARCHAR2(30 BYTE), 
	"CATCHUP" RAW(16) DEFAULT '00'
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."DEF$_CALLDEST"."ENQ_TID" IS 'Transaction ID';
   COMMENT ON COLUMN "SYSTEM"."DEF$_CALLDEST"."STEP_NO" IS 'Unique ID of call within transaction';
   COMMENT ON COLUMN "SYSTEM"."DEF$_CALLDEST"."DBLINK" IS 'The destination database';
   COMMENT ON COLUMN "SYSTEM"."DEF$_CALLDEST"."SCHEMA_NAME" IS 'The schema of the deferred remote procedure call';
   COMMENT ON COLUMN "SYSTEM"."DEF$_CALLDEST"."PACKAGE_NAME" IS 'The package of the deferred remote procedure call';
   COMMENT ON COLUMN "SYSTEM"."DEF$_CALLDEST"."CATCHUP" IS 'Dummy column for foreign key';
   COMMENT ON TABLE "SYSTEM"."DEF$_CALLDEST"  IS 'Information about call destinations for D-type and error transactions';
--------------------------------------------------------
--  DDL for Table DEF$_DEFAULTDEST
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."DEF$_DEFAULTDEST" 
   (	"DBLINK" VARCHAR2(128 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."DEF$_DEFAULTDEST"."DBLINK" IS 'Default destination';
   COMMENT ON TABLE "SYSTEM"."DEF$_DEFAULTDEST"  IS 'Default destinations for deferred remote procedure calls';
--------------------------------------------------------
--  DDL for Table DEF$_DESTINATION
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."DEF$_DESTINATION" 
   (	"DBLINK" VARCHAR2(128 BYTE), 
	"LAST_DELIVERED" NUMBER DEFAULT 0, 
	"LAST_ENQ_TID" VARCHAR2(22 BYTE), 
	"LAST_SEQ" NUMBER, 
	"DISABLED" CHAR(1 BYTE), 
	"JOB" NUMBER, 
	"LAST_TXN_COUNT" NUMBER, 
	"LAST_ERROR_NUMBER" NUMBER, 
	"LAST_ERROR_MESSAGE" VARCHAR2(2000 BYTE), 
	"APPLY_INIT" VARCHAR2(4000 BYTE), 
	"CATCHUP" RAW(16) DEFAULT '00', 
	"ALTERNATE" CHAR(1 BYTE) DEFAULT 'F', 
	"TOTAL_TXN_COUNT" NUMBER DEFAULT 0, 
	"TOTAL_PROP_TIME_THROUGHPUT" NUMBER DEFAULT 0, 
	"TOTAL_PROP_TIME_LATENCY" NUMBER DEFAULT 0, 
	"TO_COMMUNICATION_SIZE" NUMBER DEFAULT 0, 
	"FROM_COMMUNICATION_SIZE" NUMBER DEFAULT 0, 
	"FLAG" RAW(4) DEFAULT '00000000', 
	"SPARE1" NUMBER DEFAULT 0, 
	"SPARE2" NUMBER DEFAULT 0, 
	"SPARE3" NUMBER DEFAULT 0, 
	"SPARE4" NUMBER DEFAULT 0
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."DEF$_DESTINATION"."DBLINK" IS 'Destination';
   COMMENT ON COLUMN "SYSTEM"."DEF$_DESTINATION"."LAST_DELIVERED" IS 'Value of delivery_order of last transaction propagated';
   COMMENT ON COLUMN "SYSTEM"."DEF$_DESTINATION"."LAST_ENQ_TID" IS 'Transaction ID of last transaction propagated';
   COMMENT ON COLUMN "SYSTEM"."DEF$_DESTINATION"."LAST_SEQ" IS 'Parallel prop seq number of last transaction propagated';
   COMMENT ON COLUMN "SYSTEM"."DEF$_DESTINATION"."DISABLED" IS 'Is propagation to destination disabled';
   COMMENT ON COLUMN "SYSTEM"."DEF$_DESTINATION"."JOB" IS 'Number of job that pushes queue';
   COMMENT ON COLUMN "SYSTEM"."DEF$_DESTINATION"."LAST_TXN_COUNT" IS 'Number of transactions pushed during last attempt';
   COMMENT ON COLUMN "SYSTEM"."DEF$_DESTINATION"."LAST_ERROR_NUMBER" IS 'Oracle error number from last push';
   COMMENT ON COLUMN "SYSTEM"."DEF$_DESTINATION"."LAST_ERROR_MESSAGE" IS 'Error message from last push';
   COMMENT ON COLUMN "SYSTEM"."DEF$_DESTINATION"."CATCHUP" IS 'Used to break transaction into pieces';
   COMMENT ON COLUMN "SYSTEM"."DEF$_DESTINATION"."ALTERNATE" IS 'Used to break transaction into pieces';
   COMMENT ON COLUMN "SYSTEM"."DEF$_DESTINATION"."TOTAL_TXN_COUNT" IS 'Total number of transactions pushed';
   COMMENT ON COLUMN "SYSTEM"."DEF$_DESTINATION"."TOTAL_PROP_TIME_THROUGHPUT" IS 'Total propagation time in seconds for measuring throughput';
   COMMENT ON COLUMN "SYSTEM"."DEF$_DESTINATION"."TOTAL_PROP_TIME_LATENCY" IS 'Total propagation time in seconds for measuring latency';
   COMMENT ON COLUMN "SYSTEM"."DEF$_DESTINATION"."TO_COMMUNICATION_SIZE" IS 'Total number of bytes sent to this dblink';
   COMMENT ON COLUMN "SYSTEM"."DEF$_DESTINATION"."FROM_COMMUNICATION_SIZE" IS 'Total number of bytes received from this dblink';
   COMMENT ON COLUMN "SYSTEM"."DEF$_DESTINATION"."SPARE1" IS 'Total number of round trips for this dblink';
   COMMENT ON COLUMN "SYSTEM"."DEF$_DESTINATION"."SPARE2" IS 'Total number of administrative requests';
   COMMENT ON COLUMN "SYSTEM"."DEF$_DESTINATION"."SPARE3" IS 'Total number of error transactions pushed';
   COMMENT ON COLUMN "SYSTEM"."DEF$_DESTINATION"."SPARE4" IS 'Total time in seconds spent sleeping during push';
   COMMENT ON TABLE "SYSTEM"."DEF$_DESTINATION"  IS 'Information about propagation to different destinations';
--------------------------------------------------------
--  DDL for Table DEF$_ERROR
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."DEF$_ERROR" 
   (	"ENQ_TID" VARCHAR2(22 BYTE), 
	"ORIGIN_TRAN_DB" VARCHAR2(128 BYTE), 
	"ORIGIN_ENQ_TID" VARCHAR2(22 BYTE), 
	"DESTINATION" VARCHAR2(128 BYTE), 
	"STEP_NO" NUMBER, 
	"RECEIVER" NUMBER, 
	"ENQ_TIME" DATE, 
	"ERROR_NUMBER" NUMBER, 
	"ERROR_MSG" VARCHAR2(2000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."DEF$_ERROR"."ENQ_TID" IS 'The ID of the transaction that created the error';
   COMMENT ON COLUMN "SYSTEM"."DEF$_ERROR"."ORIGIN_TRAN_DB" IS 'The database originating the deferred transaction';
   COMMENT ON COLUMN "SYSTEM"."DEF$_ERROR"."ORIGIN_ENQ_TID" IS 'The original ID of the transaction';
   COMMENT ON COLUMN "SYSTEM"."DEF$_ERROR"."DESTINATION" IS 'Database link used to address destination';
   COMMENT ON COLUMN "SYSTEM"."DEF$_ERROR"."STEP_NO" IS 'Unique ID of call that caused an error';
   COMMENT ON COLUMN "SYSTEM"."DEF$_ERROR"."RECEIVER" IS 'User ID of the original receiver';
   COMMENT ON COLUMN "SYSTEM"."DEF$_ERROR"."ENQ_TIME" IS 'Time original transaction enqueued';
   COMMENT ON COLUMN "SYSTEM"."DEF$_ERROR"."ERROR_NUMBER" IS 'Oracle error number';
   COMMENT ON COLUMN "SYSTEM"."DEF$_ERROR"."ERROR_MSG" IS 'Error message text';
   COMMENT ON TABLE "SYSTEM"."DEF$_ERROR"  IS 'Information about all deferred transactions that caused an error';
--------------------------------------------------------
--  DDL for Table DEF$_LOB
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."DEF$_LOB" 
   (	"ID" RAW(16), 
	"ENQ_TID" VARCHAR2(22 BYTE), 
	"BLOB_COL" BLOB, 
	"CLOB_COL" CLOB, 
	"NCLOB_COL" NCLOB
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("BLOB_COL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 0
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("CLOB_COL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 0
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("NCLOB_COL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 0
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "SYSTEM"."DEF$_LOB"."ID" IS 'Identifier of LOB parameter';
   COMMENT ON COLUMN "SYSTEM"."DEF$_LOB"."ENQ_TID" IS 'Transaction identifier for deferred RPC with this LOB parameter';
   COMMENT ON COLUMN "SYSTEM"."DEF$_LOB"."BLOB_COL" IS 'Binary LOB parameter';
   COMMENT ON COLUMN "SYSTEM"."DEF$_LOB"."CLOB_COL" IS 'Character LOB parameter';
   COMMENT ON COLUMN "SYSTEM"."DEF$_LOB"."NCLOB_COL" IS 'National Character LOB parameter';
   COMMENT ON TABLE "SYSTEM"."DEF$_LOB"  IS 'Storage for LOB parameters to deferred RPCs';
--------------------------------------------------------
--  DDL for Table DEF$_ORIGIN
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."DEF$_ORIGIN" 
   (	"ORIGIN_DB" VARCHAR2(128 BYTE), 
	"ORIGIN_DBLINK" VARCHAR2(128 BYTE), 
	"INUSR" NUMBER, 
	"CSCN" NUMBER, 
	"ENQ_TID" VARCHAR2(22 BYTE), 
	"RECO_SEQ_NO" NUMBER, 
	"CATCHUP" RAW(16) DEFAULT '00'
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."DEF$_ORIGIN"."ORIGIN_DB" IS 'Originating database for the deferred transaction';
   COMMENT ON COLUMN "SYSTEM"."DEF$_ORIGIN"."ORIGIN_DBLINK" IS 'Database link from deferred transaction origin to this site';
   COMMENT ON COLUMN "SYSTEM"."DEF$_ORIGIN"."INUSR" IS 'Connected user receiving the deferred transaction';
   COMMENT ON COLUMN "SYSTEM"."DEF$_ORIGIN"."CSCN" IS 'Prepare SCN assigned at origin site';
   COMMENT ON COLUMN "SYSTEM"."DEF$_ORIGIN"."ENQ_TID" IS 'Transaction id assigned at origin site';
   COMMENT ON COLUMN "SYSTEM"."DEF$_ORIGIN"."RECO_SEQ_NO" IS 'Deferred transaction sequence number for recovery';
   COMMENT ON COLUMN "SYSTEM"."DEF$_ORIGIN"."CATCHUP" IS 'Used to break transaction into pieces';
   COMMENT ON TABLE "SYSTEM"."DEF$_ORIGIN"  IS 'Information about deferred transactions pushed to this site';
--------------------------------------------------------
--  DDL for Table DEF$_PROPAGATOR
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."DEF$_PROPAGATOR" 
   (	"USERID" NUMBER, 
	"USERNAME" VARCHAR2(30 BYTE), 
	"CREATED" DATE DEFAULT SYSDATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."DEF$_PROPAGATOR"."USERID" IS 'User ID of the propagator';
   COMMENT ON COLUMN "SYSTEM"."DEF$_PROPAGATOR"."USERNAME" IS 'User name of the propagator';
   COMMENT ON COLUMN "SYSTEM"."DEF$_PROPAGATOR"."CREATED" IS 'The time when the propagator is registered';
   COMMENT ON TABLE "SYSTEM"."DEF$_PROPAGATOR"  IS 'The propagator for deferred remote procedure calls';
--------------------------------------------------------
--  DDL for Table DEF$_PUSHED_TRANSACTIONS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."DEF$_PUSHED_TRANSACTIONS" 
   (	"SOURCE_SITE_ID" NUMBER, 
	"LAST_TRAN_ID" NUMBER DEFAULT 0, 
	"DISABLED" VARCHAR2(1 BYTE) DEFAULT 'F', 
	"SOURCE_SITE" VARCHAR2(128 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."DEF$_PUSHED_TRANSACTIONS"."SOURCE_SITE_ID" IS 'Originating database identifier for the deferred transaction';
   COMMENT ON COLUMN "SYSTEM"."DEF$_PUSHED_TRANSACTIONS"."LAST_TRAN_ID" IS 'Last committed transaction';
   COMMENT ON COLUMN "SYSTEM"."DEF$_PUSHED_TRANSACTIONS"."DISABLED" IS 'Disable propagation';
   COMMENT ON COLUMN "SYSTEM"."DEF$_PUSHED_TRANSACTIONS"."SOURCE_SITE" IS 'Obsolete - do not use';
   COMMENT ON TABLE "SYSTEM"."DEF$_PUSHED_TRANSACTIONS"  IS 'Information about deferred transactions pushed to this site by RepAPI clients';
--------------------------------------------------------
--  DDL for Table DIRECCION
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."DIRECCION" 
   (	"IDCONTACT" NUMBER(10,0), 
	"ADDRESS" VARCHAR2(255 BYTE), 
	"CITY" VARCHAR2(255 BYTE), 
	"COUNTRY" VARCHAR2(255 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table HELP
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."HELP" 
   (	"TOPIC" VARCHAR2(50 BYTE), 
	"SEQ" NUMBER, 
	"INFO" VARCHAR2(80 BYTE)
   ) PCTFREE 0 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 49152 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table LOGMNRC_DBNAME_UID_MAP
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNRC_DBNAME_UID_MAP" 
   (	"GLOBAL_NAME" VARCHAR2(128 BYTE), 
	"LOGMNR_UID" NUMBER, 
	"FLAGS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Table LOGMNRC_GSBA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNRC_GSBA" 
   (	"LOGMNR_UID" NUMBER, 
	"AS_OF_SCN" NUMBER, 
	"FDO_LENGTH" NUMBER, 
	"FDO_VALUE" RAW(255), 
	"CHARSETID" NUMBER, 
	"NCHARSETID" NUMBER, 
	"DBTIMEZONE_LEN" NUMBER, 
	"DBTIMEZONE_VALUE" VARCHAR2(64 BYTE), 
	"LOGMNR_SPARE1" NUMBER, 
	"LOGMNR_SPARE2" NUMBER, 
	"LOGMNR_SPARE3" VARCHAR2(1000 BYTE), 
	"LOGMNR_SPARE4" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNRC_GSII
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNRC_GSII" 
   (	"LOGMNR_UID" NUMBER, 
	"OBJ#" NUMBER, 
	"BO#" NUMBER, 
	"INDTYPE#" NUMBER, 
	"DROP_SCN" NUMBER, 
	"LOGMNR_SPARE1" NUMBER, 
	"LOGMNR_SPARE2" NUMBER, 
	"LOGMNR_SPARE3" VARCHAR2(1000 BYTE), 
	"LOGMNR_SPARE4" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNRC_GTCS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNRC_GTCS" 
   (	"LOGMNR_UID" NUMBER, 
	"OBJ#" NUMBER, 
	"OBJV#" NUMBER, 
	"SEGCOL#" NUMBER, 
	"INTCOL#" NUMBER, 
	"COLNAME" VARCHAR2(30 BYTE), 
	"TYPE#" NUMBER, 
	"LENGTH" NUMBER, 
	"PRECISION" NUMBER, 
	"SCALE" NUMBER, 
	"INTERVAL_LEADING_PRECISION" NUMBER, 
	"INTERVAL_TRAILING_PRECISION" NUMBER, 
	"PROPERTY" NUMBER, 
	"TOID" RAW(16), 
	"CHARSETID" NUMBER, 
	"CHARSETFORM" NUMBER, 
	"TYPENAME" VARCHAR2(30 BYTE), 
	"FQCOLNAME" VARCHAR2(4000 BYTE), 
	"NUMINTCOLS" NUMBER, 
	"NUMATTRS" NUMBER, 
	"ADTORDER" NUMBER, 
	"LOGMNR_SPARE1" NUMBER, 
	"LOGMNR_SPARE2" NUMBER, 
	"LOGMNR_SPARE3" VARCHAR2(1000 BYTE), 
	"LOGMNR_SPARE4" DATE, 
	"LOGMNR_SPARE5" NUMBER, 
	"LOGMNR_SPARE6" NUMBER, 
	"LOGMNR_SPARE7" NUMBER, 
	"LOGMNR_SPARE8" NUMBER, 
	"LOGMNR_SPARE9" NUMBER, 
	"COL#" NUMBER, 
	"XTYPESCHEMANAME" VARCHAR2(30 BYTE), 
	"XTYPENAME" VARCHAR2(4000 BYTE), 
	"XFQCOLNAME" VARCHAR2(4000 BYTE), 
	"XTOPINTCOL" NUMBER, 
	"XREFFEDTABLEOBJN" NUMBER, 
	"XREFFEDTABLEOBJV" NUMBER, 
	"XCOLTYPEFLAGS" NUMBER, 
	"XOPQTYPETYPE" NUMBER, 
	"XOPQTYPEFLAGS" NUMBER, 
	"XOPQLOBINTCOL" NUMBER, 
	"XOPQOBJINTCOL" NUMBER, 
	"XXMLINTCOL" NUMBER, 
	"EAOWNER#" NUMBER, 
	"EAMKEYID" VARCHAR2(64 BYTE), 
	"EAENCALG" NUMBER, 
	"EAINTALG" NUMBER, 
	"EACOLKLC" RAW(2000), 
	"EAKLCLEN" NUMBER, 
	"EAFLAGS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNRC_GTLO
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNRC_GTLO" 
   (	"LOGMNR_UID" NUMBER, 
	"KEYOBJ#" NUMBER, 
	"LVLCNT" NUMBER, 
	"BASEOBJ#" NUMBER, 
	"BASEOBJV#" NUMBER, 
	"LVL1OBJ#" NUMBER, 
	"LVL2OBJ#" NUMBER, 
	"LVL0TYPE#" NUMBER, 
	"LVL1TYPE#" NUMBER, 
	"LVL2TYPE#" NUMBER, 
	"OWNER#" NUMBER, 
	"OWNERNAME" VARCHAR2(30 BYTE), 
	"LVL0NAME" VARCHAR2(30 BYTE), 
	"LVL1NAME" VARCHAR2(30 BYTE), 
	"LVL2NAME" VARCHAR2(30 BYTE), 
	"INTCOLS" NUMBER, 
	"COLS" NUMBER, 
	"KERNELCOLS" NUMBER, 
	"TAB_FLAGS" NUMBER, 
	"TRIGFLAG" NUMBER, 
	"ASSOC#" NUMBER, 
	"OBJ_FLAGS" NUMBER, 
	"TS#" NUMBER, 
	"TSNAME" VARCHAR2(30 BYTE), 
	"PROPERTY" NUMBER, 
	"START_SCN" NUMBER, 
	"DROP_SCN" NUMBER, 
	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"FLAGS" NUMBER, 
	"LOGMNR_SPARE1" NUMBER, 
	"LOGMNR_SPARE2" NUMBER, 
	"LOGMNR_SPARE3" VARCHAR2(1000 BYTE), 
	"LOGMNR_SPARE4" DATE, 
	"LOGMNR_SPARE5" NUMBER, 
	"LOGMNR_SPARE6" NUMBER, 
	"LOGMNR_SPARE7" NUMBER, 
	"LOGMNR_SPARE8" NUMBER, 
	"LOGMNR_SPARE9" NUMBER, 
	"PARTTYPE" NUMBER, 
	"SUBPARTTYPE" NUMBER, 
	"UNSUPPORTEDCOLS" NUMBER, 
	"COMPLEXTYPECOLS" NUMBER, 
	"NTPARENTOBJNUM" NUMBER, 
	"NTPARENTOBJVERSION" NUMBER, 
	"NTPARENTINTCOLNUM" NUMBER, 
	"LOGMNRTLOFLAGS" NUMBER, 
	"LOGMNRMCV" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNRP_CTAS_PART_MAP
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNRP_CTAS_PART_MAP" 
   (	"LOGMNR_UID" NUMBER, 
	"BASEOBJ#" NUMBER, 
	"BASEOBJV#" NUMBER, 
	"KEYOBJ#" NUMBER, 
	"PART#" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(1000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNRT_MDDL$
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYSTEM"."LOGMNRT_MDDL$" 
   (	"SOURCE_OBJ#" NUMBER, 
	"SOURCE_ROWID" ROWID, 
	"DEST_ROWID" ROWID
   ) ON COMMIT DELETE ROWS ;
--------------------------------------------------------
--  DDL for Table LOGMNR_AGE_SPILL$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_AGE_SPILL$" 
   (	"SESSION#" NUMBER, 
	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"CHUNK" NUMBER, 
	"SEQUENCE#" NUMBER, 
	"OFFSET" NUMBER, 
	"SPILL_DATA" BLOB, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
 LOB ("SPILL_DATA") STORE AS BASICFILE (
  TABLESPACE "SYSAUX" ENABLE STORAGE IN ROW CHUNK 16384 PCTVERSION 0
  CACHE 
  STORAGE(INITIAL 16384 NEXT 16384 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_ATTRCOL$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_ATTRCOL$" 
   (	"INTCOL#" NUMBER, 
	"NAME" VARCHAR2(4000 BYTE), 
	"OBJ#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_ATTRIBUTE$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_ATTRIBUTE$" 
   (	"VERSION#" NUMBER, 
	"NAME" VARCHAR2(30 BYTE), 
	"ATTRIBUTE#" NUMBER, 
	"ATTR_TOID" RAW(16), 
	"ATTR_VERSION#" NUMBER, 
	"SYNOBJ#" NUMBER, 
	"PROPERTIES" NUMBER, 
	"CHARSETID" NUMBER, 
	"CHARSETFORM" NUMBER, 
	"LENGTH" NUMBER, 
	"PRECISION#" NUMBER, 
	"SCALE" NUMBER, 
	"EXTERNNAME" VARCHAR2(4000 BYTE), 
	"XFLAGS" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" NUMBER, 
	"SPARE5" NUMBER, 
	"SETTER" NUMBER, 
	"GETTER" NUMBER, 
	"TOID" RAW(16), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_CCOL$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_CCOL$" 
   (	"CON#" NUMBER, 
	"OBJ#" NUMBER, 
	"COL#" NUMBER, 
	"POS#" NUMBER, 
	"INTCOL#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_CDEF$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_CDEF$" 
   (	"CON#" NUMBER, 
	"COLS" NUMBER, 
	"TYPE#" NUMBER, 
	"ROBJ#" NUMBER, 
	"RCON#" NUMBER, 
	"ENABLED" NUMBER, 
	"DEFER" NUMBER, 
	"OBJ#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_COL$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_COL$" 
   (	"COL#" NUMBER(22,0), 
	"SEGCOL#" NUMBER(22,0), 
	"NAME" VARCHAR2(30 BYTE), 
	"TYPE#" NUMBER(22,0), 
	"LENGTH" NUMBER(22,0), 
	"PRECISION#" NUMBER(22,0), 
	"SCALE" NUMBER(22,0), 
	"NULL$" NUMBER(22,0), 
	"INTCOL#" NUMBER(22,0), 
	"PROPERTY" NUMBER(22,0), 
	"CHARSETID" NUMBER(22,0), 
	"CHARSETFORM" NUMBER(22,0), 
	"SPARE1" NUMBER(22,0), 
	"SPARE2" NUMBER(22,0), 
	"OBJ#" NUMBER(22,0), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_COLTYPE$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_COLTYPE$" 
   (	"COL#" NUMBER, 
	"INTCOL#" NUMBER, 
	"TOID" RAW(16), 
	"VERSION#" NUMBER, 
	"PACKED" NUMBER, 
	"INTCOLS" NUMBER, 
	"INTCOL#S" RAW(2000), 
	"FLAGS" NUMBER, 
	"TYPIDCOL#" NUMBER, 
	"SYNOBJ#" NUMBER, 
	"OBJ#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_DICTIONARY$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_DICTIONARY$" 
   (	"DB_NAME" VARCHAR2(9 BYTE), 
	"DB_ID" NUMBER(20,0), 
	"DB_CREATED" VARCHAR2(20 BYTE), 
	"DB_DICT_CREATED" VARCHAR2(20 BYTE), 
	"DB_DICT_SCN" NUMBER(22,0), 
	"DB_THREAD_MAP" RAW(8), 
	"DB_TXN_SCNBAS" NUMBER(22,0), 
	"DB_TXN_SCNWRP" NUMBER(22,0), 
	"DB_RESETLOGS_CHANGE#" NUMBER(22,0), 
	"DB_RESETLOGS_TIME" VARCHAR2(20 BYTE), 
	"DB_VERSION_TIME" VARCHAR2(20 BYTE), 
	"DB_REDO_TYPE_ID" VARCHAR2(8 BYTE), 
	"DB_REDO_RELEASE" VARCHAR2(60 BYTE), 
	"DB_CHARACTER_SET" VARCHAR2(30 BYTE), 
	"DB_VERSION" VARCHAR2(64 BYTE), 
	"DB_STATUS" VARCHAR2(64 BYTE), 
	"DB_GLOBAL_NAME" VARCHAR2(128 BYTE), 
	"DB_DICT_MAXOBJECTS" NUMBER(22,0), 
	"DB_DICT_OBJECTCOUNT" NUMBER(22,0), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_DICTSTATE$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_DICTSTATE$" 
   (	"LOGMNR_UID" NUMBER(22,0), 
	"START_SCNBAS" NUMBER, 
	"START_SCNWRP" NUMBER, 
	"END_SCNBAS" NUMBER, 
	"END_SCNWRP" NUMBER, 
	"REDO_THREAD" NUMBER, 
	"RBASQN" NUMBER, 
	"RBABLK" NUMBER, 
	"RBABYTE" NUMBER, 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_ENC$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_ENC$" 
   (	"OBJ#" NUMBER, 
	"OWNER#" NUMBER, 
	"ENCALG" NUMBER, 
	"INTALG" NUMBER, 
	"COLKLC" RAW(2000), 
	"KLCLEN" NUMBER, 
	"FLAG" NUMBER, 
	"MKEYID" VARCHAR2(64 BYTE), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_ERROR$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_ERROR$" 
   (	"SESSION#" NUMBER, 
	"TIME_OF_ERROR" DATE, 
	"CODE" NUMBER, 
	"MESSAGE" VARCHAR2(4000 BYTE), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" VARCHAR2(4000 BYTE), 
	"SPARE5" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Table LOGMNR_FILTER$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_FILTER$" 
   (	"SESSION#" NUMBER, 
	"FILTER_TYPE" VARCHAR2(30 BYTE), 
	"ATTR1" NUMBER, 
	"ATTR2" NUMBER, 
	"ATTR3" NUMBER, 
	"ATTR4" NUMBER, 
	"ATTR5" NUMBER, 
	"ATTR6" NUMBER, 
	"FILTER_SCN" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Table LOGMNR_GLOBAL$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_GLOBAL$" 
   (	"HIGH_RECID_FOREIGN" NUMBER, 
	"HIGH_RECID_DELETED" NUMBER, 
	"LOCAL_RESET_SCN" NUMBER, 
	"LOCAL_RESET_TIMESTAMP" NUMBER, 
	"VERSION_TIMESTAMP" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" VARCHAR2(2000 BYTE), 
	"SPARE5" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Table LOGMNR_GT_TAB_INCLUDE$
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYSTEM"."LOGMNR_GT_TAB_INCLUDE$" 
   (	"SCHEMA_NAME" VARCHAR2(32 BYTE), 
	"TABLE_NAME" VARCHAR2(32 BYTE)
   ) ON COMMIT PRESERVE ROWS ;
--------------------------------------------------------
--  DDL for Table LOGMNR_GT_USER_INCLUDE$
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYSTEM"."LOGMNR_GT_USER_INCLUDE$" 
   (	"USER_NAME" VARCHAR2(32 BYTE), 
	"USER_TYPE" NUMBER
   ) ON COMMIT PRESERVE ROWS ;
--------------------------------------------------------
--  DDL for Table LOGMNR_GT_XID_INCLUDE$
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYSTEM"."LOGMNR_GT_XID_INCLUDE$" 
   (	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER
   ) ON COMMIT PRESERVE ROWS ;
--------------------------------------------------------
--  DDL for Table LOGMNR_ICOL$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_ICOL$" 
   (	"OBJ#" NUMBER, 
	"BO#" NUMBER, 
	"COL#" NUMBER, 
	"POS#" NUMBER, 
	"SEGCOL#" NUMBER, 
	"INTCOL#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_IND$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_IND$" 
   (	"BO#" NUMBER(22,0), 
	"COLS" NUMBER(22,0), 
	"TYPE#" NUMBER(22,0), 
	"FLAGS" NUMBER, 
	"PROPERTY" NUMBER, 
	"OBJ#" NUMBER(22,0), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_INDCOMPART$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_INDCOMPART$" 
   (	"OBJ#" NUMBER, 
	"DATAOBJ#" NUMBER, 
	"BO#" NUMBER, 
	"PART#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_INDPART$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_INDPART$" 
   (	"OBJ#" NUMBER, 
	"BO#" NUMBER, 
	"PART#" NUMBER, 
	"TS#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_INDSUBPART$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_INDSUBPART$" 
   (	"OBJ#" NUMBER(22,0), 
	"DATAOBJ#" NUMBER(22,0), 
	"POBJ#" NUMBER(22,0), 
	"SUBPART#" NUMBER(22,0), 
	"TS#" NUMBER(22,0), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_INTEGRATED_SPILL$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_INTEGRATED_SPILL$" 
   (	"SESSION#" NUMBER, 
	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"CHUNK" NUMBER, 
	"FLAG" NUMBER, 
	"CTIME" DATE, 
	"MTIME" DATE, 
	"SPILL_DATA" BLOB, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" DATE, 
	"SPARE5" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
 LOB ("SPILL_DATA") STORE AS BASICFILE (
  TABLESPACE "SYSAUX" ENABLE STORAGE IN ROW CHUNK 32768 PCTVERSION 0
  CACHE 
  STORAGE(INITIAL 4194304 NEXT 2097152 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_KOPM$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_KOPM$" 
   (	"LENGTH" NUMBER, 
	"METADATA" RAW(255), 
	"NAME" VARCHAR2(30 BYTE), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_LOB$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_LOB$" 
   (	"OBJ#" NUMBER, 
	"INTCOL#" NUMBER, 
	"COL#" NUMBER, 
	"LOBJ#" NUMBER, 
	"CHUNK" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_LOBFRAG$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_LOBFRAG$" 
   (	"FRAGOBJ#" NUMBER, 
	"PARENTOBJ#" NUMBER, 
	"TABFRAGOBJ#" NUMBER, 
	"INDFRAGOBJ#" NUMBER, 
	"FRAG#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_LOG$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_LOG$" 
   (	"SESSION#" NUMBER, 
	"THREAD#" NUMBER, 
	"SEQUENCE#" NUMBER, 
	"FIRST_CHANGE#" NUMBER, 
	"NEXT_CHANGE#" NUMBER, 
	"FIRST_TIME" DATE, 
	"NEXT_TIME" DATE, 
	"FILE_NAME" VARCHAR2(513 BYTE), 
	"STATUS" NUMBER, 
	"INFO" VARCHAR2(32 BYTE), 
	"TIMESTAMP" DATE, 
	"DICT_BEGIN" VARCHAR2(3 BYTE), 
	"DICT_END" VARCHAR2(3 BYTE), 
	"STATUS_INFO" VARCHAR2(32 BYTE), 
	"DB_ID" NUMBER, 
	"RESETLOGS_CHANGE#" NUMBER, 
	"RESET_TIMESTAMP" NUMBER, 
	"PREV_RESETLOGS_CHANGE#" NUMBER, 
	"PREV_RESET_TIMESTAMP" NUMBER, 
	"BLOCKS" NUMBER, 
	"BLOCK_SIZE" NUMBER, 
	"FLAGS" NUMBER, 
	"CONTENTS" NUMBER, 
	"RECID" NUMBER, 
	"RECSTAMP" NUMBER, 
	"MARK_DELETE_TIMESTAMP" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" NUMBER, 
	"SPARE5" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Table LOGMNR_LOGMNR_BUILDLOG
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_LOGMNR_BUILDLOG" 
   (	"BUILD_DATE" VARCHAR2(20 BYTE), 
	"DB_TXN_SCNBAS" NUMBER, 
	"DB_TXN_SCNWRP" NUMBER, 
	"CURRENT_BUILD_STATE" NUMBER, 
	"COMPLETION_STATUS" NUMBER, 
	"MARKED_LOG_FILE_LOW_SCN" NUMBER, 
	"INITIAL_XID" VARCHAR2(22 BYTE), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_NTAB$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_NTAB$" 
   (	"COL#" NUMBER, 
	"INTCOL#" NUMBER, 
	"NTAB#" NUMBER, 
	"NAME" VARCHAR2(4000 BYTE), 
	"OBJ#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_OBJ$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_OBJ$" 
   (	"OBJV#" NUMBER(22,0), 
	"OWNER#" NUMBER(22,0), 
	"NAME" VARCHAR2(30 BYTE), 
	"NAMESPACE" NUMBER(22,0), 
	"SUBNAME" VARCHAR2(30 BYTE), 
	"TYPE#" NUMBER(22,0), 
	"OID$" RAW(16), 
	"REMOTEOWNER" VARCHAR2(30 BYTE), 
	"LINKNAME" VARCHAR2(128 BYTE), 
	"FLAGS" NUMBER(22,0), 
	"SPARE3" NUMBER(22,0), 
	"STIME" DATE, 
	"OBJ#" NUMBER(22,0), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0), 
	"START_SCNBAS" NUMBER, 
	"START_SCNWRP" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_OPQTYPE$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_OPQTYPE$" 
   (	"INTCOL#" NUMBER, 
	"TYPE" NUMBER, 
	"FLAGS" NUMBER, 
	"LOBCOL" NUMBER, 
	"OBJCOL" NUMBER, 
	"EXTRACOL" NUMBER, 
	"SCHEMAOID" RAW(16), 
	"ELEMNUM" NUMBER, 
	"SCHEMAURL" VARCHAR2(4000 BYTE), 
	"OBJ#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_PARAMETER$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_PARAMETER$" 
   (	"SESSION#" NUMBER, 
	"NAME" VARCHAR2(30 BYTE), 
	"VALUE" VARCHAR2(2000 BYTE), 
	"TYPE" NUMBER, 
	"SCN" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table LOGMNR_PARTOBJ$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_PARTOBJ$" 
   (	"PARTTYPE" NUMBER, 
	"PARTCNT" NUMBER, 
	"PARTKEYCOLS" NUMBER, 
	"FLAGS" NUMBER, 
	"DEFTS#" NUMBER, 
	"DEFPCTFREE" NUMBER, 
	"DEFPCTUSED" NUMBER, 
	"DEFPCTTHRES" NUMBER, 
	"DEFINITRANS" NUMBER, 
	"DEFMAXTRANS" NUMBER, 
	"DEFTINIEXTS" NUMBER, 
	"DEFEXTSIZE" NUMBER, 
	"DEFMINEXTS" NUMBER, 
	"DEFMAXEXTS" NUMBER, 
	"DEFEXTPCT" NUMBER, 
	"DEFLISTS" NUMBER, 
	"DEFGROUPS" NUMBER, 
	"DEFLOGGING" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"DEFINCLCOL" NUMBER, 
	"PARAMETERS" VARCHAR2(1000 BYTE), 
	"OBJ#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_PROCESSED_LOG$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_PROCESSED_LOG$" 
   (	"SESSION#" NUMBER, 
	"THREAD#" NUMBER, 
	"SEQUENCE#" NUMBER, 
	"FIRST_CHANGE#" NUMBER, 
	"NEXT_CHANGE#" NUMBER, 
	"FIRST_TIME" DATE, 
	"NEXT_TIME" DATE, 
	"FILE_NAME" VARCHAR2(513 BYTE), 
	"STATUS" NUMBER, 
	"INFO" VARCHAR2(32 BYTE), 
	"TIMESTAMP" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Table LOGMNR_PROPS$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_PROPS$" 
   (	"VALUE$" VARCHAR2(4000 BYTE), 
	"COMMENT$" VARCHAR2(4000 BYTE), 
	"NAME" VARCHAR2(30 BYTE), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_REFCON$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_REFCON$" 
   (	"COL#" NUMBER, 
	"INTCOL#" NUMBER, 
	"REFTYP" NUMBER, 
	"STABID" RAW(16), 
	"EXPCTOID" RAW(16), 
	"OBJ#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_RESTART_CKPT$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_RESTART_CKPT$" 
   (	"SESSION#" NUMBER, 
	"VALID" NUMBER, 
	"CKPT_SCN" NUMBER, 
	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"SESSION_NUM" NUMBER, 
	"SERIAL_NUM" NUMBER, 
	"CKPT_INFO" BLOB, 
	"FLAG" NUMBER, 
	"OFFSET" NUMBER, 
	"CLIENT_DATA" BLOB, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
 LOB ("CKPT_INFO") STORE AS BASICFILE (
  TABLESPACE "SYSAUX" ENABLE STORAGE IN ROW CHUNK 16384 PCTVERSION 0
  CACHE 
  STORAGE(INITIAL 16384 NEXT 16384 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("CLIENT_DATA") STORE AS BASICFILE (
  TABLESPACE "SYSAUX" ENABLE STORAGE IN ROW CHUNK 16384 PCTVERSION 0
  CACHE 
  STORAGE(INITIAL 16384 NEXT 16384 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_RESTART_CKPT_TXINFO$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_RESTART_CKPT_TXINFO$" 
   (	"SESSION#" NUMBER, 
	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"SESSION_NUM" NUMBER, 
	"SERIAL_NUM" NUMBER, 
	"FLAG" NUMBER, 
	"START_SCN" NUMBER, 
	"EFFECTIVE_SCN" NUMBER, 
	"OFFSET" NUMBER, 
	"TX_DATA" BLOB
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
 LOB ("TX_DATA") STORE AS BASICFILE (
  TABLESPACE "SYSAUX" ENABLE STORAGE IN ROW CHUNK 16384 PCTVERSION 0
  CACHE 
  STORAGE(INITIAL 16384 NEXT 16384 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_SEED$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_SEED$" 
   (	"SEED_VERSION" NUMBER(22,0), 
	"GATHER_VERSION" NUMBER(22,0), 
	"SCHEMANAME" VARCHAR2(30 BYTE), 
	"OBJ#" NUMBER, 
	"OBJV#" NUMBER(22,0), 
	"TABLE_NAME" VARCHAR2(30 BYTE), 
	"COL_NAME" VARCHAR2(30 BYTE), 
	"COL#" NUMBER, 
	"INTCOL#" NUMBER, 
	"SEGCOL#" NUMBER, 
	"TYPE#" NUMBER, 
	"LENGTH" NUMBER, 
	"PRECISION#" NUMBER, 
	"SCALE" NUMBER, 
	"NULL$" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_SESSION$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_SESSION$" 
   (	"SESSION#" NUMBER, 
	"CLIENT#" NUMBER, 
	"SESSION_NAME" VARCHAR2(128 BYTE), 
	"DB_ID" NUMBER, 
	"RESETLOGS_CHANGE#" NUMBER, 
	"SESSION_ATTR" NUMBER, 
	"SESSION_ATTR_VERBOSE" VARCHAR2(400 BYTE), 
	"START_SCN" NUMBER, 
	"END_SCN" NUMBER, 
	"SPILL_SCN" NUMBER, 
	"SPILL_TIME" DATE, 
	"OLDEST_SCN" NUMBER, 
	"RESUME_SCN" NUMBER, 
	"GLOBAL_DB_NAME" VARCHAR2(128 BYTE) DEFAULT null, 
	"RESET_TIMESTAMP" NUMBER, 
	"BRANCH_SCN" NUMBER, 
	"VERSION" VARCHAR2(64 BYTE), 
	"REDO_COMPAT" VARCHAR2(20 BYTE), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" NUMBER, 
	"SPARE5" NUMBER, 
	"SPARE6" DATE, 
	"SPARE7" VARCHAR2(1000 BYTE), 
	"SPARE8" VARCHAR2(1000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table LOGMNR_SESSION_ACTIONS$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_SESSION_ACTIONS$" 
   (	"FLAGSRUNTIME" NUMBER DEFAULT 0, 
	"DROPSCN" NUMBER, 
	"MODIFYTIME" TIMESTAMP (6), 
	"DISPATCHTIME" TIMESTAMP (6), 
	"DROPTIME" TIMESTAMP (6), 
	"LCRCOUNT" NUMBER DEFAULT 0, 
	"ACTIONNAME" VARCHAR2(30 BYTE), 
	"LOGMNRSESSION#" NUMBER, 
	"PROCESSROLE#" NUMBER, 
	"ACTIONTYPE#" NUMBER, 
	"FLAGSDEFINETIME" NUMBER, 
	"CREATETIME" TIMESTAMP (6), 
	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"THREAD#" NUMBER, 
	"STARTSCN" NUMBER, 
	"STARTSUBSCN" NUMBER, 
	"ENDSCN" NUMBER, 
	"ENDSUBSCN" NUMBER, 
	"RBASQN" NUMBER, 
	"RBABLK" NUMBER, 
	"RBABYTE" NUMBER, 
	"SESSION#" NUMBER, 
	"OBJ#" NUMBER, 
	"ATTR1" NUMBER, 
	"ATTR2" NUMBER, 
	"ATTR3" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" TIMESTAMP (6), 
	"SPARE4" VARCHAR2(2000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Table LOGMNR_SESSION_EVOLVE$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_SESSION_EVOLVE$" 
   (	"BRANCH_LEVEL" NUMBER, 
	"SESSION#" NUMBER, 
	"DB_ID" NUMBER, 
	"RESET_SCN" NUMBER, 
	"RESET_TIMESTAMP" NUMBER, 
	"PREV_RESET_SCN" NUMBER, 
	"PREV_RESET_TIMESTAMP" NUMBER, 
	"STATUS" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SPARE4" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Table LOGMNR_SPILL$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_SPILL$" 
   (	"SESSION#" NUMBER, 
	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"CHUNK" NUMBER, 
	"STARTIDX" NUMBER, 
	"ENDIDX" NUMBER, 
	"FLAG" NUMBER, 
	"SEQUENCE#" NUMBER, 
	"SPILL_DATA" BLOB, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
 LOB ("SPILL_DATA") STORE AS BASICFILE (
  TABLESPACE "SYSAUX" ENABLE STORAGE IN ROW CHUNK 16384 PCTVERSION 0
  CACHE 
  STORAGE(INITIAL 16384 NEXT 16384 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_SUBCOLTYPE$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_SUBCOLTYPE$" 
   (	"INTCOL#" NUMBER, 
	"TOID" RAW(16), 
	"VERSION#" NUMBER, 
	"INTCOLS" NUMBER, 
	"INTCOL#S" RAW(2000), 
	"FLAGS" NUMBER, 
	"SYNOBJ#" NUMBER, 
	"OBJ#" NUMBER, 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_TAB$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_TAB$" 
   (	"TS#" NUMBER(22,0), 
	"COLS" NUMBER(22,0), 
	"PROPERTY" NUMBER(22,0), 
	"INTCOLS" NUMBER(22,0), 
	"KERNELCOLS" NUMBER(22,0), 
	"BOBJ#" NUMBER(22,0), 
	"TRIGFLAG" NUMBER(22,0), 
	"FLAGS" NUMBER(22,0), 
	"OBJ#" NUMBER(22,0), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_TABCOMPART$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_TABCOMPART$" 
   (	"OBJ#" NUMBER(22,0), 
	"BO#" NUMBER(22,0), 
	"PART#" NUMBER(22,0), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_TABPART$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_TABPART$" 
   (	"OBJ#" NUMBER(22,0), 
	"TS#" NUMBER(22,0), 
	"PART#" NUMBER, 
	"BO#" NUMBER(22,0), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_TABSUBPART$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_TABSUBPART$" 
   (	"OBJ#" NUMBER(22,0), 
	"DATAOBJ#" NUMBER(22,0), 
	"POBJ#" NUMBER(22,0), 
	"SUBPART#" NUMBER(22,0), 
	"TS#" NUMBER(22,0), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_TS$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_TS$" 
   (	"TS#" NUMBER(22,0), 
	"NAME" VARCHAR2(30 BYTE), 
	"OWNER#" NUMBER(22,0), 
	"BLOCKSIZE" NUMBER(22,0), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_TYPE$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_TYPE$" 
   (	"VERSION#" NUMBER, 
	"VERSION" VARCHAR2(30 BYTE), 
	"TVOID" RAW(16), 
	"TYPECODE" NUMBER, 
	"PROPERTIES" NUMBER, 
	"ATTRIBUTES" NUMBER, 
	"METHODS" NUMBER, 
	"HIDDENMETHODS" NUMBER, 
	"SUPERTYPES" NUMBER, 
	"SUBTYPES" NUMBER, 
	"EXTERNTYPE" NUMBER, 
	"EXTERNNAME" VARCHAR2(4000 BYTE), 
	"HELPERCLASSNAME" VARCHAR2(4000 BYTE), 
	"LOCAL_ATTRS" NUMBER, 
	"LOCAL_METHODS" NUMBER, 
	"TYPEID" RAW(16), 
	"ROOTTOID" RAW(16), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" NUMBER, 
	"SUPERTOID" RAW(16), 
	"HASHCODE" RAW(17), 
	"TOID" RAW(16), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGMNR_UID$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_UID$" 
   (	"LOGMNR_UID" NUMBER(22,0), 
	"SESSION#" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Table LOGMNR_USER$
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGMNR_USER$" 
   (	"USER#" NUMBER(22,0), 
	"NAME" VARCHAR2(30 BYTE), 
	"LOGMNR_UID" NUMBER(22,0), 
	"LOGMNR_FLAGS" NUMBER(22,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("LOGMNR_UID") 
 (PARTITION "P_LESSTHAN100"  VALUES LESS THAN (100) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$APPLY_MILESTONE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGSTDBY$APPLY_MILESTONE" 
   (	"SESSION_ID" NUMBER, 
	"COMMIT_SCN" NUMBER, 
	"COMMIT_TIME" DATE, 
	"SYNCH_SCN" NUMBER, 
	"EPOCH" NUMBER, 
	"PROCESSED_SCN" NUMBER, 
	"PROCESSED_TIME" DATE, 
	"FETCHLWM_SCN" NUMBER DEFAULT (0), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$APPLY_PROGRESS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGSTDBY$APPLY_PROGRESS" 
   (	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"COMMIT_SCN" NUMBER, 
	"COMMIT_TIME" DATE, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
  PARTITION BY RANGE ("COMMIT_SCN") 
 (PARTITION "P0"  VALUES LESS THAN (0) 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$EDS_TABLES
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGSTDBY$EDS_TABLES" 
   (	"OWNER" VARCHAR2(30 BYTE), 
	"TABLE_NAME" VARCHAR2(30 BYTE), 
	"SHADOW_TABLE_NAME" VARCHAR2(30 BYTE), 
	"BASE_TRIGGER_NAME" VARCHAR2(30 BYTE), 
	"SHADOW_TRIGGER_NAME" VARCHAR2(30 BYTE), 
	"DBLINK" VARCHAR2(255 BYTE), 
	"FLAGS" NUMBER, 
	"STATE" VARCHAR2(255 BYTE), 
	"OBJV" NUMBER, 
	"OBJ#" NUMBER, 
	"SOBJ#" NUMBER, 
	"CTIME" TIMESTAMP (6), 
	"SPARE1" NUMBER, 
	"SPARE2" VARCHAR2(255 BYTE), 
	"SPARE3" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$EVENTS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGSTDBY$EVENTS" 
   (	"EVENT_TIME" TIMESTAMP (6), 
	"CURRENT_SCN" NUMBER, 
	"COMMIT_SCN" NUMBER, 
	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"ERRVAL" NUMBER, 
	"EVENT" VARCHAR2(2000 BYTE), 
	"FULL_EVENT" CLOB, 
	"ERROR" VARCHAR2(2000 BYTE), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
 LOB ("FULL_EVENT") STORE AS BASICFILE (
  TABLESPACE "SYSAUX" ENABLE STORAGE IN ROW CHUNK 16384 PCTVERSION 0
  CACHE 
  STORAGE(INITIAL 16384 NEXT 16384 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$FLASHBACK_SCN
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGSTDBY$FLASHBACK_SCN" 
   (	"PRIMARY_SCN" NUMBER, 
	"PRIMARY_TIME" DATE, 
	"STANDBY_SCN" NUMBER, 
	"STANDBY_TIME" DATE, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$HISTORY
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGSTDBY$HISTORY" 
   (	"STREAM_SEQUENCE#" NUMBER, 
	"LMNR_SID" NUMBER, 
	"DBID" NUMBER, 
	"FIRST_CHANGE#" NUMBER, 
	"LAST_CHANGE#" NUMBER, 
	"SOURCE" NUMBER, 
	"STATUS" NUMBER, 
	"FIRST_TIME" DATE, 
	"LAST_TIME" DATE, 
	"DGNAME" VARCHAR2(255 BYTE), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$PARAMETERS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGSTDBY$PARAMETERS" 
   (	"NAME" VARCHAR2(30 BYTE), 
	"VALUE" VARCHAR2(2000 BYTE), 
	"TYPE" NUMBER, 
	"SCN" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$PLSQL
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGSTDBY$PLSQL" 
   (	"SESSION_ID" NUMBER, 
	"START_FINISH" NUMBER, 
	"CALL_TEXT" CLOB, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
 LOB ("CALL_TEXT") STORE AS BASICFILE (
  TABLESPACE "SYSAUX" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$SCN
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGSTDBY$SCN" 
   (	"OBJ#" NUMBER, 
	"OBJNAME" VARCHAR2(4000 BYTE), 
	"SCHEMA" VARCHAR2(30 BYTE), 
	"TYPE" VARCHAR2(20 BYTE), 
	"SCN" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$SKIP
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGSTDBY$SKIP" 
   (	"ERROR" NUMBER, 
	"STATEMENT_OPT" VARCHAR2(30 BYTE), 
	"SCHEMA" VARCHAR2(30 BYTE), 
	"NAME" VARCHAR2(65 BYTE), 
	"USE_LIKE" NUMBER, 
	"ESC" VARCHAR2(1 BYTE), 
	"PROC" VARCHAR2(98 BYTE), 
	"ACTIVE" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$SKIP_SUPPORT
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGSTDBY$SKIP_SUPPORT" 
   (	"ACTION" NUMBER, 
	"NAME" VARCHAR2(30 BYTE), 
	"REG" NUMBER(*,0), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Table LOGSTDBY$SKIP_TRANSACTION
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LOGSTDBY$SKIP_TRANSACTION" 
   (	"XIDUSN" NUMBER, 
	"XIDSLT" NUMBER, 
	"XIDSQN" NUMBER, 
	"ACTIVE" NUMBER, 
	"COMMIT_SCN" NUMBER, 
	"SPARE2" NUMBER, 
	"SPARE3" VARCHAR2(2000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_AJG
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_AJG" 
   (	"AJGID#" NUMBER, 
	"RUNID#" NUMBER, 
	"AJGDESLEN" NUMBER, 
	"AJGDES" LONG RAW, 
	"HASHVALUE" NUMBER, 
	"FREQUENCY" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_AJG"  IS 'Anchor-join graph representation';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_BASETABLE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_BASETABLE" 
   (	"COLLECTIONID#" NUMBER, 
	"QUERYID#" NUMBER, 
	"OWNER" VARCHAR2(30 BYTE), 
	"TABLE_NAME" VARCHAR2(30 BYTE), 
	"TABLE_TYPE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_BASETABLE"  IS 'Base tables refered by a query';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_CLIQUE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_CLIQUE" 
   (	"CLIQUEID#" NUMBER, 
	"RUNID#" NUMBER, 
	"CLIQUEDESLEN" NUMBER, 
	"CLIQUEDES" LONG RAW, 
	"HASHVALUE" NUMBER, 
	"FREQUENCY" NUMBER, 
	"BYTECOST" NUMBER, 
	"ROWSIZE" NUMBER, 
	"NUMROWS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_CLIQUE"  IS 'Table for storing canonical form of Clique queries';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_ELIGIBLE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_ELIGIBLE" 
   (	"SUMOBJN#" NUMBER, 
	"RUNID#" NUMBER, 
	"BYTECOST" NUMBER, 
	"FLAGS" NUMBER, 
	"FREQUENCY" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_ELIGIBLE"  IS 'Summary management rewrite eligibility information';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_EXCEPTIONS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_EXCEPTIONS" 
   (	"RUNID#" NUMBER, 
	"OWNER" VARCHAR2(30 BYTE), 
	"TABLE_NAME" VARCHAR2(30 BYTE), 
	"DIMENSION_NAME" VARCHAR2(30 BYTE), 
	"RELATIONSHIP" VARCHAR2(11 BYTE), 
	"BAD_ROWID" ROWID
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_EXCEPTIONS"  IS 'Output table for dimension validations';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_FILTER
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_FILTER" 
   (	"FILTERID#" NUMBER, 
	"SUBFILTERNUM#" NUMBER, 
	"SUBFILTERTYPE" NUMBER, 
	"STR_VALUE" VARCHAR2(1028 BYTE), 
	"NUM_VALUE1" NUMBER, 
	"NUM_VALUE2" NUMBER, 
	"DATE_VALUE1" DATE, 
	"DATE_VALUE2" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_FILTER"  IS 'Table for workload filter definition';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_FILTERINSTANCE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_FILTERINSTANCE" 
   (	"RUNID#" NUMBER, 
	"FILTERID#" NUMBER, 
	"SUBFILTERNUM#" NUMBER, 
	"SUBFILTERTYPE" NUMBER, 
	"STR_VALUE" VARCHAR2(1028 BYTE), 
	"NUM_VALUE1" NUMBER, 
	"NUM_VALUE2" NUMBER, 
	"DATE_VALUE1" DATE, 
	"DATE_VALUE2" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_FILTERINSTANCE"  IS 'Table for workload filter instance definition';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_FJG
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_FJG" 
   (	"FJGID#" NUMBER, 
	"AJGID#" NUMBER, 
	"FJGDESLEN" NUMBER, 
	"FJGDES" LONG RAW, 
	"HASHVALUE" NUMBER, 
	"FREQUENCY" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_FJG"  IS 'Representation for query join sub-graph not in AJG ';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_GC
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_GC" 
   (	"GCID#" NUMBER, 
	"FJGID#" NUMBER, 
	"GCDESLEN" NUMBER, 
	"GCDES" LONG RAW, 
	"HASHVALUE" NUMBER, 
	"FREQUENCY" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_GC"  IS 'Group-by columns of a query';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_INFO
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_INFO" 
   (	"RUNID#" NUMBER, 
	"SEQ#" NUMBER, 
	"TYPE" NUMBER, 
	"INFOLEN" NUMBER, 
	"INFO" LONG RAW, 
	"STATUS" NUMBER, 
	"FLAG" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_INFO"  IS 'Internal table for passing information from the SQL analyzer';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_JOURNAL
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_JOURNAL" 
   (	"RUNID#" NUMBER, 
	"SEQ#" NUMBER, 
	"TIMESTAMP" DATE, 
	"FLAGS" NUMBER, 
	"NUM" NUMBER, 
	"TEXT" LONG, 
	"TEXTLEN" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_JOURNAL"  IS 'Summary advisor journal table for debugging and information';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_LEVEL
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_LEVEL" 
   (	"RUNID#" NUMBER, 
	"LEVELID#" NUMBER, 
	"DIMOBJ#" NUMBER, 
	"FLAGS" NUMBER, 
	"TBLOBJ#" NUMBER, 
	"COLUMNLIST" RAW(70), 
	"LEVELNAME" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_LEVEL"  IS 'Level definition';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_LOG
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_LOG" 
   (	"RUNID#" NUMBER, 
	"FILTERID#" NUMBER, 
	"RUN_BEGIN" DATE, 
	"RUN_END" DATE, 
	"RUN_TYPE" NUMBER, 
	"UNAME" VARCHAR2(30 BYTE), 
	"STATUS" NUMBER, 
	"MESSAGE" VARCHAR2(2000 BYTE), 
	"COMPLETED" NUMBER, 
	"TOTAL" NUMBER, 
	"ERROR_CODE" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_LOG"  IS 'Log all calls to summary advisory functions';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_OUTPUT
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_OUTPUT" 
   (	"RUNID#" NUMBER, 
	"OUTPUT_TYPE" NUMBER, 
	"RANK#" NUMBER, 
	"ACTION_TYPE" VARCHAR2(6 BYTE), 
	"SUMMARY_OWNER" VARCHAR2(30 BYTE), 
	"SUMMARY_NAME" VARCHAR2(30 BYTE), 
	"GROUP_BY_COLUMNS" VARCHAR2(2000 BYTE), 
	"WHERE_CLAUSE" VARCHAR2(2000 BYTE), 
	"FROM_CLAUSE" VARCHAR2(2000 BYTE), 
	"MEASURES_LIST" VARCHAR2(2000 BYTE), 
	"FACT_TABLES" VARCHAR2(1000 BYTE), 
	"GROUPING_LEVELS" VARCHAR2(2000 BYTE), 
	"QUERYLEN" NUMBER, 
	"QUERY_TEXT" LONG, 
	"STORAGE_IN_BYTES" NUMBER, 
	"PCT_PERFORMANCE_GAIN" NUMBER, 
	"FREQUENCY" NUMBER, 
	"CUMULATIVE_BENEFIT" NUMBER, 
	"BENEFIT_TO_COST_RATIO" NUMBER, 
	"VALIDATED" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_OUTPUT"  IS 'Output table for summary recommendations and evaluations';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_PARAMETERS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_PARAMETERS" 
   (	"PARAMETER_NAME" VARCHAR2(30 BYTE), 
	"PARAMETER_TYPE" NUMBER, 
	"STRING_VALUE" VARCHAR2(30 BYTE), 
	"DATE_VALUE" DATE, 
	"NUMERICAL_VALUE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_PARAMETERS"  IS 'Summary advisor tuning parameters';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_PLAN
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_PLAN" 
   (	"STATEMENT_ID" VARCHAR2(30 BYTE), 
	"TIMESTAMP" DATE, 
	"REMARKS" VARCHAR2(80 BYTE), 
	"OPERATION" VARCHAR2(30 BYTE), 
	"OPTIONS" VARCHAR2(255 BYTE), 
	"OBJECT_NODE" VARCHAR2(128 BYTE), 
	"OBJECT_OWNER" VARCHAR2(30 BYTE), 
	"OBJECT_NAME" VARCHAR2(30 BYTE), 
	"OBJECT_INSTANCE" NUMBER(*,0), 
	"OBJECT_TYPE" VARCHAR2(30 BYTE), 
	"OPTIMIZER" VARCHAR2(255 BYTE), 
	"SEARCH_COLUMNS" NUMBER, 
	"ID" NUMBER(*,0), 
	"PARENT_ID" NUMBER(*,0), 
	"POSITION" NUMBER(*,0), 
	"COST" NUMBER(*,0), 
	"CARDINALITY" NUMBER(*,0), 
	"BYTES" NUMBER(*,0), 
	"OTHER_TAG" VARCHAR2(255 BYTE), 
	"PARTITION_START" VARCHAR2(255 BYTE), 
	"PARTITION_STOP" VARCHAR2(255 BYTE), 
	"PARTITION_ID" NUMBER(*,0), 
	"OTHER" LONG, 
	"DISTRIBUTION" VARCHAR2(30 BYTE), 
	"CPU_COST" NUMBER(*,0), 
	"IO_COST" NUMBER(*,0), 
	"TEMP_SPACE" NUMBER(*,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_PLAN"  IS 'Private plan table for estimate_mview_size operations';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_PRETTY
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_PRETTY" 
   (	"QUERYID#" NUMBER, 
	"SQL_TEXT" LONG
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_PRETTY"  IS 'Table for sql parsing';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_ROLLUP
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_ROLLUP" 
   (	"RUNID#" NUMBER, 
	"CLEVELID#" NUMBER, 
	"PLEVELID#" NUMBER, 
	"FLAGS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_ROLLUP"  IS 'Each row repesents either a functional dependency or join-key relationship';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_SQLDEPEND
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_SQLDEPEND" 
   (	"COLLECTIONID#" NUMBER, 
	"INST_ID" NUMBER, 
	"FROM_ADDRESS" RAW(16), 
	"FROM_HASH" NUMBER, 
	"TO_OWNER" VARCHAR2(64 BYTE), 
	"TO_NAME" VARCHAR2(1000 BYTE), 
	"TO_TYPE" NUMBER, 
	"CARDINALITY" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_SQLDEPEND"  IS 'Temporary table for workload collections';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_TEMP
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_TEMP" 
   (	"ID#" NUMBER, 
	"SEQ#" NUMBER, 
	"TEXT" LONG
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_TEMP"  IS 'Table for temporary data';
--------------------------------------------------------
--  DDL for Table MVIEW$_ADV_WORKLOAD
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MVIEW$_ADV_WORKLOAD" 
   (	"QUERYID#" NUMBER, 
	"COLLECTIONID#" NUMBER, 
	"COLLECTTIME" DATE, 
	"APPLICATION" VARCHAR2(64 BYTE), 
	"CARDINALITY" NUMBER, 
	"RESULTSIZE" NUMBER, 
	"UNAME" VARCHAR2(30 BYTE), 
	"QDATE" DATE, 
	"PRIORITY" NUMBER, 
	"EXEC_TIME" NUMBER, 
	"SQL_TEXT" LONG, 
	"SQL_TEXTLEN" NUMBER, 
	"SQL_HASH" NUMBER, 
	"SQL_ADDR" RAW(16), 
	"FREQUENCY" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON TABLE "SYSTEM"."MVIEW$_ADV_WORKLOAD"  IS 'Shared workload repository for DBA users of summary advisor';
--------------------------------------------------------
--  DDL for Table OL$
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYSTEM"."OL$" 
   (	"OL_NAME" VARCHAR2(30 BYTE), 
	"SQL_TEXT" LONG, 
	"TEXTLEN" NUMBER, 
	"SIGNATURE" RAW(16), 
	"HASH_VALUE" NUMBER, 
	"HASH_VALUE2" NUMBER, 
	"CATEGORY" VARCHAR2(30 BYTE), 
	"VERSION" VARCHAR2(64 BYTE), 
	"CREATOR" VARCHAR2(30 BYTE), 
	"TIMESTAMP" DATE, 
	"FLAGS" NUMBER, 
	"HINTCOUNT" NUMBER, 
	"SPARE1" NUMBER, 
	"SPARE2" VARCHAR2(1000 BYTE)
   ) ON COMMIT PRESERVE ROWS ;
--------------------------------------------------------
--  DDL for Table OL$HINTS
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYSTEM"."OL$HINTS" 
   (	"OL_NAME" VARCHAR2(30 BYTE), 
	"HINT#" NUMBER, 
	"CATEGORY" VARCHAR2(30 BYTE), 
	"HINT_TYPE" NUMBER, 
	"HINT_TEXT" VARCHAR2(512 BYTE), 
	"STAGE#" NUMBER, 
	"NODE#" NUMBER, 
	"TABLE_NAME" VARCHAR2(30 BYTE), 
	"TABLE_TIN" NUMBER, 
	"TABLE_POS" NUMBER, 
	"REF_ID" NUMBER, 
	"USER_TABLE_NAME" VARCHAR2(64 BYTE), 
	"COST" FLOAT(126), 
	"CARDINALITY" FLOAT(126), 
	"BYTES" FLOAT(126), 
	"HINT_TEXTOFF" NUMBER, 
	"HINT_TEXTLEN" NUMBER, 
	"JOIN_PRED" VARCHAR2(2000 BYTE), 
	"SPARE1" NUMBER, 
	"SPARE2" NUMBER, 
	"HINT_STRING" CLOB
   ) ON COMMIT PRESERVE ROWS ;
--------------------------------------------------------
--  DDL for Table OL$NODES
--------------------------------------------------------

  CREATE GLOBAL TEMPORARY TABLE "SYSTEM"."OL$NODES" 
   (	"OL_NAME" VARCHAR2(30 BYTE), 
	"CATEGORY" VARCHAR2(30 BYTE), 
	"NODE_ID" NUMBER, 
	"PARENT_ID" NUMBER, 
	"NODE_TYPE" NUMBER, 
	"NODE_TEXTLEN" NUMBER, 
	"NODE_TEXTOFF" NUMBER, 
	"NODE_NAME" VARCHAR2(64 BYTE)
   ) ON COMMIT PRESERVE ROWS ;
--------------------------------------------------------
--  DDL for Table PERSONA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."PERSONA" 
   (	"IDCONTACT" NUMBER(10,0), 
	"NAME" VARCHAR2(255 BYTE), 
	"LASTNAME" VARCHAR2(255 BYTE), 
	"GENDER" VARCHAR2(10 BYTE), 
	"BIRDTDATE" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table REPCAT$_AUDIT_ATTRIBUTE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_AUDIT_ATTRIBUTE" 
   (	"ATTRIBUTE" VARCHAR2(30 BYTE), 
	"DATA_TYPE_ID" NUMBER(*,0), 
	"DATA_LENGTH" NUMBER(*,0), 
	"SOURCE" VARCHAR2(92 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_AUDIT_ATTRIBUTE"."ATTRIBUTE" IS 'Description of the attribute';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_AUDIT_ATTRIBUTE"."DATA_TYPE_ID" IS 'Datatype of the attribute value';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_AUDIT_ATTRIBUTE"."DATA_LENGTH" IS 'Length of the attribute value in byte';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_AUDIT_ATTRIBUTE"."SOURCE" IS 'Name of the function which returns the attribute value';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_AUDIT_ATTRIBUTE"  IS 'Information about attributes automatically maintained for replication';
--------------------------------------------------------
--  DDL for Table REPCAT$_AUDIT_COLUMN
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_AUDIT_COLUMN" 
   (	"SNAME" VARCHAR2(30 BYTE), 
	"ONAME" VARCHAR2(30 BYTE), 
	"COLUMN_NAME" VARCHAR2(30 BYTE), 
	"BASE_SNAME" VARCHAR2(30 BYTE), 
	"BASE_ONAME" VARCHAR2(30 BYTE), 
	"BASE_CONFLICT_TYPE_ID" NUMBER(*,0), 
	"BASE_REFERENCE_NAME" VARCHAR2(30 BYTE), 
	"ATTRIBUTE" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_AUDIT_COLUMN"."SNAME" IS 'Owner of the shadow table';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_AUDIT_COLUMN"."ONAME" IS 'Name of the shadow table';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_AUDIT_COLUMN"."COLUMN_NAME" IS 'Name of the column in the shadow table';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_AUDIT_COLUMN"."BASE_SNAME" IS 'Owner of replicated table';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_AUDIT_COLUMN"."BASE_ONAME" IS 'Name of the replicated table';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_AUDIT_COLUMN"."BASE_CONFLICT_TYPE_ID" IS 'Type of conflict';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_AUDIT_COLUMN"."BASE_REFERENCE_NAME" IS 'Table name, unique constraint name, or column group name';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_AUDIT_COLUMN"."ATTRIBUTE" IS 'Description of the attribute';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_AUDIT_COLUMN"  IS 'Information about columns in all shadow tables for all replicated tables in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_COLUMN_GROUP
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_COLUMN_GROUP" 
   (	"SNAME" VARCHAR2(30 BYTE), 
	"ONAME" VARCHAR2(30 BYTE), 
	"GROUP_NAME" VARCHAR2(30 BYTE), 
	"GROUP_COMMENT" VARCHAR2(80 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_COLUMN_GROUP"."SNAME" IS 'Owner of replicated object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_COLUMN_GROUP"."ONAME" IS 'Name of the replicated object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_COLUMN_GROUP"."GROUP_NAME" IS 'Name of the column group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_COLUMN_GROUP"."GROUP_COMMENT" IS 'Description of the column group';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_COLUMN_GROUP"  IS 'All column groups of replicated tables in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_CONFLICT
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_CONFLICT" 
   (	"SNAME" VARCHAR2(30 BYTE), 
	"ONAME" VARCHAR2(30 BYTE), 
	"CONFLICT_TYPE_ID" NUMBER(*,0), 
	"REFERENCE_NAME" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_CONFLICT"."SNAME" IS 'Owner of replicated object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_CONFLICT"."ONAME" IS 'Name of the replicated object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_CONFLICT"."CONFLICT_TYPE_ID" IS 'Type of conflict';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_CONFLICT"."REFERENCE_NAME" IS 'Table name, unique constraint name, or column group name';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_CONFLICT"  IS 'All conflicts for which users have specified resolutions in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_DDL
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_DDL" 
   (	"LOG_ID" NUMBER, 
	"SOURCE" VARCHAR2(128 BYTE), 
	"ROLE" VARCHAR2(1 BYTE), 
	"MASTER" VARCHAR2(128 BYTE), 
	"LINE" NUMBER(*,0), 
	"TEXT" VARCHAR2(2000 BYTE), 
	"DDL_NUM" NUMBER(*,0) DEFAULT 1       -- order of ddls to execute

   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_DDL"."LOG_ID" IS 'Identifying number of the repcat log record';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_DDL"."SOURCE" IS 'Name of the database at which the request originated';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_DDL"."ROLE" IS 'Is this database the masterdef for the request';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_DDL"."MASTER" IS 'Name of the database that processes this request';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_DDL"."LINE" IS 'Ordering of records within a single request';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_DDL"."TEXT" IS 'Portion of an argument';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_DDL"."DDL_NUM" IS 'Ordering of DDLs to execute';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_DDL"  IS 'Arguments that do not fit in a single repcat log record';
--------------------------------------------------------
--  DDL for Table REPCAT$_EXCEPTIONS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_EXCEPTIONS" 
   (	"EXCEPTION_ID" NUMBER, 
	"USER_NAME" VARCHAR2(30 BYTE), 
	"REQUEST" CLOB, 
	"JOB" NUMBER, 
	"ERROR_DATE" DATE, 
	"ERROR_NUMBER" NUMBER, 
	"ERROR_MESSAGE" VARCHAR2(4000 BYTE), 
	"LINE_NUMBER" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("REQUEST") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXCEPTIONS"."EXCEPTION_ID" IS 'Internal primary key of the exceptions table.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXCEPTIONS"."USER_NAME" IS 'User name of user submitting the exception.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXCEPTIONS"."REQUEST" IS 'Originating request containing the exception.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXCEPTIONS"."JOB" IS 'Originating job containing the exception.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXCEPTIONS"."ERROR_DATE" IS 'Date of occurance for the exception.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXCEPTIONS"."ERROR_NUMBER" IS 'Error number generating the exception.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXCEPTIONS"."ERROR_MESSAGE" IS 'Error message associated with the error generating the exception.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXCEPTIONS"."LINE_NUMBER" IS 'Line number of the exception.';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_EXCEPTIONS"  IS 'Repcat processing exceptions table.';
--------------------------------------------------------
--  DDL for Table REPCAT$_EXTENSION
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_EXTENSION" 
   (	"EXTENSION_ID" RAW(16), 
	"EXTENSION_CODE" NUMBER, 
	"MASTERDEF" VARCHAR2(128 BYTE), 
	"EXPORT_REQUIRED" VARCHAR2(1 BYTE), 
	"REPCATLOG_ID" NUMBER, 
	"EXTENSION_STATUS" NUMBER, 
	"FLASHBACK_SCN" NUMBER, 
	"PUSH_TO_MDEF" VARCHAR2(1 BYTE), 
	"PUSH_TO_NEW" VARCHAR2(1 BYTE), 
	"PERCENTAGE_FOR_CATCHUP_MDEF" NUMBER, 
	"CYCLE_SECONDS_MDEF" NUMBER, 
	"PERCENTAGE_FOR_CATCHUP_NEW" NUMBER, 
	"CYCLE_SECONDS_NEW" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXTENSION"."EXTENSION_ID" IS 'Globally unique identifier for replication extension';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXTENSION"."EXTENSION_CODE" IS 'Kind of replication extension';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXTENSION"."MASTERDEF" IS 'Master definition site for replication extension';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXTENSION"."EXPORT_REQUIRED" IS 'YES if this extension requires an export, and NO if no export is required';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXTENSION"."REPCATLOG_ID" IS 'Identifier of repcatlog records related to replication extension';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXTENSION"."EXTENSION_STATUS" IS 'Status of replication extension';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXTENSION"."FLASHBACK_SCN" IS 'Flashback_scn for export or change-based recovery for replication extension';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXTENSION"."PUSH_TO_MDEF" IS 'YES if existing masters partially push to masterdef, NO if no pushing';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXTENSION"."PUSH_TO_NEW" IS 'YES if existing masters partially push to new masters, NO if no pushing';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXTENSION"."PERCENTAGE_FOR_CATCHUP_MDEF" IS 'Fraction of push to masterdef cycle devoted to catching up';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXTENSION"."CYCLE_SECONDS_MDEF" IS 'Length of push to masterdef cycle when catching up';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXTENSION"."PERCENTAGE_FOR_CATCHUP_NEW" IS 'Fraction of push to new masters cycle devoted to catching up';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_EXTENSION"."CYCLE_SECONDS_NEW" IS 'Length of push to new masters cycle when catching up';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_EXTENSION"  IS 'Information about replication extension requests';
--------------------------------------------------------
--  DDL for Table REPCAT$_FLAVORS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_FLAVORS" 
   (	"FLAVOR_ID" NUMBER, 
	"GOWNER" VARCHAR2(30 BYTE) DEFAULT 'PUBLIC', 
	"GNAME" VARCHAR2(30 BYTE), 
	"FNAME" VARCHAR2(30 BYTE), 
	"CREATION_DATE" DATE DEFAULT SYSDATE, 
	"CREATED_BY" NUMBER DEFAULT UID, 
	"PUBLISHED" VARCHAR2(1 BYTE) DEFAULT 'N'
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_FLAVORS"."FLAVOR_ID" IS 'Flavor identifier, unique within object group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_FLAVORS"."GOWNER" IS 'Owner of the object group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_FLAVORS"."GNAME" IS 'Name of the object group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_FLAVORS"."FNAME" IS 'Name of the flavor';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_FLAVORS"."CREATION_DATE" IS 'Date on which the flavor was created';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_FLAVORS"."CREATED_BY" IS 'Identifier of user that created the flavor';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_FLAVORS"."PUBLISHED" IS 'Indicates whether flavor is published (Y/N) or obsolete (O)';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_FLAVORS"  IS 'Flavors defined for replicated object groups';
--------------------------------------------------------
--  DDL for Table REPCAT$_FLAVOR_OBJECTS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_FLAVOR_OBJECTS" 
   (	"FLAVOR_ID" NUMBER, 
	"GOWNER" VARCHAR2(30 BYTE) DEFAULT 'PUBLIC', 
	"GNAME" VARCHAR2(30 BYTE), 
	"SNAME" VARCHAR2(30 BYTE), 
	"ONAME" VARCHAR2(30 BYTE), 
	"TYPE" NUMBER, 
	"VERSION#" NUMBER, 
	"HASHCODE" RAW(17), 
	"COLUMNS_PRESENT" RAW(125)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_FLAVOR_OBJECTS"."FLAVOR_ID" IS 'Flavor identifier';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_FLAVOR_OBJECTS"."GOWNER" IS 'Owner of the object group containing object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_FLAVOR_OBJECTS"."GNAME" IS 'Object group containing object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_FLAVOR_OBJECTS"."SNAME" IS 'Schema containing object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_FLAVOR_OBJECTS"."ONAME" IS 'Name of object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_FLAVOR_OBJECTS"."TYPE" IS 'Object type';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_FLAVOR_OBJECTS"."VERSION#" IS 'Version# of a user-defined type';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_FLAVOR_OBJECTS"."HASHCODE" IS 'Hashcode of a user-defined type';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_FLAVOR_OBJECTS"."COLUMNS_PRESENT" IS 'For tables, encoded mapping of columns present';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_FLAVOR_OBJECTS"  IS 'Replicated objects in flavors';
--------------------------------------------------------
--  DDL for Table REPCAT$_GENERATED
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_GENERATED" 
   (	"SNAME" VARCHAR2(30 BYTE), 
	"ONAME" VARCHAR2(30 BYTE), 
	"TYPE" NUMBER(*,0), 
	"REASON" NUMBER, 
	"BASE_SNAME" VARCHAR2(30 BYTE), 
	"BASE_ONAME" VARCHAR2(30 BYTE), 
	"BASE_TYPE" NUMBER(*,0), 
	"PACKAGE_PREFIX" VARCHAR2(30 BYTE), 
	"PROCEDURE_PREFIX" VARCHAR2(30 BYTE), 
	"DISTRIBUTED" VARCHAR2(1 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_GENERATED"."SNAME" IS 'Schema containing the generated object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_GENERATED"."ONAME" IS 'Name of the generated object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_GENERATED"."TYPE" IS 'Type of the generated object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_GENERATED"."REASON" IS 'Reason the object was generated';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_GENERATED"."BASE_SNAME" IS 'Name of the object''s owner';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_GENERATED"."BASE_ONAME" IS 'Name of the object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_GENERATED"."BASE_TYPE" IS 'Type of the object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_GENERATED"."PACKAGE_PREFIX" IS 'Prefix for package wrapper';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_GENERATED"."PROCEDURE_PREFIX" IS 'Procedure prefix for package wrapper or procedure wrapper';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_GENERATED"."DISTRIBUTED" IS 'Is the generated object separately generated at each master';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_GENERATED"  IS 'Objects generated to support replication';
--------------------------------------------------------
--  DDL for Table REPCAT$_GROUPED_COLUMN
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_GROUPED_COLUMN" 
   (	"SNAME" VARCHAR2(30 BYTE), 
	"ONAME" VARCHAR2(30 BYTE), 
	"GROUP_NAME" VARCHAR2(30 BYTE), 
	"COLUMN_NAME" VARCHAR2(30 BYTE), 
	"POS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_GROUPED_COLUMN"."SNAME" IS 'Owner of replicated object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_GROUPED_COLUMN"."ONAME" IS 'Name of the replicated object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_GROUPED_COLUMN"."GROUP_NAME" IS 'Name of the column group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_GROUPED_COLUMN"."COLUMN_NAME" IS 'Name of the column in the column group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_GROUPED_COLUMN"."POS" IS 'Position of a column or an attribute in the table';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_GROUPED_COLUMN"  IS 'Columns in all column groups of replicated tables in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_INSTANTIATION_DDL
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_INSTANTIATION_DDL" 
   (	"REFRESH_TEMPLATE_ID" NUMBER, 
	"DDL_TEXT" CLOB, 
	"DDL_NUM" NUMBER, 
	"PHASE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("DDL_TEXT") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_INSTANTIATION_DDL"."REFRESH_TEMPLATE_ID" IS 'Primary key of template containing supplementary DDL.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_INSTANTIATION_DDL"."DDL_TEXT" IS 'Supplementary DDL string.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_INSTANTIATION_DDL"."DDL_NUM" IS 'Column for ordering of supplementary DDL.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_INSTANTIATION_DDL"."PHASE" IS 'Phase to execute the DDL string.';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_INSTANTIATION_DDL"  IS 'Table containing supplementary DDL to be executed during instantiation.';
--------------------------------------------------------
--  DDL for Table REPCAT$_KEY_COLUMNS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_KEY_COLUMNS" 
   (	"SNAME" VARCHAR2(30 BYTE), 
	"ONAME" VARCHAR2(30 BYTE), 
	"TYPE" NUMBER(*,0), 
	"COL" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_KEY_COLUMNS"."SNAME" IS 'Schema containing table';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_KEY_COLUMNS"."ONAME" IS 'Name of the table';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_KEY_COLUMNS"."TYPE" IS 'Type identifier';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_KEY_COLUMNS"."COL" IS 'Column in the table';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_KEY_COLUMNS"  IS 'Primary columns for a table using column-level replication';
--------------------------------------------------------
--  DDL for Table REPCAT$_OBJECT_PARMS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_OBJECT_PARMS" 
   (	"TEMPLATE_PARAMETER_ID" NUMBER, 
	"TEMPLATE_OBJECT_ID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_OBJECT_PARMS"."TEMPLATE_PARAMETER_ID" IS 'Primary key of template parameter.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_OBJECT_PARMS"."TEMPLATE_OBJECT_ID" IS 'Primary key of object using the paramter.';
--------------------------------------------------------
--  DDL for Table REPCAT$_OBJECT_TYPES
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_OBJECT_TYPES" 
   (	"OBJECT_TYPE_ID" NUMBER, 
	"OBJECT_TYPE_NAME" VARCHAR2(200 BYTE), 
	"FLAGS" RAW(255), 
	"SPARE1" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_OBJECT_TYPES"."OBJECT_TYPE_ID" IS 'Internal primary key of the template object types table.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_OBJECT_TYPES"."OBJECT_TYPE_NAME" IS 'Descriptive name for the object type.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_OBJECT_TYPES"."FLAGS" IS 'Internal flags for object type processing.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_OBJECT_TYPES"."SPARE1" IS 'Reserved for future use.';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_OBJECT_TYPES"  IS 'Internal table for template object types.';
--------------------------------------------------------
--  DDL for Table REPCAT$_PARAMETER_COLUMN
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_PARAMETER_COLUMN" 
   (	"SNAME" VARCHAR2(30 BYTE), 
	"ONAME" VARCHAR2(30 BYTE), 
	"CONFLICT_TYPE_ID" NUMBER(*,0), 
	"REFERENCE_NAME" VARCHAR2(30 BYTE), 
	"SEQUENCE_NO" NUMBER, 
	"PARAMETER_TABLE_NAME" VARCHAR2(30 BYTE), 
	"PARAMETER_COLUMN_NAME" VARCHAR2(4000 BYTE), 
	"PARAMETER_SEQUENCE_NO" NUMBER, 
	"COLUMN_POS" NUMBER, 
	"ATTRIBUTE_SEQUENCE_NO" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PARAMETER_COLUMN"."SNAME" IS 'Owner of replicated object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PARAMETER_COLUMN"."ONAME" IS 'Name of the replicated object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PARAMETER_COLUMN"."CONFLICT_TYPE_ID" IS 'Type of conflict';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PARAMETER_COLUMN"."REFERENCE_NAME" IS 'Table name, unique constraint name, or column group name';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PARAMETER_COLUMN"."SEQUENCE_NO" IS 'Ordering on resolution';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PARAMETER_COLUMN"."PARAMETER_TABLE_NAME" IS 'Name of the table to which the parameter column belongs';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PARAMETER_COLUMN"."PARAMETER_COLUMN_NAME" IS 'Name of the parameter column used for resolving the conflict';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PARAMETER_COLUMN"."PARAMETER_SEQUENCE_NO" IS 'Ordering on parameter column';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PARAMETER_COLUMN"."COLUMN_POS" IS 'Column position of an attribute or a column';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PARAMETER_COLUMN"."ATTRIBUTE_SEQUENCE_NO" IS 'Sequence number for an attribute of an ADT/pkREF column or a scalar column';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_PARAMETER_COLUMN"  IS 'All columns used for resolving conflicts in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_PRIORITY
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_PRIORITY" 
   (	"SNAME" VARCHAR2(30 BYTE), 
	"PRIORITY_GROUP" VARCHAR2(30 BYTE), 
	"PRIORITY" NUMBER, 
	"RAW_VALUE" RAW(2000), 
	"CHAR_VALUE" CHAR(255 BYTE), 
	"NUMBER_VALUE" NUMBER, 
	"DATE_VALUE" DATE, 
	"VARCHAR2_VALUE" VARCHAR2(4000 BYTE), 
	"NCHAR_VALUE" NCHAR(500), 
	"NVARCHAR2_VALUE" NVARCHAR2(1000), 
	"LARGE_CHAR_VALUE" CHAR(2000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PRIORITY"."SNAME" IS 'Name of the replicated object group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PRIORITY"."PRIORITY_GROUP" IS 'Name of the priority group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PRIORITY"."PRIORITY" IS 'Priority of the value';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PRIORITY"."RAW_VALUE" IS 'Raw value';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PRIORITY"."CHAR_VALUE" IS 'Blank-padded character string';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PRIORITY"."NUMBER_VALUE" IS 'Numeric value';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PRIORITY"."DATE_VALUE" IS 'Date value';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PRIORITY"."VARCHAR2_VALUE" IS 'Character string';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PRIORITY"."NCHAR_VALUE" IS 'NCHAR string';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PRIORITY"."NVARCHAR2_VALUE" IS 'NVARCHAR2 string';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PRIORITY"."LARGE_CHAR_VALUE" IS 'Blank-padded character string over 255 characters';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_PRIORITY"  IS 'Values and their corresponding priorities in all priority groups in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_PRIORITY_GROUP
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_PRIORITY_GROUP" 
   (	"SNAME" VARCHAR2(30 BYTE), 
	"PRIORITY_GROUP" VARCHAR2(30 BYTE), 
	"DATA_TYPE_ID" NUMBER(*,0), 
	"FIXED_DATA_LENGTH" NUMBER(*,0), 
	"PRIORITY_COMMENT" VARCHAR2(80 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PRIORITY_GROUP"."SNAME" IS 'Name of the replicated object group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PRIORITY_GROUP"."PRIORITY_GROUP" IS 'Name of the priority group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PRIORITY_GROUP"."DATA_TYPE_ID" IS 'Datatype of the value in the priority group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PRIORITY_GROUP"."FIXED_DATA_LENGTH" IS 'Length of the value in bytes if the datatype is CHAR';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_PRIORITY_GROUP"."PRIORITY_COMMENT" IS 'Description of the priority group';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_PRIORITY_GROUP"  IS 'Information about all priority groups in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_REFRESH_TEMPLATES
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_REFRESH_TEMPLATES" 
   (	"REFRESH_TEMPLATE_ID" NUMBER, 
	"OWNER" VARCHAR2(30 BYTE), 
	"REFRESH_GROUP_NAME" VARCHAR2(30 BYTE), 
	"REFRESH_TEMPLATE_NAME" VARCHAR2(30 BYTE), 
	"TEMPLATE_COMMENT" VARCHAR2(2000 BYTE), 
	"PUBLIC_TEMPLATE" VARCHAR2(1 BYTE), 
	"LAST_MODIFIED" DATE, 
	"MODIFIED_BY" NUMBER, 
	"CREATION_DATE" DATE, 
	"CREATED_BY" NUMBER, 
	"REFRESH_GROUP_ID" NUMBER DEFAULT 0, 
	"TEMPLATE_TYPE_ID" NUMBER DEFAULT 1, 
	"TEMPLATE_STATUS_ID" NUMBER DEFAULT 0, 
	"FLAGS" RAW(255), 
	"SPARE1" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REFRESH_TEMPLATES"."REFRESH_TEMPLATE_ID" IS 'Internal primary key of the REPCAT$_REFRESH_TEMPLATES table.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REFRESH_TEMPLATES"."OWNER" IS 'Owner of the refresh group template.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REFRESH_TEMPLATES"."REFRESH_GROUP_NAME" IS 'Name of the refresh group to create during instantiation.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REFRESH_TEMPLATES"."REFRESH_TEMPLATE_NAME" IS 'Name of the refresh group template.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REFRESH_TEMPLATES"."TEMPLATE_COMMENT" IS 'Optional comment field for the refresh group template.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REFRESH_TEMPLATES"."PUBLIC_TEMPLATE" IS 'Flag specifying public template or private template.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REFRESH_TEMPLATES"."LAST_MODIFIED" IS 'Date the row was last modified.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REFRESH_TEMPLATES"."MODIFIED_BY" IS 'User id of the user that modified the row.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REFRESH_TEMPLATES"."CREATION_DATE" IS 'Date the row was created.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REFRESH_TEMPLATES"."CREATED_BY" IS 'User id of the user that created the row.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REFRESH_TEMPLATES"."REFRESH_GROUP_ID" IS 'Internal primary key to default refresh group for the template.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REFRESH_TEMPLATES"."TEMPLATE_TYPE_ID" IS 'Internal primary key to the template types.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REFRESH_TEMPLATES"."TEMPLATE_STATUS_ID" IS 'Internal primary key to the template status table.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REFRESH_TEMPLATES"."FLAGS" IS 'Internal flags for the template.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REFRESH_TEMPLATES"."SPARE1" IS 'Reserved for future use.';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_REFRESH_TEMPLATES"  IS 'Primary table containing deployment template information.';
--------------------------------------------------------
--  DDL for Table REPCAT$_REPCAT
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_REPCAT" 
   (	"GOWNER" VARCHAR2(30 BYTE) DEFAULT 'PUBLIC', 
	"SNAME" VARCHAR2(30 BYTE), 
	"MASTER" VARCHAR2(1 BYTE), 
	"STATUS" NUMBER(*,0), 
	"SCHEMA_COMMENT" VARCHAR2(80 BYTE), 
	"FLAVOR_ID" NUMBER, 
	"FLAG" RAW(4) DEFAULT '00000000'
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCAT"."GOWNER" IS 'Owner of the object group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCAT"."SNAME" IS 'Name of the replicated object group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCAT"."MASTER" IS 'Is the site a master site for the replicated object group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCAT"."STATUS" IS 'If the site is a master, the master''s status';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCAT"."SCHEMA_COMMENT" IS 'Description of the replicated object group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCAT"."FLAVOR_ID" IS 'Flavor identifier';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCAT"."FLAG" IS 'Miscellaneous repgroup info';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_REPCAT"  IS 'Information about all replicated object groups';
--------------------------------------------------------
--  DDL for Table REPCAT$_REPCATLOG
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_REPCATLOG" 
   (	"VERSION" NUMBER, 
	"ID" NUMBER, 
	"SOURCE" VARCHAR2(128 BYTE), 
	"USERID" VARCHAR2(30 BYTE), 
	"TIMESTAMP" DATE, 
	"ROLE" VARCHAR2(1 BYTE), 
	"MASTER" VARCHAR2(128 BYTE), 
	"SNAME" VARCHAR2(30 BYTE), 
	"REQUEST" NUMBER(*,0), 
	"ONAME" VARCHAR2(30 BYTE), 
	"TYPE" NUMBER(*,0), 
	"A_COMMENT" VARCHAR2(2000 BYTE), 
	"BOOL_ARG" VARCHAR2(1 BYTE), 
	"ANO_BOOL_ARG" VARCHAR2(1 BYTE), 
	"INT_ARG" NUMBER(*,0), 
	"ANO_INT_ARG" NUMBER(*,0), 
	"LINES" NUMBER(*,0), 
	"STATUS" NUMBER(*,0), 
	"MESSAGE" VARCHAR2(200 BYTE), 
	"ERRNUM" NUMBER, 
	"GNAME" VARCHAR2(30 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."VERSION" IS 'Version of the repcat log record';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."ID" IS 'Identifying number of repcat log record';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."SOURCE" IS 'Name of the database at which the request originated';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."USERID" IS 'Name of the user who submitted the request';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."TIMESTAMP" IS 'When the request was submitted';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."ROLE" IS 'Is this database the masterdef for the request';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."MASTER" IS 'Name of the database that processes this request$_ddl';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."SNAME" IS 'Schema of replicated object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."REQUEST" IS 'Name of the requested operation';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."ONAME" IS 'Replicated object name, if applicable';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."TYPE" IS 'Type of replicated object, if applicable';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."A_COMMENT" IS 'Textual argument used for comments';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."BOOL_ARG" IS 'Boolean argument';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."ANO_BOOL_ARG" IS 'Another Boolean argument';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."INT_ARG" IS 'Integer argument';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."ANO_INT_ARG" IS 'Another integer argument';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."LINES" IS 'The number of rows in system.repcat$_ddl at the processing site';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."STATUS" IS 'Status of the request at this database';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."MESSAGE" IS 'Error message associated with processing the request';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."ERRNUM" IS 'Oracle error number associated with processing the request';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCATLOG"."GNAME" IS 'Name of the replicated object group';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_REPCATLOG"  IS 'Information about asynchronous administration requests';
--------------------------------------------------------
--  DDL for Table REPCAT$_REPCOLUMN
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_REPCOLUMN" 
   (	"SNAME" VARCHAR2(30 BYTE), 
	"ONAME" VARCHAR2(30 BYTE), 
	"TYPE" NUMBER(*,0), 
	"CNAME" VARCHAR2(30 BYTE), 
	"LCNAME" VARCHAR2(4000 BYTE), 
	"TOID" RAW(16), 
	"VERSION#" NUMBER, 
	"HASHCODE" RAW(17), 
	"CTYPE_NAME" VARCHAR2(30 BYTE), 
	"CTYPE_OWNER" VARCHAR2(30 BYTE), 
	"ID" NUMBER, 
	"POS" NUMBER, 
	"TOP" VARCHAR2(30 BYTE), 
	"FLAG" RAW(2) DEFAULT '0000', 
	"CTYPE" NUMBER, 
	"LENGTH" NUMBER, 
	"PRECISION#" NUMBER, 
	"SCALE" NUMBER, 
	"NULL$" NUMBER, 
	"CHARSETID" NUMBER, 
	"CHARSETFORM" NUMBER, 
	"PROPERTY" RAW(4) DEFAULT '00000000', 
	"CLENGTH" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCOLUMN"."SNAME" IS 'Name of the object owner';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCOLUMN"."ONAME" IS 'Name of the object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCOLUMN"."TYPE" IS 'Type of the object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCOLUMN"."CNAME" IS 'Column name';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCOLUMN"."LCNAME" IS 'Long column name';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCOLUMN"."TOID" IS 'Type object identifier of a user-defined type';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCOLUMN"."VERSION#" IS 'Version# of a column of user-defined type';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCOLUMN"."HASHCODE" IS 'Hashcode of a column of user-defined type';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCOLUMN"."ID" IS 'Column ID';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCOLUMN"."POS" IS 'Ordering of column used as IN parameter in the replication procedures';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCOLUMN"."TOP" IS 'Top column name for an attribute';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCOLUMN"."FLAG" IS 'Replication information about column';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCOLUMN"."CTYPE" IS 'Type of the column';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCOLUMN"."LENGTH" IS 'Length of the column in bytes';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCOLUMN"."PRECISION#" IS 'Length: decimal digits (NUMBER) or binary digits (FLOAT)';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCOLUMN"."SCALE" IS 'Digits to right of decimal point in a number';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCOLUMN"."NULL$" IS 'Does column allow NULL values?';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCOLUMN"."CHARSETID" IS 'Character set identifier';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCOLUMN"."CHARSETFORM" IS 'Character set form';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPCOLUMN"."CLENGTH" IS 'The maximum length of the column in characters';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_REPCOLUMN"  IS 'Replicated columns for a table sorted alphabetically in ascending order';
--------------------------------------------------------
--  DDL for Table REPCAT$_REPGROUP_PRIVS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_REPGROUP_PRIVS" 
   (	"USERID" NUMBER, 
	"USERNAME" VARCHAR2(30 BYTE), 
	"GOWNER" VARCHAR2(30 BYTE), 
	"GNAME" VARCHAR2(30 BYTE), 
	"GLOBAL_FLAG" NUMBER, 
	"CREATED" DATE, 
	"PRIVILEGE" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPGROUP_PRIVS"."USERID" IS 'OBSOLETE COLUMN: Identifying number of the user';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPGROUP_PRIVS"."USERNAME" IS 'Identifying name of the registered user';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPGROUP_PRIVS"."GOWNER" IS 'Owner of the replicated object group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPGROUP_PRIVS"."GNAME" IS 'Name of the replicated object group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPGROUP_PRIVS"."GLOBAL_FLAG" IS '1 if gname is NULL, 0 otherwise';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPGROUP_PRIVS"."CREATED" IS 'Registration date';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPGROUP_PRIVS"."PRIVILEGE" IS 'Registered privileges';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_REPGROUP_PRIVS"  IS 'Information about users who are registered for object group privileges';
--------------------------------------------------------
--  DDL for Table REPCAT$_REPOBJECT
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_REPOBJECT" 
   (	"SNAME" VARCHAR2(30 BYTE), 
	"ONAME" VARCHAR2(30 BYTE), 
	"TYPE" NUMBER(*,0), 
	"VERSION#" NUMBER, 
	"HASHCODE" RAW(17), 
	"ID" NUMBER, 
	"OBJECT_COMMENT" VARCHAR2(80 BYTE), 
	"STATUS" NUMBER(*,0), 
	"GENPACKAGE" NUMBER(*,0), 
	"GENPLOGID" NUMBER(*,0), 
	"GENTRIGGER" NUMBER(*,0), 
	"GENTLOGID" NUMBER(*,0), 
	"GOWNER" VARCHAR2(30 BYTE), 
	"GNAME" VARCHAR2(30 BYTE), 
	"FLAG" RAW(4) DEFAULT '00000000'
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPOBJECT"."SNAME" IS 'Name of the object owner';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPOBJECT"."ONAME" IS 'Name of the object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPOBJECT"."TYPE" IS 'Type of the object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPOBJECT"."VERSION#" IS 'Version of objects of TYPE';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPOBJECT"."HASHCODE" IS 'Hashcode of objects of TYPE';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPOBJECT"."ID" IS 'Identifier of the local object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPOBJECT"."OBJECT_COMMENT" IS 'Description of the replicated object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPOBJECT"."STATUS" IS 'Status of the last create or alter request on the local object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPOBJECT"."GENPACKAGE" IS 'Status of whether the object needs to generate replication package';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPOBJECT"."GENPLOGID" IS 'Log id of message sent for generating package support';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPOBJECT"."GENTRIGGER" IS 'Status of whether the object needs to generate replication trigger';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPOBJECT"."GENTLOGID" IS 'Log id of message sent for generating trigger support';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPOBJECT"."GOWNER" IS 'Owner of the object''s object group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPOBJECT"."GNAME" IS 'Name of the object''s object group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPOBJECT"."FLAG" IS 'Information about replicated object';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_REPOBJECT"  IS 'Information about replicated objects';
--------------------------------------------------------
--  DDL for Table REPCAT$_REPPROP
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_REPPROP" 
   (	"SNAME" VARCHAR2(30 BYTE), 
	"ONAME" VARCHAR2(30 BYTE), 
	"TYPE" NUMBER(*,0), 
	"DBLINK" VARCHAR2(128 BYTE), 
	"HOW" NUMBER(*,0), 
	"PROPAGATE_COMMENT" VARCHAR2(80 BYTE), 
	"DELIVERY_ORDER" NUMBER, 
	"RECIPIENT_KEY" NUMBER, 
	"EXTENSION_ID" RAW(16) DEFAULT '00'
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPPROP"."SNAME" IS 'Name of the object owner';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPPROP"."ONAME" IS 'Name of the object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPPROP"."TYPE" IS 'Type of the object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPPROP"."DBLINK" IS 'Destination database for propagation';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPPROP"."HOW" IS 'Propagation choice for the destination database';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPPROP"."PROPAGATE_COMMENT" IS 'Description of the propagation choice';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPPROP"."DELIVERY_ORDER" IS 'Value of delivery order when the master was added';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPPROP"."RECIPIENT_KEY" IS 'Recipient key for sname and oname, used in joining with def$_aqcall';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPPROP"."EXTENSION_ID" IS 'Identifier of any active extension request';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_REPPROP"  IS 'Propagation information about replicated objects';
--------------------------------------------------------
--  DDL for Table REPCAT$_REPSCHEMA
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_REPSCHEMA" 
   (	"GOWNER" VARCHAR2(30 BYTE) DEFAULT 'PUBLIC', 
	"SNAME" VARCHAR2(30 BYTE), 
	"DBLINK" VARCHAR2(128 BYTE), 
	"MASTERDEF" VARCHAR2(1 BYTE), 
	"SNAPMASTER" VARCHAR2(1 BYTE), 
	"MASTER_COMMENT" VARCHAR2(80 BYTE), 
	"MASTER" VARCHAR2(1 BYTE), 
	"PROP_UPDATES" NUMBER DEFAULT 0, 
	"MY_DBLINK" VARCHAR2(1 BYTE), 
	"EXTENSION_ID" RAW(16) DEFAULT '00'
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPSCHEMA"."GOWNER" IS 'Owner of the replicated object group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPSCHEMA"."SNAME" IS 'Name of the replicated object group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPSCHEMA"."DBLINK" IS 'A database site replicating the object group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPSCHEMA"."MASTERDEF" IS 'Is the database the master definition site for the replicated object group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPSCHEMA"."SNAPMASTER" IS 'For a snapshot site, is this the current refresh_master';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPSCHEMA"."MASTER_COMMENT" IS 'Description of the database site';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPSCHEMA"."MASTER" IS 'Redundant information from repcat$_repcat.master';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPSCHEMA"."PROP_UPDATES" IS 'Number of requested updates for master in repcat$_repprop';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPSCHEMA"."MY_DBLINK" IS 'A sanity check after import: is this master the current site';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_REPSCHEMA"."EXTENSION_ID" IS 'Dummy column for foreign key';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_REPSCHEMA"  IS 'N-way replication information';
--------------------------------------------------------
--  DDL for Table REPCAT$_RESOLUTION
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_RESOLUTION" 
   (	"SNAME" VARCHAR2(30 BYTE), 
	"ONAME" VARCHAR2(30 BYTE), 
	"CONFLICT_TYPE_ID" NUMBER(*,0), 
	"REFERENCE_NAME" VARCHAR2(30 BYTE), 
	"SEQUENCE_NO" NUMBER, 
	"METHOD_NAME" VARCHAR2(80 BYTE), 
	"FUNCTION_NAME" VARCHAR2(92 BYTE), 
	"PRIORITY_GROUP" VARCHAR2(30 BYTE), 
	"RESOLUTION_COMMENT" VARCHAR2(80 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOLUTION"."SNAME" IS 'Owner of replicated object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOLUTION"."ONAME" IS 'Name of the replicated object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOLUTION"."CONFLICT_TYPE_ID" IS 'Type of conflict';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOLUTION"."REFERENCE_NAME" IS 'Table name, unique constraint name, or column group name';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOLUTION"."SEQUENCE_NO" IS 'Ordering on resolution';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOLUTION"."METHOD_NAME" IS 'Name of the conflict resolution method';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOLUTION"."FUNCTION_NAME" IS 'Name of the resolution function';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOLUTION"."PRIORITY_GROUP" IS 'Name of the priority group used in conflict resolution';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOLUTION"."RESOLUTION_COMMENT" IS 'Description of the conflict resolution';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_RESOLUTION"  IS 'Description of all conflict resolutions in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_RESOLUTION_METHOD
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_RESOLUTION_METHOD" 
   (	"CONFLICT_TYPE_ID" NUMBER(*,0), 
	"METHOD_NAME" VARCHAR2(80 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOLUTION_METHOD"."CONFLICT_TYPE_ID" IS 'Type of conflict';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOLUTION_METHOD"."METHOD_NAME" IS 'Name of the conflict resolution method';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_RESOLUTION_METHOD"  IS 'All conflict resolution methods in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_RESOLUTION_STATISTICS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS" 
   (	"SNAME" VARCHAR2(30 BYTE), 
	"ONAME" VARCHAR2(30 BYTE), 
	"CONFLICT_TYPE_ID" NUMBER(*,0), 
	"REFERENCE_NAME" VARCHAR2(30 BYTE), 
	"METHOD_NAME" VARCHAR2(80 BYTE), 
	"FUNCTION_NAME" VARCHAR2(92 BYTE), 
	"PRIORITY_GROUP" VARCHAR2(30 BYTE), 
	"RESOLVED_DATE" DATE, 
	"PRIMARY_KEY_VALUE" VARCHAR2(2000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS"."SNAME" IS 'Owner of replicated object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS"."ONAME" IS 'Name of the replicated object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS"."CONFLICT_TYPE_ID" IS 'Type of conflict';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS"."REFERENCE_NAME" IS 'Table name, unique constraint name, or column group name';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS"."METHOD_NAME" IS 'Name of the conflict resolution method';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS"."FUNCTION_NAME" IS 'Name of the resolution function';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS"."PRIORITY_GROUP" IS 'Name of the priority group used in conflict resolution';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS"."RESOLVED_DATE" IS 'Timestamp for the resolution of the conflict';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS"."PRIMARY_KEY_VALUE" IS 'Primary key of the replicated row (character data)';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS"  IS 'Statistics for conflict resolutions for all replicated tables in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_RESOL_STATS_CONTROL
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_RESOL_STATS_CONTROL" 
   (	"SNAME" VARCHAR2(30 BYTE), 
	"ONAME" VARCHAR2(30 BYTE), 
	"CREATED" DATE, 
	"STATUS" NUMBER(*,0), 
	"STATUS_UPDATE_DATE" DATE, 
	"PURGED_DATE" DATE, 
	"LAST_PURGE_START_DATE" DATE, 
	"LAST_PURGE_END_DATE" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOL_STATS_CONTROL"."SNAME" IS 'Owner of replicated object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOL_STATS_CONTROL"."ONAME" IS 'Name of the replicated object';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOL_STATS_CONTROL"."CREATED" IS 'Timestamp for which statistics collection was first started';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOL_STATS_CONTROL"."STATUS" IS 'Status of statistics collection: ACTIVE, CANCELLED';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOL_STATS_CONTROL"."STATUS_UPDATE_DATE" IS 'Timestamp for which the status was last updated';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOL_STATS_CONTROL"."PURGED_DATE" IS 'Timestamp for the last purge of statistics data';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOL_STATS_CONTROL"."LAST_PURGE_START_DATE" IS 'The last start date of the statistics purging date range';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RESOL_STATS_CONTROL"."LAST_PURGE_END_DATE" IS 'The last end date of the statistics purging date range';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_RESOL_STATS_CONTROL"  IS 'Information about statistics collection for conflict resolutions for all replicated tables in the database';
--------------------------------------------------------
--  DDL for Table REPCAT$_RUNTIME_PARMS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_RUNTIME_PARMS" 
   (	"RUNTIME_PARM_ID" NUMBER, 
	"PARAMETER_NAME" VARCHAR2(30 BYTE), 
	"PARM_VALUE" CLOB
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("PARM_VALUE") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RUNTIME_PARMS"."RUNTIME_PARM_ID" IS 'Primary key of the parameter values table.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RUNTIME_PARMS"."PARAMETER_NAME" IS 'Name of the parameter.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_RUNTIME_PARMS"."PARM_VALUE" IS 'Parameter value.';
--------------------------------------------------------
--  DDL for Table REPCAT$_SITES_NEW
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_SITES_NEW" 
   (	"EXTENSION_ID" RAW(16), 
	"GOWNER" VARCHAR2(30 BYTE), 
	"GNAME" VARCHAR2(30 BYTE), 
	"DBLINK" VARCHAR2(128 BYTE), 
	"FULL_INSTANTIATION" VARCHAR2(1 BYTE), 
	"MASTER_STATUS" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_SITES_NEW"."EXTENSION_ID" IS 'Globally unique identifier for replication extension';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_SITES_NEW"."GOWNER" IS 'Owner of the object group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_SITES_NEW"."GNAME" IS 'Name of the replicated object group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_SITES_NEW"."DBLINK" IS 'A database site that will replicate the object group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_SITES_NEW"."FULL_INSTANTIATION" IS 'Y if the database uses full-database export or change-based recovery';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_SITES_NEW"."MASTER_STATUS" IS 'Instantiation status of the new master';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_SITES_NEW"  IS 'Information about new masters for replication extension';
--------------------------------------------------------
--  DDL for Table REPCAT$_SITE_OBJECTS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_SITE_OBJECTS" 
   (	"TEMPLATE_SITE_ID" NUMBER, 
	"SNAME" VARCHAR2(30 BYTE), 
	"ONAME" VARCHAR2(30 BYTE), 
	"OBJECT_TYPE_ID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_SITE_OBJECTS"."TEMPLATE_SITE_ID" IS 'Internal primary key of the template sites table.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_SITE_OBJECTS"."SNAME" IS 'Schema containing the deployed database object.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_SITE_OBJECTS"."ONAME" IS 'Name of the deployed database object.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_SITE_OBJECTS"."OBJECT_TYPE_ID" IS 'Internal ID of the object type of the deployed database object.';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_SITE_OBJECTS"  IS 'Table for maintaining database objects deployed at a site.';
--------------------------------------------------------
--  DDL for Table REPCAT$_SNAPGROUP
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_SNAPGROUP" 
   (	"GOWNER" VARCHAR2(30 BYTE) DEFAULT 'PUBLIC', 
	"GNAME" VARCHAR2(30 BYTE), 
	"DBLINK" VARCHAR2(128 BYTE), 
	"GROUP_COMMENT" VARCHAR2(80 BYTE), 
	"REP_TYPE" NUMBER, 
	"FLAVOR_ID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_SNAPGROUP"."GOWNER" IS 'Owner of the snapshot repgroup';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_SNAPGROUP"."GNAME" IS 'Name of the snapshot repgroup';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_SNAPGROUP"."DBLINK" IS 'Database site of the snapshot repgroup';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_SNAPGROUP"."GROUP_COMMENT" IS 'Description of the snapshot repgroup';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_SNAPGROUP"."REP_TYPE" IS 'Identifier of flavor at snapshot';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_SNAPGROUP"  IS 'Snapshot repgroup registration information';
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_OBJECTS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS" 
   (	"TEMPLATE_OBJECT_ID" NUMBER, 
	"REFRESH_TEMPLATE_ID" NUMBER, 
	"OBJECT_NAME" VARCHAR2(30 BYTE), 
	"OBJECT_TYPE" NUMBER, 
	"OBJECT_VERSION#" NUMBER, 
	"DDL_TEXT" CLOB, 
	"MASTER_ROLLBACK_SEG" VARCHAR2(30 BYTE), 
	"DERIVED_FROM_SNAME" VARCHAR2(30 BYTE), 
	"DERIVED_FROM_ONAME" VARCHAR2(30 BYTE), 
	"FLAVOR_ID" NUMBER, 
	"SCHEMA_NAME" VARCHAR2(30 BYTE), 
	"DDL_NUM" NUMBER DEFAULT 1, 
	"TEMPLATE_REFGROUP_ID" NUMBER DEFAULT 0, 
	"FLAGS" RAW(255), 
	"SPARE1" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("DDL_TEXT") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS"."TEMPLATE_OBJECT_ID" IS 'Internal primary key of the REPCAT$_TEMPLATE_OBJECTS table.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS"."REFRESH_TEMPLATE_ID" IS 'Internal primary key of the REPCAT$_REFRESH_TEMPLATES table.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS"."OBJECT_NAME" IS 'Name of the database object.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS"."OBJECT_TYPE" IS 'Type of database object.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS"."OBJECT_VERSION#" IS 'Version# of database object of TYPE.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS"."DDL_TEXT" IS 'DDL string for creating the object or WHERE clause for snapshot query.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS"."MASTER_ROLLBACK_SEG" IS 'Rollback segment for use during snapshot refreshes.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS"."DERIVED_FROM_SNAME" IS 'Schema name of schema containing object this was derived from.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS"."DERIVED_FROM_ONAME" IS 'Object name of object this object was derived from.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS"."FLAVOR_ID" IS 'Foreign key to the REPCAT$_FLAVORS table.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS"."SCHEMA_NAME" IS 'Schema containing the object.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS"."DDL_NUM" IS 'Order of ddls to execute.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS"."TEMPLATE_REFGROUP_ID" IS 'Internal ID of the refresh group to contain the object.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS"."FLAGS" IS 'Internal flags for the object.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS"."SPARE1" IS 'Reserved for future use.';
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_PARMS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_TEMPLATE_PARMS" 
   (	"TEMPLATE_PARAMETER_ID" NUMBER, 
	"REFRESH_TEMPLATE_ID" NUMBER, 
	"PARAMETER_NAME" VARCHAR2(30 BYTE), 
	"DEFAULT_PARM_VALUE" CLOB, 
	"PROMPT_STRING" VARCHAR2(2000 BYTE), 
	"USER_OVERRIDE" VARCHAR2(1 BYTE) DEFAULT 'Y'
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("DEFAULT_PARM_VALUE") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_PARMS"."TEMPLATE_PARAMETER_ID" IS 'Internal primary key of the REPCAT$_TEMPLATE_PARMS table.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_PARMS"."REFRESH_TEMPLATE_ID" IS 'Internal primary key of the REPCAT$_REFRESH_TEMPLATES table.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_PARMS"."PARAMETER_NAME" IS 'name of the parameter.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_PARMS"."DEFAULT_PARM_VALUE" IS 'Default value for the parameter.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_PARMS"."PROMPT_STRING" IS 'String for use in prompting for parameter values.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_PARMS"."USER_OVERRIDE" IS 'User override flag.';
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_REFGROUPS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS" 
   (	"REFRESH_GROUP_ID" NUMBER, 
	"REFRESH_GROUP_NAME" VARCHAR2(30 BYTE), 
	"REFRESH_TEMPLATE_ID" NUMBER, 
	"ROLLBACK_SEG" VARCHAR2(30 BYTE), 
	"START_DATE" VARCHAR2(200 BYTE), 
	"INTERVAL" VARCHAR2(200 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS"."REFRESH_GROUP_ID" IS 'Internal primary key of the refresh groups table.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS"."REFRESH_GROUP_NAME" IS 'Name of the refresh group';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS"."REFRESH_TEMPLATE_ID" IS 'Primary key of the template containing the refresh group.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS"."ROLLBACK_SEG" IS 'Name of the rollback segment to use during refresh.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS"."START_DATE" IS 'Refresh start date.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS"."INTERVAL" IS 'Refresh interval.';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS"  IS 'Table for maintaining refresh group information for template.';
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_SITES
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_TEMPLATE_SITES" 
   (	"TEMPLATE_SITE_ID" NUMBER, 
	"REFRESH_TEMPLATE_NAME" VARCHAR2(30 BYTE), 
	"REFRESH_GROUP_NAME" VARCHAR2(30 BYTE), 
	"TEMPLATE_OWNER" VARCHAR2(30 BYTE), 
	"USER_NAME" VARCHAR2(30 BYTE), 
	"SITE_NAME" VARCHAR2(128 BYTE), 
	"REPAPI_SITE_ID" NUMBER, 
	"STATUS" NUMBER, 
	"REFRESH_TEMPLATE_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"INSTANTIATION_DATE" DATE
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_SITES"."TEMPLATE_SITE_ID" IS 'Internal primary key of the REPCAT$_TEMPLATE_SITES table.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_SITES"."REFRESH_TEMPLATE_NAME" IS 'Name of the refresh group template.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_SITES"."REFRESH_GROUP_NAME" IS 'Name of the refresh group to create during instantiation.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_SITES"."TEMPLATE_OWNER" IS 'Owner of the refresh group template.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_SITES"."USER_NAME" IS 'Database user name.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_SITES"."SITE_NAME" IS 'Name of the site that has instantiated the template.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_SITES"."REPAPI_SITE_ID" IS 'Name of the site that has instantiated the template.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_SITES"."STATUS" IS 'Obsolete - do not use.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_SITES"."REFRESH_TEMPLATE_ID" IS 'Obsolete - do not use.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_SITES"."USER_ID" IS 'Obsolete - do not use.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_SITES"."INSTANTIATION_DATE" IS 'Date template was instantiated.';
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_STATUS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_TEMPLATE_STATUS" 
   (	"TEMPLATE_STATUS_ID" NUMBER, 
	"STATUS_TYPE_NAME" VARCHAR2(100 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_STATUS"."TEMPLATE_STATUS_ID" IS 'Internal primary key for the template status table.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_STATUS"."STATUS_TYPE_NAME" IS 'User friendly name for the template status.';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_TEMPLATE_STATUS"  IS 'Table for template status and template status codes.';
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_TARGETS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_TEMPLATE_TARGETS" 
   (	"TEMPLATE_TARGET_ID" NUMBER, 
	"TARGET_DATABASE" VARCHAR2(128 BYTE), 
	"TARGET_COMMENT" VARCHAR2(2000 BYTE), 
	"CONNECT_STRING" VARCHAR2(4000 BYTE), 
	"SPARE1" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_TARGETS"."TEMPLATE_TARGET_ID" IS 'Internal primary key of the template targets table.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_TARGETS"."TARGET_DATABASE" IS 'Global identifier of the target database.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_TARGETS"."TARGET_COMMENT" IS 'Comment on the target database.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_TARGETS"."CONNECT_STRING" IS 'The connection descriptor used to connect to the target database.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_TARGETS"."SPARE1" IS 'The spare column';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_TEMPLATE_TARGETS"  IS 'Internal table for tracking potential target databases for templates.';
--------------------------------------------------------
--  DDL for Table REPCAT$_TEMPLATE_TYPES
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_TEMPLATE_TYPES" 
   (	"TEMPLATE_TYPE_ID" NUMBER, 
	"TEMPLATE_DESCRIPTION" VARCHAR2(200 BYTE), 
	"FLAGS" RAW(255), 
	"SPARE1" VARCHAR2(4000 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_TYPES"."TEMPLATE_TYPE_ID" IS 'Internal primary key of the template types table.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_TYPES"."TEMPLATE_DESCRIPTION" IS 'Description of the template type.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_TYPES"."FLAGS" IS 'Bitmap flags controlling each type of template.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_TEMPLATE_TYPES"."SPARE1" IS 'Reserved for future expansion.';
   COMMENT ON TABLE "SYSTEM"."REPCAT$_TEMPLATE_TYPES"  IS 'Internal table for maintaining types of templates.';
--------------------------------------------------------
--  DDL for Table REPCAT$_USER_AUTHORIZATIONS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_USER_AUTHORIZATIONS" 
   (	"USER_AUTHORIZATION_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"REFRESH_TEMPLATE_ID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_USER_AUTHORIZATIONS"."USER_AUTHORIZATION_ID" IS 'Internal primary key of the REPCAT$_USER_AUTHORIZATIONS table.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_USER_AUTHORIZATIONS"."USER_ID" IS 'Database user id.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_USER_AUTHORIZATIONS"."REFRESH_TEMPLATE_ID" IS 'Internal primary key of the REPCAT$_REFRESH_TEMPLATES table.';
--------------------------------------------------------
--  DDL for Table REPCAT$_USER_PARM_VALUES
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."REPCAT$_USER_PARM_VALUES" 
   (	"USER_PARAMETER_ID" NUMBER, 
	"TEMPLATE_PARAMETER_ID" NUMBER, 
	"USER_ID" NUMBER, 
	"PARM_VALUE" CLOB
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("PARM_VALUE") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "SYSTEM"."REPCAT$_USER_PARM_VALUES"."USER_PARAMETER_ID" IS 'Internal primary key of the REPCAT$_USER_PARM_VALUES table.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_USER_PARM_VALUES"."TEMPLATE_PARAMETER_ID" IS 'Internal primary key of the REPCAT$_TEMPLATE_PARMS table.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_USER_PARM_VALUES"."USER_ID" IS 'Database user id.';
   COMMENT ON COLUMN "SYSTEM"."REPCAT$_USER_PARM_VALUES"."PARM_VALUE" IS 'Value of the parameter for this user.';
--------------------------------------------------------
--  DDL for Table RESTRIG
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."RESTRIG" 
   (	"FECHA" DATE, 
	"AVISO" VARCHAR2(100 BYTE), 
	"TABLA" VARCHAR2(50 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SQLPLUS_PRODUCT_PROFILE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."SQLPLUS_PRODUCT_PROFILE" 
   (	"PRODUCT" VARCHAR2(30 BYTE), 
	"USERID" VARCHAR2(30 BYTE), 
	"ATTRIBUTE" VARCHAR2(240 BYTE), 
	"SCOPE" VARCHAR2(240 BYTE), 
	"NUMERIC_VALUE" NUMBER(15,2), 
	"CHAR_VALUE" VARCHAR2(240 BYTE), 
	"DATE_VALUE" DATE, 
	"LONG_VALUE" LONG
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TELEFONO
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."TELEFONO" 
   (	"IDCONTACT" NUMBER(10,0), 
	"PHONENUMBER" VARCHAR2(20 BYTE), 
	"PHONETYPE" VARCHAR2(8 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Sequence LOGMNR_EVOLVE_SEQ$
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."LOGMNR_EVOLVE_SEQ$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LOGMNR_SEQ$
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."LOGMNR_SEQ$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LOGMNR_UIDS$
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."LOGMNR_UIDS$"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 100 NOCACHE  ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MVIEW$_ADVSEQ_GENERIC
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."MVIEW$_ADVSEQ_GENERIC"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 1 CACHE 50 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence MVIEW$_ADVSEQ_ID
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."MVIEW$_ADVSEQ_ID"  MINVALUE 1 MAXVALUE 4294967295 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_EXCEPTIONS_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_EXCEPTIONS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_FLAVORS_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_FLAVORS_S"  MINVALUE -2147483647 MAXVALUE 2147483647 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_FLAVOR_NAME_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_FLAVOR_NAME_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_REFRESH_TEMPLATES_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_REFRESH_TEMPLATES_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_REPPROP_KEY
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_REPPROP_KEY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_RUNTIME_PARMS_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_RUNTIME_PARMS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_TEMPLATE_OBJECTS_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_TEMPLATE_PARMS_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_TEMPLATE_PARMS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_TEMPLATE_REFGROUPS_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_TEMPLATE_SITES_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_TEMPLATE_SITES_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_TEMP_OUTPUT_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_TEMP_OUTPUT_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_USER_AUTHORIZATIONS_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_USER_AUTHORIZATIONS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT$_USER_PARM_VALUES_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT$_USER_PARM_VALUES_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPCAT_LOG_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."REPCAT_LOG_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TEMPLATE$_TARGETS_S
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."TEMPLATE$_TARGETS_S"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
REM INSERTING into SYSTEM.AQ$_INTERNET_AGENTS
SET DEFINE OFF;
Insert into SYSTEM.AQ$_INTERNET_AGENTS (AGENT_NAME,PROTOCOL,SPARE1) values ('SCHEDULER$_EVENT_AGENT',0,null);
Insert into SYSTEM.AQ$_INTERNET_AGENTS (AGENT_NAME,PROTOCOL,SPARE1) values ('SCHEDULER$_REMDB_AGENT',0,null);
Insert into SYSTEM.AQ$_INTERNET_AGENTS (AGENT_NAME,PROTOCOL,SPARE1) values ('SERVER_ALERT',0,null);
Insert into SYSTEM.AQ$_INTERNET_AGENTS (AGENT_NAME,PROTOCOL,SPARE1) values ('HAE_SUB',0,null);
REM INSERTING into SYSTEM.AQ$_INTERNET_AGENT_PRIVS
SET DEFINE OFF;
Insert into SYSTEM.AQ$_INTERNET_AGENT_PRIVS (AGENT_NAME,DB_USERNAME) values ('SCHEDULER$_EVENT_AGENT','SYS');
Insert into SYSTEM.AQ$_INTERNET_AGENT_PRIVS (AGENT_NAME,DB_USERNAME) values ('SCHEDULER$_REMDB_AGENT','SYS');
Insert into SYSTEM.AQ$_INTERNET_AGENT_PRIVS (AGENT_NAME,DB_USERNAME) values ('SERVER_ALERT','SYS');
REM INSERTING into SYSTEM.AQ$_QUEUES
SET DEFINE OFF;
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('2736A76D035744AFA68E5C33FE7C26E5',12465,'AQ$_SCHEDULER$_EVENT_QTAB_E',12443,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('CD0F0CA8DFFC4D7BBC77813ECC751E72',12467,'SCHEDULER$_EVENT_QUEUE',12443,0,3,5,0,0,3600,'Scheduler event queue',null,null,null,null);
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('356AF870A68A4B84BE225DF13099078C',12500,'AQ$_SCHEDULER$_REMDB_JOBQTAB_E',12471,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('945FC95806404173B431A58777D1F887',12501,'SCHEDULER$_REMDB_JOBQ',12471,0,3,5,0,0,0,'Scheduler remote db job queue',null,null,null,null);
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('3C554688CC2640C0BF1449A42B43FA04',12530,'AQ$_SCHEDULER_FILEWATCHER_QT_E',12505,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('0ABEB18959954216B9D6364127F4CA19',12531,'SCHEDULER_FILEWATCHER_Q',12505,0,3,5,0,0,0,'Scheduler file watcher results queue',null,null,null,null);
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('EE8675F0C99B4864B92E77225A60714E',12586,'AQ$_ALERT_QT_E',12564,1,2,0,0,0,0,'exception queue',null,null,null,null);
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('96AC47A6C5294B288ADAF749E2D94A9E',12587,'ALERT_QUE',12564,0,3,5,0,0,0,'Server Generated Alert Queue',null,null,null,null);
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('84D997DED8DB4918BF0BB873ABFF4E7F',12760,'AQ$_AQ$_MEM_MC_E',12736,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('8D951A841D3146C68DDABCFB01FCB9B0',12761,'SRVQUEUE',12736,2,3,0,0,0,0,null,null,null,null,null);
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('15191CEB5B524A5E956B0CD347870CA6',12772,'AQ$_AQ_EVENT_TABLE_E',12762,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('D0BE456A7F364ACAB7986274E25DE25D',12773,'AQ_EVENT_TABLE_Q',12762,0,3,5,0,0,0,'CREATING AQ_EVENT_TABLE_Q QUEUE',null,null,null,null);
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('3AE990EF03694C6E8D5175633F841824',12796,'AQ$_AQ_PROP_TABLE_E',12774,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('7C3555D602744A0E9D10C7890DABB316',12797,'AQ_PROP_NOTIFY',12774,0,3,5,0,0,0,'Queue for Notifying events in AQ Prop. Scheduling',null,null,null,null);
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('6B26E6749EA646BEA66D38278E3FC55D',12979,'AQ$_KUPC$DATAPUMP_QUETAB_E',12932,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('F4DFB12C3AA54C56919ACE9BD52C1549',13050,'AQ$_DEF$_AQCALL_E',13042,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('1CD95F2CB21240268B26B0C602FD4147',13051,'DEF$_AQCALL',13042,0,3,5,0,1,0,'Deferred RPC Queue',null,null,null,null);
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('D06037C39F864435B7E2304C39C3034E',13061,'AQ$_DEF$_AQERROR_E',13053,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('78E69D5872B5439AB9588EC9F9B222A8',13062,'DEF$_AQERROR',13053,0,3,5,0,1,0,'Error Queue for Deferred RPCs',null,null,null,null);
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('EE35125E9DA949E89F91E61109051D39',13103,'AQ$_SYS$SERVICE_METRICS_TAB_E',13081,1,0,0,0,0,0,'exception queue',null,null,null,null);
Insert into SYSTEM.AQ$_QUEUES (OID,EVENTID,NAME,TABLE_OBJNO,USAGE,ENABLE_FLAG,MAX_RETRIES,RETRY_DELAY,PROPERTIES,RET_TIME,QUEUE_COMMENT,SUBSCRIBERS,MEMORY_THRESHOLD,SERVICE_NAME,NETWORK_NAME) values ('275CEBEBB639437C92D40FF13870A1F0',13104,'SYS$SERVICE_METRICS',13081,0,3,5,0,0,3600,null,null,null,null,null);
REM INSERTING into SYSTEM.AQ$_QUEUE_TABLES
SET DEFINE OFF;
Insert into SYSTEM.AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYS','SCHEDULER$_EVENT_QTAB',1,12443,16805897,2,'00:00','Scheduler event queue table');
Insert into SYSTEM.AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYS','SCHEDULER$_REMDB_JOBQTAB',1,12471,16801801,2,'00:00','Scheduler remote db job queue table');
Insert into SYSTEM.AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYS','SCHEDULER_FILEWATCHER_QT',1,12505,16805897,2,'00:00','Scheduler file watcher result queue table');
Insert into SYSTEM.AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYS','ALERT_QT',1,12564,16805897,2,'00:00','Server Generated Alert Queue Table');
Insert into SYSTEM.AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYS','AQ$_MEM_MC',3,12736,16801801,2,'00:00','table for non_persistent queues');
Insert into SYSTEM.AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYS','AQ_EVENT_TABLE',1,12762,16793600,2,'00:00','CREATING AQ_EVENT_TABLE QUEUE TABLE');
Insert into SYSTEM.AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYS','AQ_PROP_TABLE',1,12774,16801801,2,'00:00','Queue Table for Notification in AQ Prop. Scheduling');
Insert into SYSTEM.AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYS','KUPC$DATAPUMP_QUETAB',1,12932,16793609,2,'00:00','DataPump Queue Table');
Insert into SYSTEM.AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYSTEM','DEF$_AQCALL',2,13042,16793600,2,'00:00',null);
Insert into SYSTEM.AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYSTEM','DEF$_AQERROR',2,13053,16793600,2,'00:00',null);
Insert into SYSTEM.AQ$_QUEUE_TABLES (SCHEMA,NAME,UDATA_TYPE,OBJNO,FLAGS,SORT_COLS,TIMEZONE,TABLE_COMMENT) values ('SYS','SYS$SERVICE_METRICS_TAB',1,13081,16801801,2,'00:00',null);
REM INSERTING into SYSTEM.AQ$_SCHEDULES
SET DEFINE OFF;
REM INSERTING into SYSTEM.CORREO
SET DEFINE OFF;
Insert into SYSTEM.CORREO (IDCONTACT,EMAILADDRESS,EMAILTYPE) values (1,'antocace@hotmail.com','Personal');
REM INSERTING into SYSTEM.DEF$_CALLDEST
SET DEFINE OFF;
REM INSERTING into SYSTEM.DEF$_DEFAULTDEST
SET DEFINE OFF;
REM INSERTING into SYSTEM.DEF$_DESTINATION
SET DEFINE OFF;
REM INSERTING into SYSTEM.DEF$_ERROR
SET DEFINE OFF;
REM INSERTING into SYSTEM.DEF$_LOB
SET DEFINE OFF;
REM INSERTING into SYSTEM.DEF$_ORIGIN
SET DEFINE OFF;
REM INSERTING into SYSTEM.DEF$_PROPAGATOR
SET DEFINE OFF;
REM INSERTING into SYSTEM.DEF$_PUSHED_TRANSACTIONS
SET DEFINE OFF;
REM INSERTING into SYSTEM.DIRECCION
SET DEFINE OFF;
Insert into SYSTEM.DIRECCION (IDCONTACT,ADDRESS,CITY,COUNTRY) values (1,'Ayacucho','Cochabamba','Bolivia');
REM INSERTING into SYSTEM.HELP
SET DEFINE OFF;
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@',2,' @ ("at" sign)');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@',3,' -------------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@',4,' Runs the SQL*Plus statements in the specified script. The script can be');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@',5,' called from the local file system or a web server.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@',6,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@',7,' @ {url|file_name[.ext]} [arg ...]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@',8,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@',9,' where url supports HTTP and FTP protocols in the form:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@',10,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@',11,'    http://host.domain/script.sql');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@',12,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@@',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@@',2,' @@ (double "at" sign)');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@@',3,' ---------------------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@@',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@@',5,' Runs the specified script. This command is almost identical to');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@@',6,' the @ command. It is useful for running nested scripts because it');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@@',7,' has the additional functionality of looking for the nested script');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@@',8,' in the same url or path as the calling script.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@@',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@@',10,' @@ {url|file_name[.ext]} [arg ...]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('@@',11,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('/',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('/',2,' / (slash)');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('/',3,' ---------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('/',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('/',5,' Executes the most recently executed SQL command or PL/SQL block');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('/',6,' which is stored in the SQL buffer. Use slash (/) at the command');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('/',7,' prompt or line number prompt in SQL*Plus command line. The buffer');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('/',8,' has no command history and does not record SQL*Plus commands.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('/',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('/',10,' /');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('/',11,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ACCEPT',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ACCEPT',2,' ACCEPT');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ACCEPT',3,' ------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ACCEPT',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ACCEPT',5,' Reads a line of input and stores it in a given substitution variable.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ACCEPT',6,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ACCEPT',7,' ACC[EPT] variable [NUM[BER] | CHAR | DATE | BINARY_FLOAT | BINARY_DOUBLE]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ACCEPT',8,' [FOR[MAT] format] [DEF[AULT] default] [PROMPT text | NOPR[OMPT]] [HIDE]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ACCEPT',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('APPEND',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('APPEND',2,' APPEND');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('APPEND',3,' ------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('APPEND',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('APPEND',5,' Adds text to the end of the current line in the SQL buffer.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('APPEND',6,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('APPEND',7,' A[PPEND] text');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('APPEND',8,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ARCHIVE LOG',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ARCHIVE LOG',2,' ARCHIVE LOG');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ARCHIVE LOG',3,' -----------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ARCHIVE LOG',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ARCHIVE LOG',5,' Displays information about redo log files.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ARCHIVE LOG',6,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ARCHIVE LOG',7,' ARCHIVE LOG LIST');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ARCHIVE LOG',8,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',2,' ATTRIBUTE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',3,' ---------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',5,' Specifies display characteristics for a given attribute of an Object Type');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',6,' column, such as the format of NUMBER data. Columns and attributes should');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',7,' not have the same names as they share a common namespace. Lists the');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',8,' current display characteristics for a single attribute or all attributes.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',10,' ATTRIBUTE [type_name.attribute_name [option ... ]]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',11,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',12,' where option represents one of the following terms or clauses:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',13,'     ALI[AS] alias');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',14,'     CLE[AR]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',15,'     FOR[MAT] format');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',16,'     LIKE {type_name.attribute_name | alias}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',17,'     ON|OFF');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('ATTRIBUTE',18,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BREAK',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BREAK',2,' BREAK');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BREAK',3,' -----');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BREAK',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BREAK',5,' Specifies where changes occur in a report and the formatting');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BREAK',6,' action to perform, such as:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BREAK',7,' - suppressing display of duplicate values for a given column');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BREAK',8,' - skipping a line each time a given column value changes');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BREAK',9,' - printing computed figures each time a given column value');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BREAK',10,'   changes or at the end of the report.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BREAK',11,' Enter BREAK with no clauses to list the current BREAK definition.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BREAK',12,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BREAK',13,' BRE[AK] [ON report_element [action [action]]] ...');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BREAK',14,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BREAK',15,' where report_element has the following syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BREAK',16,'     {column | expression | ROW | REPORT}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BREAK',17,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BREAK',18,' and where action has the following syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BREAK',19,'     [SKI[P] n | [SKI[P]] PAGE] [NODUP[LICATES] | DUP[LICATES]]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BREAK',20,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BTITLE',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BTITLE',2,' BTITLE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BTITLE',3,' ------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BTITLE',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BTITLE',5,' Places and formats a specified title at the bottom of each report');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BTITLE',6,' page, or lists the current BTITLE definition.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BTITLE',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BTITLE',8,' BTI[TLE] [printspec [text|variable] ...] | [OFF|ON]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BTITLE',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BTITLE',10,' where printspec represents one or more of the following clauses:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BTITLE',11,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BTITLE',12,'     COL n          LE[FT]        BOLD');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BTITLE',13,'     S[KIP] [n]     CE[NTER]      FORMAT text');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BTITLE',14,'     TAB n          R[IGHT]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('BTITLE',15,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CHANGE',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CHANGE',2,' CHANGE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CHANGE',3,' ------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CHANGE',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CHANGE',5,' Changes the first occurrence of the specified text on the current');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CHANGE',6,' line of the SQL buffer. The buffer has no command history list and');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CHANGE',7,' does not record SQL*Plus commands.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CHANGE',8,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CHANGE',9,' C[HANGE] sepchar old [sepchar [new[sepchar]]]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CHANGE',10,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CLEAR',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CLEAR',2,' CLEAR');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CLEAR',3,' -----');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CLEAR',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CLEAR',5,' Resets or erases the current value or setting for the specified option.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CLEAR',6,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CLEAR',7,' CL[EAR] option ...');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CLEAR',8,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CLEAR',9,' where option represents one of the following clauses:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CLEAR',10,'     BRE[AKS]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CLEAR',11,'     BUFF[ER]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CLEAR',12,'     COL[UMNS]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CLEAR',13,'     COMP[UTES]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CLEAR',14,'     SCR[EEN]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CLEAR',15,'     SQL');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CLEAR',16,'     TIMI[NG]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CLEAR',17,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',2,' COLUMN');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',3,' ------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',5,' Specifies display attributes for a given column, such as:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',6,'     - text for the column heading');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',7,'     - alignment for the column heading');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',8,'     - format for NUMBER data');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',9,'     - wrapping of column data');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',10,' Also lists the current display attributes for a single column');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',11,' or all columns.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',12,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',13,' COL[UMN] [{column | expr} [option ...] ]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',14,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',15,' where option represents one of the following clauses:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',16,'     ALI[AS] alias');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',17,'     CLE[AR]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',18,'     ENTMAP {ON|OFF}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',19,'     FOLD_A[FTER]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',20,'     FOLD_B[EFORE]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',21,'     FOR[MAT] format');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',22,'     HEA[DING] text');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',23,'     JUS[TIFY] {L[EFT] | C[ENTER] | R[IGHT]}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',24,'     LIKE {expr | alias}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',25,'     NEWL[INE]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',26,'     NEW_V[ALUE] variable');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',27,'     NOPRI[NT] | PRI[NT]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',28,'     NUL[L] text');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',29,'     OLD_V[ALUE] variable');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',30,'     ON|OFF');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',31,'     WRA[PPED] | WOR[D_WRAPPED] | TRU[NCATED]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COLUMN',32,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COMPUTE',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COMPUTE',2,' COMPUTE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COMPUTE',3,' -------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COMPUTE',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COMPUTE',5,' In combination with the BREAK command, calculates and prints');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COMPUTE',6,' summary lines using various standard computations. Also lists');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COMPUTE',7,' all COMPUTE definitions.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COMPUTE',8,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COMPUTE',9,' COMP[UTE] [function [LAB[EL] text] ...');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COMPUTE',10,'   OF {expr|column|alias} ...');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COMPUTE',11,'   ON {expr|column|alias|REPORT|ROW} ...]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COMPUTE',12,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CONNECT',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CONNECT',2,' CONNECT');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CONNECT',3,' -------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CONNECT',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CONNECT',5,' Connects a given username to the Oracle Database. When you run a');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CONNECT',6,' CONNECT command, the site profile, glogin.sql, and the user profile,');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CONNECT',7,' login.sql, are processed in that order. CONNECT does not reprompt');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CONNECT',8,' for username or password if the initial connection does not succeed.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CONNECT',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CONNECT',10,' CONN[ECT] [{logon|/|proxy} [AS {SYSOPER|SYSDBA|SYSASM}] [edition=value]]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CONNECT',11,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CONNECT',12,' where logon has the following syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CONNECT',13,'     username[/password][@connect_identifier]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CONNECT',14,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CONNECT',15,' where proxy has the syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CONNECT',16,'     proxyuser[username][/password][@connect_identifier]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CONNECT',17,' NOTE: Brackets around username in proxy are required syntax');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('CONNECT',18,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COPY',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COPY',2,' COPY');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COPY',3,' ----');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COPY',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COPY',5,' Copies data from a query to a table in the same or another');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COPY',6,' database. COPY supports CHAR, DATE, LONG, NUMBER and VARCHAR2.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COPY',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COPY',8,' COPY {FROM database | TO database | FROM database TO database}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COPY',9,'            {APPEND|CREATE|INSERT|REPLACE} destination_table');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COPY',10,'            [(column, column, column, ...)] USING query');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COPY',11,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COPY',12,' where database has the following syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COPY',13,'     username[/password]@connect_identifier');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('COPY',14,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DEFINE',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DEFINE',2,' DEFINE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DEFINE',3,' ------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DEFINE',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DEFINE',5,' Specifies a substitution variable and assigns a CHAR value to it, or');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DEFINE',6,' lists the value and variable type of a single variable or all variables.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DEFINE',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DEFINE',8,' DEF[INE] [variable] | [variable = text]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DEFINE',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DEL',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DEL',2,' DEL');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DEL',3,' ---');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DEL',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DEL',5,' Deletes one or more lines of the SQL buffer. The buffer has no');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DEL',6,' command history list and does not record SQL*Plus commands.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DEL',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DEL',8,' DEL [n | n m | n * | n LAST | * | * n | * LAST | LAST]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DEL',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DESCRIBE',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DESCRIBE',2,' DESCRIBE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DESCRIBE',3,' --------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DESCRIBE',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DESCRIBE',5,' Lists the column definitions for a table, view, or synonym,');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DESCRIBE',6,' or the specifications for a function or procedure.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DESCRIBE',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DESCRIBE',8,' DESC[RIBE] {[schema.]object[@connect_identifier]}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DESCRIBE',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',2,' DISCONNECT');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',3,' ----------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',5,' Commits pending changes to the database and logs the current');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',6,' user out of Oracle, but does not exit SQL*Plus.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',7,' In SQL*Plus command line, use EXIT or QUIT to log out of Oracle');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',8,' and return control to your computer''s operating system.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',10,' DISC[ONNECT]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('DISCONNECT',11,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EDIT',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EDIT',2,' EDIT');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EDIT',3,' ----');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EDIT',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EDIT',5,' Invokes an operating system text editor on the contents of the');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EDIT',6,' specified file or on the contents of the SQL buffer. The buffer');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EDIT',7,' has no command history list and does not record SQL*Plus commands.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EDIT',8,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EDIT',9,' ED[IT] [file_name[.ext]]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EDIT',10,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EXECUTE',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EXECUTE',2,' EXECUTE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EXECUTE',3,' -------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EXECUTE',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EXECUTE',5,' Executes a single PL/SQL statement or runs a stored procedure.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EXECUTE',6,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EXECUTE',7,' EXEC[UTE] statement');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EXECUTE',8,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EXIT',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EXIT',2,' EXIT');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EXIT',3,' ----');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EXIT',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EXIT',5,' Commits or rolls back all pending changes, logs out of Oracle,');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EXIT',6,' terminates SQL*Plus and returns control to the operating system.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EXIT',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EXIT',8,' {EXIT|QUIT} [SUCCESS|FAILURE|WARNING|n|variable|:BindVariable]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EXIT',9,'   [COMMIT|ROLLBACK]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('EXIT',10,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('GET',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('GET',2,' GET');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('GET',3,' ---');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('GET',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('GET',5,' Loads a SQL statement or PL/SQL block from a script into the SQL buffer.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('GET',6,' The buffer has no command history list and does not record SQL*Plus commands.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('GET',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('GET',8,' GET [FILE] file_name[.ext] [LIST | NOLIST]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('GET',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HELP',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HELP',2,' HELP');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HELP',3,' ----');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HELP',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HELP',5,' Accesses this command line help system. Enter HELP INDEX or ? INDEX');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HELP',6,' for a list of topics.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HELP',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HELP',8,' You can view SQL*Plus resources at');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HELP',9,'     http://www.oracle.com/technology/tech/sql_plus/');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HELP',10,' and the Oracle Database Library at');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HELP',11,'     http://www.oracle.com/technology/documentation/');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HELP',12,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HELP',13,' HELP|? [topic]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HELP',14,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HOST',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HOST',2,' HOST');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HOST',3,' ----');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HOST',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HOST',5,' Executes an operating system command without leaving SQL*Plus.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HOST',6,' Enter HOST without command to display an operating system prompt.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HOST',7,' You can then enter multiple operating system commands.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HOST',8,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HOST',9,' HO[ST] [command]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('HOST',10,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INDEX',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INDEX',2,'Enter Help [topic] for help.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INDEX',3,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INDEX',4,' @             COPY         PAUSE                    SHUTDOWN');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INDEX',5,' @@            DEFINE       PRINT                    SPOOL');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INDEX',6,' /             DEL          PROMPT                   SQLPLUS');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INDEX',7,' ACCEPT        DESCRIBE     QUIT                     START');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INDEX',8,' APPEND        DISCONNECT   RECOVER                  STARTUP');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INDEX',9,' ARCHIVE LOG   EDIT         REMARK                   STORE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INDEX',10,' ATTRIBUTE     EXECUTE      REPFOOTER                TIMING');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INDEX',11,' BREAK         EXIT         REPHEADER                TTITLE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INDEX',12,' BTITLE        GET          RESERVED WORDS (SQL)     UNDEFINE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INDEX',13,' CHANGE        HELP         RESERVED WORDS (PL/SQL)  VARIABLE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INDEX',14,' CLEAR         HOST         RUN                      WHENEVER OSERROR');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INDEX',15,' COLUMN        INPUT        SAVE                     WHENEVER SQLERROR');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INDEX',16,' COMPUTE       LIST         SET                      XQUERY');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INDEX',17,' CONNECT       PASSWORD     SHOW');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INDEX',18,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INPUT',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INPUT',2,' INPUT');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INPUT',3,' -----');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INPUT',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INPUT',5,' Adds one or more new lines of text after the current line in the');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INPUT',6,' SQL buffer. The buffer has no command history list and does not');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INPUT',7,' record SQL*Plus commands.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INPUT',8,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INPUT',9,' I[NPUT] [text]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('INPUT',10,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('LIST',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('LIST',2,' LIST');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('LIST',3,' ----');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('LIST',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('LIST',5,' Lists one or more lines of the most recently executed SQL command');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('LIST',6,' or PL/SQL block which is stored in the SQL buffer. Enter LIST with');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('LIST',7,' no clauses to list all lines. In SQL*Plus command-line you can also');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('LIST',8,' use ";" to list all the lines in the SQL buffer. The buffer has no');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('LIST',9,' command history list and does not record SQL*Plus commands.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('LIST',10,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('LIST',11,' L[IST] [n | n m | n  * | n LAST | * | * n | * LAST | LAST]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('LIST',12,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('MENU',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('MENU',2,' Menu');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('MENU',3,' ----');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('MENU',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('MENU',5,' Enter HELP INDEX for a list of help topics.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('MENU',6,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PASSWORD',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PASSWORD',2,' PASSWORD');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PASSWORD',3,' --------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PASSWORD',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PASSWORD',5,' Allows you to change a password without displaying it on an input device.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PASSWORD',6,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PASSWORD',7,' PASSW[ORD] [username]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PASSWORD',8,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PAUSE',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PAUSE',2,' PAUSE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PAUSE',3,' -----');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PAUSE',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PAUSE',5,' Displays the specified text then waits for the user to press RETURN.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PAUSE',6,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PAUSE',7,' PAU[SE] [text]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PAUSE',8,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PRINT',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PRINT',2,' PRINT');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PRINT',3,' -----');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PRINT',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PRINT',5,' Displays the current values of bind variables, or lists all bind');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PRINT',6,' variables.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PRINT',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PRINT',8,' PRI[NT] [variable ...]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PRINT',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PROMPT',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PROMPT',2,' PROMPT');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PROMPT',3,' ------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PROMPT',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PROMPT',5,' Sends the specified message or a blank line to the user''s screen.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PROMPT',6,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PROMPT',7,' PRO[MPT] [text]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('PROMPT',8,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('QUIT',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('QUIT',2,' QUIT (Identical to EXIT)');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('QUIT',3,' ----');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('QUIT',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('QUIT',5,' Commits or rolls back all pending changes, logs out of Oracle,');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('QUIT',6,' terminates SQL*Plus and returns control to the operating system.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('QUIT',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('QUIT',8,' {QUIT|EXIT} [SUCCESS|FAILURE|WARNING|n|variable|:BindVariable]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('QUIT',9,'   [COMMIT|ROLLBACK]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('QUIT',10,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',2,' RECOVER');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',3,' -------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',5,' Performs media recovery on one or more tablespaces, one or more');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',6,' datafiles, or the entire database.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',8,' RECOVER {general | managed} | BEGIN BACKUP | END BACKUP}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',10,' where the general clause has the following syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',11,'   [AUTOMATIC] [FROM location]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',12,'   { {full_database_recovery | partial_database_recovery |LOGFILE filename}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',13,'   [ {TEST | ALLOW integer CORRUPTION | parallel_clause}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',14,'   [TEST | ALLOW integer CORRUPTION | parallel_clause] ...]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',15,'   |CONTINUE [DEFAULT]|CANCEL}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',16,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',17,'   where the full_database_recovery clause has the following syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',18,'     [STANDBY] DATABASE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',19,'     [{ UNTIL {CANCEL | TIME date | CHANGE integer}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',20,'      | USING BACKUP CONTROLFILE}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',21,'      [ UNTIL {CANCEL | TIME date | CHANGE integer}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',22,'      | USING BACKUP CONTROLFILE] ...]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',23,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',24,'   where the partial_database_recovery clause has the following syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',25,'     {TABLESPACE tablespace [, tablespace] ...');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',26,'      | DATAFILE filename | filenumber} [,filename | filenumber] ...');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',27,'      | STANDBY');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',28,'       {TABLESPACE tablespace [, tablespace] ...');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',29,'       | DATAFILE filename | filenumber} [,filename | filenumber] ...}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',30,'     UNTIL [CONSISTENT WITH] CONTROLFILE }');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',31,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',32,' where the parallel clause has the following syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',33,'   {NOPARALLEL | PARALLEL [integer]}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',34,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',35,' where the managed clause has the following syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',36,'   MANAGED STANDBY DATABASE recover_clause | cancel_clause | finish_clause');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',37,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',38,' where the recover_clause has the following syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',39,'   {{DISCONNECT [FROM SESSION] | {TIMEOUT integer | NOTIMEOUT} }');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',40,'    |{NODELAY | DEFAULT DELAY | DELAY integer} | NEXT integer');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',41,'    |{EXPIRE integer | NO EXPIRE} | parallel_clause');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',42,'    | USING CURRENT LOGFILE | UNTIL CHANGE integer');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',43,'    | THROUGH {[THREAD integer] SEQUENCE integer');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',44,'              | ALL ARCHIVELOG  | {ALL | LAST | NEXT } SWITCHOVER} }');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',45,'      [DISCONNECT [FROM SESSION ]  | {TIMEOUT integer | NOTIMEOUT}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',46,'       | {NODELAY | DEFAULT DELAY | DELAY integer} | NEXT integer');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',47,'       | {EXPIRE integer | NO EXPIRE} | parallel_clause');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',48,'       | USING CURRENT LOGFILE | UNTIL CHANGE integer');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',49,'       | THROUGH {[THREAD integer] SEQUENCE integer');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',50,'                 | ALL ARCHIVELOG  | {ALL | LAST | NEXT } SWITCHOVER} ]...');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',51,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',52,' where the cancel_clause has the following syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',53,'   CANCEL [IMMEDIATE] [WAIT | NOWAIT]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',54,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',55,' where the finish_clause has the following syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',56,'   [DISCONNECT [FROM SESSION]] [parallel_clause]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',57,'   FINISH [SKIP [STANDBY LOGFILE]] [WAIT | NOWAIT]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',58,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',59,' where the parallel_clause has the following syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',60,'   {NOPARALLEL | PARALLEL [integer] }');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RECOVER',61,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REMARK',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REMARK',2,' REMARK');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REMARK',3,' ------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REMARK',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REMARK',5,' Begins a comment in a script. SQL*Plus does not interpret the comment');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REMARK',6,' as a command.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REMARK',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REMARK',8,' REM[ARK]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REMARK',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',2,' REPFOOTER');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',3,' ---------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',5,' Places and formats a footer at the bottom of a report, or lists the');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',6,' REPFOOTER definition.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',8,' REPF[OOTER] [PAGE] [printspec [text|variable] ...] | [OFF|ON]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',10,' where printspec represents one or more of the following clauses:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',11,'     COL n          LE[FT]        BOLD');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',12,'     S[KIP] [n]     CE[NTER]      FORMAT text');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',13,'     TAB n          R[IGHT]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPFOOTER',14,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPHEADER',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPHEADER',2,' REPHEADER');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPHEADER',3,' ---------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPHEADER',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPHEADER',5,' Places and formats a header at the top of a report, or lists the');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPHEADER',6,' REPHEADER definition.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPHEADER',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPHEADER',8,' REPH[EADER] [PAGE] [printspec [text|variable] ...] | [OFF|ON]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPHEADER',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPHEADER',10,' where printspec represents one or more of the following clauses:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPHEADER',11,'     COL n          LE[FT]        BOLD');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPHEADER',12,'     S[KIP] [n]     CE[NTER]      FORMAT text');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPHEADER',13,'     TAB n          R[IGHT]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('REPHEADER',14,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',2,' RESERVED WORDS (SQL)');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',3,' --------------------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',5,' SQL Reserved Words have special meaning in SQL, and may not be used for');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',6,' identifier names unless enclosed in "quotes".');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',8,' An asterisk (*) indicates words are also ANSI Reserved Words.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',10,' Oracle prefixes implicitly generated schema object and subobject names');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',11,' with "SYS_". To avoid name resolution conflict, Oracle discourages you');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',12,' from prefixing your schema object and subobject names with "SYS_".');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',13,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',14,' ACCESS          DEFAULT*         INTEGER*        ONLINE          START');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',15,' ADD*            DELETE*          INTERSECT*      OPTION*         SUCCESSFUL');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',16,' ALL*            DESC*            INTO*           OR*             SYNONYM');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',17,' ALTER*          DISTINCT*        IS*             ORDER*          SYSDATE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',18,' AND*            DROP*            LEVEL*          PCTFREE         TABLE*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',19,' ANY*            ELSE*            LIKE*           PRIOR*          THEN*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',20,' AS*             EXCLUSIVE        LOCK            PRIVILEGES*     TO*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',21,' ASC*            EXISTS           LONG            PUBLIC*         TRIGGER');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',22,' AUDIT           FILE             MAXEXTENTS      RAW             UID');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',23,' BETWEEN*        FLOAT*           MINUS           RENAME          UNION*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',24,' BY*             FOR*             MLSLABEL        RESOURCE        UNIQUE*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',25,' CHAR*           FROM*            MODE            REVOKE*         UPDATE*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',26,' CHECK*          GRANT*           MODIFY          ROW             USER*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',27,' CLUSTER         GROUP*           NOAUDIT         ROWID           VALIDATE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',28,' COLUMN          HAVING*          NOCOMPRESS      ROWNUM          VALUES*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',29,' COMMENT         IDENTIFIED       NOT*            ROWS*           VARCHAR*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',30,' COMPRESS        IMMEDIATE*       NOWAIT          SELECT*         VARCHAR2');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',31,' CONNECT*        IN*              NULL*           SESSION*        VIEW*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',32,' CREATE*         INCREMENT        NUMBER          SET*            WHENEVER*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',33,' CURRENT*        INDEX            OF*             SHARE           WHERE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',34,' DATE*           INITIAL          OFFLINE         SIZE*           WITH*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',35,' DECIMAL*        INSERT*          ON*             SMALLINT*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (SQL)',36,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',2,' RESERVED WORDS (PL/SQL)');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',3,' -----------------------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',5,' PL/SQL Reserved Words have special meaning in PL/SQL, and may not be used');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',6,' for identifier names (unless enclosed in "quotes").');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',8,' An asterisk (*) indicates words are also SQL Reserved Words.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',10,' ALL*            DESC*           JAVA            PACKAGE         SUBTYPE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',11,' ALTER*          DISTINCT*       LEVEL*          PARTITION       SUCCESSFUL*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',12,' AND*            DO              LIKE*           PCTFREE*        SUM');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',13,' ANY*            DROP*           LIMITED         PLS_INTEGER     SYNONYM*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',14,' ARRAY           ELSE*           LOCK*           POSITIVE        SYSDATE*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',15,' AS*             ELSIF           LONG*           POSITIVEN       TABLE*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',16,' ASC*            END             LOOP            PRAGMA          THEN*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',17,' AT              EXCEPTION       MAX             PRIOR*          TIME');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',18,' AUTHID          EXCLUSIVE*      MIN             PRIVATE         TIMESTAMP');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',19,' AVG             EXECUTE         MINUS*          PROCEDURE       TIMEZONE_ABBR');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',20,' BEGIN           EXISTS*         MINUTE          PUBLIC*         TIMEZONE_HOUR');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',21,' BETWEEN*        EXIT            MLSLABEL*       RAISE           TIMEZONE_MINUTE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',22,' BINARY_INTEGER  EXTENDS         MOD             RANGE           TIMEZONE_REGION');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',23,' BODY            EXTRACT         MODE*           RAW*            TO*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',24,' BOOLEAN         FALSE           MONTH           REAL            TRIGGER*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',25,' BULK            FETCH           NATURAL         RECORD          TRUE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',26,' BY*             FLOAT*          NATURALN        REF             TYPE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',27,' CHAR*           FOR*            NEW             RELEASE         UI');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',28,' CHAR_BASE       FORALL          NEXTVAL         RETURN          UNION*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',29,' CHECK*          FROM*           NOCOPY          REVERSE         UNIQUE*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',30,' CLOSE           FUNCTION        NOT*            ROLLBACK        UPDATE*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',31,' CLUSTER*        GOTO            NOWAIT*         ROW*            USE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',32,' COALESCE        GROUP*          NULL*           ROWID*          USER*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',33,' COLLECT         HAVING*         NULLIF          ROWNUM*         VALIDATE*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',34,' COMMENT*        HEAP            NUMBER*         ROWTYPE         VALUES*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',35,' COMMIT          HOUR            NUMBER_BASE     SAVEPOINT       VARCHAR*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',36,' COMPRESS*       IF              OCIROWID        SECOND          VARCHAR2*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',37,' CONNECT*        IMMEDIATE*      OF*             SELECT*         VARIANCE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',38,' CONSTANT        IN*             ON*             SEPERATE        VIEW*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',39,' CREATE*         INDEX*          OPAQUE          SET*            WHEN');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',40,' CURRENT*        INDICATOR       OPEN            SHARE*          WHENEVER*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',41,' CURRVAL         INSERT*         OPERATOR        SMALLINT*       WHERE*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',42,' CURSOR          INTEGER*        OPTION*         SPACE           WHILE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',43,' DATE*           INTERFACE       OR*             SQL             WITH*');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',44,' DAY             INTERSECT*      ORDER*          SQLCODE         WORK');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',45,' DECIMAL*        INTERVAL        ORGANIZATION    SQLERRM         WRITE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',46,' DECLARE         INTO*           OTHERS          START*          YEAR');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',47,' DEFAULT*        IS*             OUT             STDDEV          ZONE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',48,' DELETE*         ISOLATION');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RESERVED WORDS (PL/SQL)',49,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RUN',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RUN',2,' RUN');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RUN',3,' ---');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RUN',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RUN',5,' Lists and executes the most recently executed SQL command or');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RUN',6,' PL/SQL block which is stored in the SQL buffer. The buffer has');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RUN',7,' no command history list and does not record SQL*Plus commands.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RUN',8,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RUN',9,' R[UN]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('RUN',10,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SAVE',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SAVE',2,' SAVE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SAVE',3,' ----');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SAVE',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SAVE',5,' Saves the contents of the SQL buffer in a script. The');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SAVE',6,' buffer has no command history list and does not record SQL*Plus commands.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SAVE',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SAVE',8,' SAV[E] [FILE] file_name[.ext] [CRE[ATE] | REP[LACE] | APP[END]]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SAVE',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',2,' SET');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',3,' ---');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',5,' Sets a system variable to alter the SQL*Plus environment settings');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',6,' for your current session. For example, to:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',7,'     -   set the display width for data');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',8,'     -   customize HTML formatting');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',9,'     -   enable or disable printing of column headings');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',10,'     -   set the number of lines per page');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',11,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',12,' SET system_variable value');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',13,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',14,' where system_variable and value represent one of the following clauses:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',15,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',16,'   APPI[NFO]{OFF|ON|text}                   NEWP[AGE] {1|n|NONE}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',17,'   ARRAY[SIZE] {15|n}                       NULL text');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',18,'   AUTO[COMMIT] {OFF|ON|IMM[EDIATE]|n}      NUMF[ORMAT] format');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',19,'   AUTOP[RINT] {OFF|ON}                     NUM[WIDTH] {10|n}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',20,'   AUTORECOVERY {OFF|ON}                    PAGES[IZE] {14|n}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',21,'   AUTOT[RACE] {OFF|ON|TRACE[ONLY]}         PAU[SE] {OFF|ON|text}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',22,'     [EXP[LAIN]] [STAT[ISTICS]]             RECSEP {WR[APPED]|EA[CH]|OFF}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',23,'   BLO[CKTERMINATOR] {.|c|ON|OFF}           RECSEPCHAR {_|c}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',24,'   CMDS[EP] {;|c|OFF|ON}                    SERVEROUT[PUT] {ON|OFF}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',25,'   COLSEP {_|text}                            [SIZE {n | UNLIMITED}]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',26,'   CON[CAT] {.|c|ON|OFF}                      [FOR[MAT]  {WRA[PPED] |');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',27,'   COPYC[OMMIT] {0|n}                          WOR[D_WRAPPED] |');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',28,'   COPYTYPECHECK {ON|OFF}                      TRU[NCATED]}]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',29,'   DEF[INE] {&|c|ON|OFF}                    SHIFT[INOUT] {VIS[IBLE] |');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',30,'   DESCRIBE [DEPTH {1|n|ALL}]                 INV[ISIBLE]}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',31,'     [LINENUM {OFF|ON}] [INDENT {OFF|ON}]   SHOW[MODE] {OFF|ON}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',32,'   ECHO {OFF|ON}                            SQLBL[ANKLINES] {OFF|ON}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',33,'   EDITF[ILE] file_name[.ext]               SQLC[ASE] {MIX[ED] |');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',34,'   EMB[EDDED] {OFF|ON}                        LO[WER] | UP[PER]}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',35,'   ERRORL[OGGING] {ON|OFF}                  SQLCO[NTINUE] {> | text}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',36,'     [TABLE [schema.]tablename]             SQLN[UMBER] {ON|OFF}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',37,'     [TRUNCATE] [IDENTIFIER identifier]     SQLPLUSCOMPAT[IBILITY] {x.y[.z]}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',38,'   ESC[APE] {\|c|OFF|ON}                    SQLPRE[FIX] {#|c}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',39,'   ESCCHAR {@|?|%|$|OFF}                    SQLP[ROMPT] {SQL>|text}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',40,'   EXITC[OMMIT] {ON|OFF}                    SQLT[ERMINATOR] {;|c|ON|OFF}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',41,'   FEED[BACK] {6|n|ON|OFF}                  SUF[FIX] {SQL|text}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',42,'   FLAGGER {OFF|ENTRY|INTERMED[IATE]|FULL}  TAB {ON|OFF}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',43,'   FLU[SH] {ON|OFF}                         TERM[OUT] {ON|OFF}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',44,'   HEA[DING] {ON|OFF}                       TI[ME] {OFF|ON}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',45,'   HEADS[EP] {||c|ON|OFF}                   TIMI[NG] {OFF|ON}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',46,'   INSTANCE [instance_path|LOCAL]           TRIM[OUT] {ON|OFF}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',47,'   LIN[ESIZE] {80|n}                        TRIMS[POOL] {OFF|ON}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',48,'   LOBOF[FSET] {1|n}                        UND[ERLINE] {-|c|ON|OFF}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',49,'   LOGSOURCE [pathname]                     VER[IFY] {ON|OFF}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',50,'   LONG {80|n}                              WRA[P] {ON|OFF}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',51,'   LONGC[HUNKSIZE] {80|n}                   XQUERY {BASEURI text|');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',52,'   MARK[UP] HTML [OFF|ON]                     ORDERING{UNORDERED|');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',53,'     [HEAD text] [BODY text] [TABLE text]              ORDERED|DEFAULT}|');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',54,'     [ENTMAP {ON|OFF}]                        NODE{BYVALUE|BYREFERENCE|');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',55,'     [SPOOL {OFF|ON}]                              DEFAULT}|');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',56,'     [PRE[FORMAT] {OFF|ON}]                   CONTEXT text}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SET',57,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',2,' SHOW');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',3,' ----');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',5,' Shows the value of a SQL*Plus system variable, or the current');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',6,' SQL*Plus environment. SHOW SGA requires a DBA privileged login.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',8,' SHO[W] option');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',10,' where option represents one of the following terms or clauses:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',11,'     system_variable');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',12,'     ALL');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',13,'     BTI[TLE]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',14,'     ERR[ORS] [{FUNCTION | PROCEDURE | PACKAGE | PACKAGE BODY | TRIGGER');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',15,'        | VIEW | TYPE | TYPE BODY | DIMENSION | JAVA CLASS} [schema.]name]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',16,'     LNO');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',17,'     PARAMETERS [parameter_name]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',18,'     PNO');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',19,'     RECYC[LEBIN] [original_name]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',20,'     REL[EASE]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',21,'     REPF[OOTER]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',22,'     REPH[EADER]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',23,'     SGA');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',24,'     SPOO[L]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',25,'     SPPARAMETERS [parameter_name]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',26,'     SQLCODE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',27,'     TT[ITLE]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',28,'     USER');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHOW',29,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHUTDOWN',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHUTDOWN',2,' SHUTDOWN');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHUTDOWN',3,' --------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHUTDOWN',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHUTDOWN',5,' Shuts down a currently running Oracle Database instance, optionally');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHUTDOWN',6,' closing and dismounting a database.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHUTDOWN',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHUTDOWN',8,' SHUTDOWN [ABORT|IMMEDIATE|NORMAL|TRANSACTIONAL [LOCAL]]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SHUTDOWN',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SPOOL',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SPOOL',2,' SPOOL');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SPOOL',3,' -----');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SPOOL',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SPOOL',5,' Stores query results in a file, or optionally sends the file to a printer.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SPOOL',6,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SPOOL',7,' SPO[OL] [file_name[.ext] [CRE[ATE] | REP[LACE] | APP[END]] | OFF | OUT]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SPOOL',8,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',2,' SQLPLUS');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',3,' -------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',5,' Starts SQL*Plus from the operating system prompt.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',6,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',7,' SQLPLUS [ [option] [logon|/NOLOG] [start] ]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',8,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',9,' where option has the following syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',10,'     -H[ELP]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',11,'     | -V[ERSION]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',12,'     | [[-C[OMPATIBILITY] x.y[.z]] [-L[OGON]]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',13,'        [-M[ARKUP] markup_option] [-R[ESTRICT] {1|2|3}] [-S[ILENT]]]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',14,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',15,' and where markup_option has the following syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',16,'     HTML [ON|OFF] [HEAD text] [BODY text] [TABLE text]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',17,'          [ENTMAP {ON|OFF}] [SPOOL {ON|OFF}] [PRE[FORMAT] {ON|OFF}]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',18,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',19,' and where logon has the following syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',20,'     {username[/password][@connect_identifier] | /}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',21,'     [AS {SYSOPER|SYSDBA|SYSASM}] [edition=value]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',22,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',23,' and where start has the following syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',24,'     @{url|filename[.ext]} [arg ...]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('SQLPLUS',25,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('START',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('START',2,' START');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('START',3,' -----');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('START',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('START',5,' Runs the SQL*Plus statements in the specified script. The script can be');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('START',6,' called from the local file system or a web server.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('START',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('START',8,' STA[RT] {url|file_name[.ext]} [arg ...]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('START',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('START',10,' where url supports HTTP and FTP protocols in the form:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('START',11,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('START',12,'    http://host.domain/script.sql');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('START',13,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STARTUP',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STARTUP',2,' STARTUP');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STARTUP',3,' -------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STARTUP',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STARTUP',5,' Starts an Oracle instance with several options, including mounting,');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STARTUP',6,' and opening a database.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STARTUP',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STARTUP',8,' STARTUP options | upgrade_options');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STARTUP',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STARTUP',10,' where options has the following syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STARTUP',11,'    [FORCE] [RESTRICT] [PFILE=filename] [QUIET] [ MOUNT [dbname] |');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STARTUP',12,'    [ OPEN [open_options] [dbname] ] |');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STARTUP',13,'    NOMOUNT ]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STARTUP',14,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STARTUP',15,' where open_options has the following syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STARTUP',16,'    READ {ONLY | WRITE [RECOVER]} | RECOVER');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STARTUP',17,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STARTUP',18,' and where upgrade_options has the following syntax:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STARTUP',19,'    [PFILE=filename] {UPGRADE | DOWNGRADE} [QUIET]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STARTUP',20,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STORE',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STORE',2,' STORE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STORE',3,' -----');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STORE',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STORE',5,' Saves attributes of the current SQL*Plus environment in a script.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STORE',6,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STORE',7,' STORE {SET} file_name[.ext] [CRE[ATE] | REP[LACE] | APP[END]]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('STORE',8,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TIMING',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TIMING',2,' TIMING');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TIMING',3,' ------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TIMING',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TIMING',5,' Records timing data for an elapsed time period, lists the current');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TIMING',6,' timer''s name and timing data, or lists the number of active timers.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TIMING',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TIMING',8,' TIMI[NG] [START text|SHOW|STOP]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TIMING',9,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TTITLE',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TTITLE',2,' TTITLE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TTITLE',3,' ------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TTITLE',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TTITLE',5,' Places and formats a title at the top of each report page.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TTITLE',6,' Enter TTITLE with no clause to list its current definition.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TTITLE',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TTITLE',8,' The old form of TTITLE is used if only a single word or');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TTITLE',9,' a string in quotes follows the TTITLE command.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TTITLE',10,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TTITLE',11,' TTI[TLE] [printspec [text|variable] ...] | [OFF|ON]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TTITLE',12,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TTITLE',13,' where printspec represents one or more of the following clauses:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TTITLE',14,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TTITLE',15,'     COL n          LE[FT]        BOLD');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TTITLE',16,'     S[KIP] [n]     CE[NTER]      FORMAT text');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TTITLE',17,'     TAB n          R[IGHT]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TTITLE',18,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('UNDEFINE',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('UNDEFINE',2,' UNDEFINE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('UNDEFINE',3,' --------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('UNDEFINE',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('UNDEFINE',5,' Deletes one or more substitution variables that you defined either');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('UNDEFINE',6,' explicitly (with the DEFINE command), or implicitly (with a START');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('UNDEFINE',7,' command argument).');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('UNDEFINE',8,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('UNDEFINE',9,' UNDEF[INE] variable ...');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('UNDEFINE',10,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('VARIABLE',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('VARIABLE',2,' VARIABLE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('VARIABLE',3,' --------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('VARIABLE',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('VARIABLE',5,' Declares a bind variable that can be referenced in PL/SQL, or');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('VARIABLE',6,' lists the current display characteristics for a single variable');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('VARIABLE',7,' or all variables.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('VARIABLE',8,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('VARIABLE',9,'VAR[IABLE] [variable [type]]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('VARIABLE',10,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('VARIABLE',11,' where type represents one of the following:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('VARIABLE',12,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('VARIABLE',13,'     NUMBER         CHAR          CHAR (n [CHAR|BYTE])');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('VARIABLE',14,'     NCHAR          NCHAR (n)     VARCHAR2 (n [CHAR|BYTE])');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('VARIABLE',15,'     NVARCHAR2 (n)  CLOB          NCLOB');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('VARIABLE',16,'     REFCURSOR      BINARY_FLOAT  BINARY_DOUBLE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('VARIABLE',17,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('WHENEVER OSERROR',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('WHENEVER OSERROR',2,' WHENEVER OSERROR');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('WHENEVER OSERROR',3,' ----------------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('WHENEVER OSERROR',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('WHENEVER OSERROR',5,' Performs the specified action (exits SQL*Plus by default) if an');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('WHENEVER OSERROR',6,' operating system error occurs (such as a file writing error).');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('WHENEVER OSERROR',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('WHENEVER OSERROR',8,' WHENEVER OSERROR {EXIT [SUCCESS|FAILURE|n|variable|:BindVariable]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('WHENEVER OSERROR',9,'                   [COMMIT|ROLLBACK] | CONTINUE [COMMIT|ROLLBACK|NONE]}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('WHENEVER OSERROR',10,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('WHENEVER SQLERROR',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('WHENEVER SQLERROR',2,' WHENEVER SQLERROR');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('WHENEVER SQLERROR',3,' -----------------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('WHENEVER SQLERROR',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('WHENEVER SQLERROR',5,' Performs the specified action (exits SQL*Plus by default) if a');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('WHENEVER SQLERROR',6,' SQL command or PL/SQL block generates an error.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('WHENEVER SQLERROR',7,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('WHENEVER SQLERROR',8,' WHENEVER SQLERROR {EXIT [SUCCESS|FAILURE|WARNING|n|variable|:BindVariable]');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('WHENEVER SQLERROR',9,'                    [COMMIT|ROLLBACK] | CONTINUE [COMMIT|ROLLBACK|NONE]}');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('WHENEVER SQLERROR',10,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('XQUERY',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('XQUERY',2,' XQUERY');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('XQUERY',3,' ------');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('XQUERY',4,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('XQUERY',5,' Performs an XQuery 1.0 query on a specified database. Attempting to use');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('XQUERY',6,' XQUERY on a database earlier than Oracle Database 10g (Release 2) generates');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('XQUERY',7,' an error.');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('XQUERY',8,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('XQUERY',9,' XQUERY xquery_statement');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('XQUERY',10,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',1,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',2,' Help is available on the following topics:');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',3,null);
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',11,'/');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',12,'@');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',13,'@@');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',14,'ACCEPT');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',15,'APPEND');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',16,'ARCHIVE LOG');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',17,'ATTRIBUTE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',18,'BREAK');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',19,'BTITLE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',20,'CHANGE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',21,'CLEAR');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',22,'COLUMN');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',23,'COMPUTE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',24,'CONNECT');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',25,'COPY');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',26,'DEFINE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',27,'DEL');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',28,'DESCRIBE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',29,'DISCONNECT');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',30,'EDIT');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',31,'EXECUTE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',32,'EXIT');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',33,'GET');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',34,'HELP');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',35,'HOST');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',36,'INDEX');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',37,'INPUT');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',38,'LIST');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',39,'MENU');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',40,'PASSWORD');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',41,'PAUSE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',42,'PRINT');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',43,'PROMPT');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',44,'QUIT');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',45,'RECOVER');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',46,'REMARK');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',47,'REPFOOTER');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',48,'REPHEADER');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',49,'RESERVED WORDS (PL/SQL)');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',50,'RESERVED WORDS (SQL)');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',51,'RUN');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',52,'SAVE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',53,'SET');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',54,'SHOW');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',55,'SHUTDOWN');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',56,'SPOOL');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',57,'SQLPLUS');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',58,'START');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',59,'STARTUP');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',60,'STORE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',61,'TIMING');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',62,'TOPICS');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',63,'TTITLE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',64,'UNDEFINE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',65,'VARIABLE');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',66,'WHENEVER OSERROR');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',67,'WHENEVER SQLERROR');
Insert into SYSTEM.HELP (TOPIC,SEQ,INFO) values ('TOPICS',68,'XQUERY');
REM INSERTING into SYSTEM.LOGMNRC_DBNAME_UID_MAP
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNRC_GSBA
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNRC_GSII
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNRC_GTCS
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNRC_GTLO
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNRP_CTAS_PART_MAP
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNRT_MDDL$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_AGE_SPILL$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_ATTRCOL$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_ATTRIBUTE$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_CCOL$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_CDEF$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_COL$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_COLTYPE$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_DICTIONARY$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_DICTSTATE$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_ENC$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_ERROR$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_FILTER$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_GLOBAL$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_GT_TAB_INCLUDE$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_GT_USER_INCLUDE$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_GT_XID_INCLUDE$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_ICOL$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_IND$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_INDCOMPART$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_INDPART$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_INDSUBPART$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_INTEGRATED_SPILL$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_KOPM$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_LOB$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_LOBFRAG$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_LOG$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_LOGMNR_BUILDLOG
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_NTAB$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_OBJ$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_OPQTYPE$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_PARAMETER$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_PARTOBJ$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_PROCESSED_LOG$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_PROPS$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_REFCON$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_RESTART_CKPT$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_RESTART_CKPT_TXINFO$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_SEED$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_SESSION$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_SESSION_ACTIONS$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_SESSION_EVOLVE$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_SPILL$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_SUBCOLTYPE$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_TAB$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_TABCOMPART$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_TABPART$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_TABSUBPART$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_TS$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_TYPE$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_UID$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGMNR_USER$
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGSTDBY$APPLY_MILESTONE
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGSTDBY$APPLY_PROGRESS
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGSTDBY$EDS_TABLES
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGSTDBY$EVENTS
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGSTDBY$FLASHBACK_SCN
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGSTDBY$HISTORY
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGSTDBY$PARAMETERS
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGSTDBY$PLSQL
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGSTDBY$SCN
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGSTDBY$SKIP
SET DEFINE OFF;
REM INSERTING into SYSTEM.LOGSTDBY$SKIP_SUPPORT
SET DEFINE OFF;
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'APEX_040000',1,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (2,'DML',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (6,'DML',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (7,'DML',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (4,'CLUSTER',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (5,'CLUSTER',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (8,'CLUSTER',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (86,'CLUSTER',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (177,'CONTEXT',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (178,'CONTEXT',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (32,'DATABASE LINK',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (33,'DATABASE LINK',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (225,'DATABASE LINK',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (174,'DIMENSION',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (175,'DIMENSION',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (176,'DIMENSION',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (157,'DIRECTORY',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (158,'DIRECTORY',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (9,'INDEX',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (11,'INDEX',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (10,'INDEX',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (24,'PROCEDURE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (25,'PROCEDURE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (68,'PROCEDURE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (91,'PROCEDURE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (92,'PROCEDURE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (93,'PROCEDURE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (94,'PROCEDURE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (95,'PROCEDURE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (96,'PROCEDURE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (97,'PROCEDURE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (98,'PROCEDURE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (99,'PROCEDURE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (159,'PROCEDURE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (196,'PROCEDURE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (84,'PROCEDURE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (65,'PROFILE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (67,'PROFILE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (66,'PROFILE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (52,'ROLE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (79,'ROLE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (54,'ROLE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (55,'ROLE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (36,'ROLLBACK STATEMENT',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (37,'ROLLBACK STATEMENT',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (38,'ROLLBACK STATEMENT',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (13,'SEQUENCE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (14,'SEQUENCE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (16,'SEQUENCE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (19,'SYNONYM',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (20,'SYNONYM',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (110,'SYNONYM',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (111,'SYNONYM',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (1,'TABLE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (15,'TABLE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (12,'TABLE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (85,'TABLE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (39,'TABLESPACE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (40,'TABLESPACE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (41,'TABLESPACE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (59,'TRIGGER',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (60,'TRIGGER',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (61,'TRIGGER',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (118,'TRIGGER',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (119,'TRIGGER',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (120,'TRIGGER',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (121,'TRIGGER',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (77,'TYPE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (78,'TYPE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (80,'TYPE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (81,'TYPE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (82,'TYPE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (83,'TYPE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (51,'USER',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (43,'USER',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (53,'USER',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (21,'VIEW',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (22,'VIEW',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (17,'GRANT',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (18,'REVOKE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (30,'AUDIT',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (31,'AUDIT',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (212,'EDITION',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (213,'EDITION',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (214,'EDITION',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (160,'JAVA',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (161,'JAVA',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (162,'JAVA',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (1000000,'PL/SQL',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (1000001,'PL/SQL_DDL',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'ADAMS',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'ANONYMOUS',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'APPQOSSYS',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'BI',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'BLAKE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'CLARK',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'CTXSYS',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'DIP',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'DBSNMP',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'DMSYS',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'EXDSYS',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'EXFSYS',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'HR',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'IX',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'JONES',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'LBACSYS',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'MDDATA',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'MDSYS',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'MGMT_VIEW',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'MTSSYS',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'ODM',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'ODM_MTR',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'OE',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'OLAPSYS',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'ORACLE_OCM',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'ORDDATA',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'ORDPLUGINS',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'ORDSYS',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'OUTLN',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'PM',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'SCOTT',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'SI_INFORMTN_SCHEMA',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (-1,'SH',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'SYS',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'SYSTEM',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'SYSMAN',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'TSMSYS',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'WKPROXY',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'WKSYS',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'WK_TEST',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'WMSYS',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'XDB',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'XS$NULL',0,null,null,null);
Insert into SYSTEM.LOGSTDBY$SKIP_SUPPORT (ACTION,NAME,REG,SPARE1,SPARE2,SPARE3) values (0,'XTISYS',0,null,null,null);
REM INSERTING into SYSTEM.LOGSTDBY$SKIP_TRANSACTION
SET DEFINE OFF;
REM INSERTING into SYSTEM.MVIEW$_ADV_AJG
SET DEFINE OFF;
REM INSERTING into SYSTEM.MVIEW$_ADV_BASETABLE
SET DEFINE OFF;
REM INSERTING into SYSTEM.MVIEW$_ADV_CLIQUE
SET DEFINE OFF;
REM INSERTING into SYSTEM.MVIEW$_ADV_ELIGIBLE
SET DEFINE OFF;
REM INSERTING into SYSTEM.MVIEW$_ADV_EXCEPTIONS
SET DEFINE OFF;
REM INSERTING into SYSTEM.MVIEW$_ADV_FILTER
SET DEFINE OFF;
REM INSERTING into SYSTEM.MVIEW$_ADV_FILTERINSTANCE
SET DEFINE OFF;
REM INSERTING into SYSTEM.MVIEW$_ADV_FJG
SET DEFINE OFF;
REM INSERTING into SYSTEM.MVIEW$_ADV_GC
SET DEFINE OFF;
REM INSERTING into SYSTEM.MVIEW$_ADV_INFO
SET DEFINE OFF;
REM INSERTING into SYSTEM.MVIEW$_ADV_JOURNAL
SET DEFINE OFF;
REM INSERTING into SYSTEM.MVIEW$_ADV_LEVEL
SET DEFINE OFF;
REM INSERTING into SYSTEM.MVIEW$_ADV_LOG
SET DEFINE OFF;
REM INSERTING into SYSTEM.MVIEW$_ADV_OUTPUT
SET DEFINE OFF;
REM INSERTING into SYSTEM.MVIEW$_ADV_PARAMETERS
SET DEFINE OFF;
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_EXACT_DELETE',0,null,null,0.02);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_EXACT_BUCKETS',0,null,null,1000);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_PARTIAL_DELETE',0,null,null,0.02);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_PARTIAL_BUCKETS',0,null,null,1000);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_AJG_DELETE',0,null,null,0.02);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_AJG_BUCKETS',0,null,null,100);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_FJG_DELETE',0,null,null,0.02);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_GC_DELETE',0,null,null,0.02);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_MEA_DELETE',0,null,null,0.05);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_TRACE_LEVEL',0,null,null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMSS_REWRITE_NRF',0,null,null,10);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.console_output',1,'True',null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.wip_interval',0,null,null,250);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.commit_interval',0,null,null,100);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.sql_exclusions',1,'SYSTEM.%',null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.pretty',1,'True',null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.lcase_names',1,'True',null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.lcase_keywords',1,'False',null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.add_alias',1,'False',null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.ignore_ambig',1,'True',null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.fixup_alias',1,'False',null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.optimize',1,'True',null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.ignore_columns',1,'True',null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.fixup_schema',1,'False',null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.remove_optional_keywords',1,'False',null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.dump_tree',1,'True',null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.debug_flags',1,null,null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.datetime_mask',1,'dd/MM/yyyy HH:mm',null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMAE_MIN_CLQ_MF_RATIO',0,null,null,0.05);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMAE_MIN_SUM_BC_RATIO',0,null,null,0.05);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMAE_MAX_GCS',0,null,null,1000);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMAE_PCT_COMPL_POLL_INTL',0,null,null,10);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMAE_TRACE_LEVEL',0,null,null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMAE_AEP_MAX_LAT_SIZE',0,null,null,1024);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('QSMAE_AEP_MAX_FACT_TABLES',0,null,null,10);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.report.color1',1,'#FFFFDE',null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.report.color2',1,'#336699',null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.report.color3',1,'#FFCC60',null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.report.color4',1,'white',null,0);
Insert into SYSTEM.MVIEW$_ADV_PARAMETERS (PARAMETER_NAME,PARAMETER_TYPE,STRING_VALUE,DATE_VALUE,NUMERICAL_VALUE) values ('qsma.report.include_unused',1,'False',null,0);
REM INSERTING into SYSTEM.MVIEW$_ADV_PLAN
SET DEFINE OFF;
REM INSERTING into SYSTEM.MVIEW$_ADV_PRETTY
SET DEFINE OFF;
REM INSERTING into SYSTEM.MVIEW$_ADV_ROLLUP
SET DEFINE OFF;
REM INSERTING into SYSTEM.MVIEW$_ADV_SQLDEPEND
SET DEFINE OFF;
REM INSERTING into SYSTEM.MVIEW$_ADV_TEMP
SET DEFINE OFF;
REM INSERTING into SYSTEM.MVIEW$_ADV_WORKLOAD
SET DEFINE OFF;
REM INSERTING into SYSTEM.OL$
SET DEFINE OFF;
REM INSERTING into SYSTEM.OL$HINTS
SET DEFINE OFF;
REM INSERTING into SYSTEM.OL$NODES
SET DEFINE OFF;
REM INSERTING into SYSTEM.PERSONA
SET DEFINE OFF;
Insert into SYSTEM.PERSONA (IDCONTACT,NAME,LASTNAME,GENDER,BIRDTDATE) values (1,'Antonio','Caceres','Masculino',to_date('12-JUN-90','DD-MON-RR'));
REM INSERTING into SYSTEM.REPCAT$_AUDIT_ATTRIBUTE
SET DEFINE OFF;
Insert into SYSTEM.REPCAT$_AUDIT_ATTRIBUTE (ATTRIBUTE,DATA_TYPE_ID,DATA_LENGTH,SOURCE) values ('TIMESTAMP',3,null,'SYSDATE');
Insert into SYSTEM.REPCAT$_AUDIT_ATTRIBUTE (ATTRIBUTE,DATA_TYPE_ID,DATA_LENGTH,SOURCE) values ('GLOBAL NAME',2,128,'DBMS_REPUTIL.GLOBAL_NAME');
REM INSERTING into SYSTEM.REPCAT$_AUDIT_COLUMN
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_COLUMN_GROUP
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_CONFLICT
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_DDL
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_EXCEPTIONS
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_EXTENSION
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_FLAVORS
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_FLAVOR_OBJECTS
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_GENERATED
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_GROUPED_COLUMN
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_INSTANTIATION_DDL
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_KEY_COLUMNS
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_OBJECT_PARMS
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_OBJECT_TYPES
SET DEFINE OFF;
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1017,'GENERATED DDL','02',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1016,'DUMMY MATERIALIZED VIEW','02',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1015,'UPDATABLE MATERIALIZED VIEW LOG','02',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1014,'REFRESH GROUP','02',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1013,'SYNCHRONOUS MASTER REPGROUP','02',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1012,'ASYNCHRONOUS MASTER REPGROUP','02',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1011,'TEMPORARY TABLE','02',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1005,'SYNCHRONOUS UPDATABLE TABLE','02',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1004,'ASYNCHRONOUS UPDATABLE TABLE','00',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1003,'READ ONLY TABLE','02',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1002,'SITEOWNER','02',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1001,'USER','02',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-5,'DATABASE LINK','01',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (-1,'MATERIALIZED VIEW','01',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (1,'INDEX','01',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (2,'TABLE','01',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (4,'VIEW','03',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (5,'SYNONYM','01',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (6,'SEQUENCE','03',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (7,'PROCEDURE','03',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (8,'FUNCTION','03',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (9,'PACKAGE','03',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (10,'PACKAGE BODY','01',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (12,'TRIGGER','01',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (13,'TYPE','03',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (14,'TYPE BODY','01',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (32,'INDEX TYPE','01',null);
Insert into SYSTEM.REPCAT$_OBJECT_TYPES (OBJECT_TYPE_ID,OBJECT_TYPE_NAME,FLAGS,SPARE1) values (33,'OPERATOR','01',null);
REM INSERTING into SYSTEM.REPCAT$_PARAMETER_COLUMN
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_PRIORITY
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_PRIORITY_GROUP
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_REFRESH_TEMPLATES
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_REPCAT
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_REPCATLOG
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_REPCOLUMN
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_REPGROUP_PRIVS
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_REPOBJECT
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_REPPROP
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_REPSCHEMA
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_RESOLUTION
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_RESOLUTION_METHOD
SET DEFINE OFF;
Insert into SYSTEM.REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'ADDITIVE');
Insert into SYSTEM.REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'AVERAGE');
Insert into SYSTEM.REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'DISCARD');
Insert into SYSTEM.REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'EARLIEST TIMESTAMP');
Insert into SYSTEM.REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'LATEST TIMESTAMP');
Insert into SYSTEM.REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'MAXIMUM');
Insert into SYSTEM.REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'MINIMUM');
Insert into SYSTEM.REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'OVERWRITE');
Insert into SYSTEM.REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'PRIORITY GROUP');
Insert into SYSTEM.REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'SITE PRIORITY');
Insert into SYSTEM.REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'USER FLAVOR FUNCTION');
Insert into SYSTEM.REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (1,'USER FUNCTION');
Insert into SYSTEM.REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (2,'APPEND SEQUENCE');
Insert into SYSTEM.REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (2,'APPEND SITE NAME');
Insert into SYSTEM.REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (2,'DISCARD');
Insert into SYSTEM.REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (2,'USER FLAVOR FUNCTION');
Insert into SYSTEM.REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (2,'USER FUNCTION');
Insert into SYSTEM.REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (3,'USER FLAVOR FUNCTION');
Insert into SYSTEM.REPCAT$_RESOLUTION_METHOD (CONFLICT_TYPE_ID,METHOD_NAME) values (3,'USER FUNCTION');
REM INSERTING into SYSTEM.REPCAT$_RESOLUTION_STATISTICS
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_RESOL_STATS_CONTROL
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_RUNTIME_PARMS
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_SITES_NEW
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_SITE_OBJECTS
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_SNAPGROUP
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_TEMPLATE_OBJECTS
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_TEMPLATE_PARMS
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_TEMPLATE_REFGROUPS
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_TEMPLATE_SITES
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_TEMPLATE_STATUS
SET DEFINE OFF;
Insert into SYSTEM.REPCAT$_TEMPLATE_STATUS (TEMPLATE_STATUS_ID,STATUS_TYPE_NAME) values (0,'Modifiable');
Insert into SYSTEM.REPCAT$_TEMPLATE_STATUS (TEMPLATE_STATUS_ID,STATUS_TYPE_NAME) values (1,'Frozen');
Insert into SYSTEM.REPCAT$_TEMPLATE_STATUS (TEMPLATE_STATUS_ID,STATUS_TYPE_NAME) values (2,'Deleted');
REM INSERTING into SYSTEM.REPCAT$_TEMPLATE_TARGETS
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_TEMPLATE_TYPES
SET DEFINE OFF;
Insert into SYSTEM.REPCAT$_TEMPLATE_TYPES (TEMPLATE_TYPE_ID,TEMPLATE_DESCRIPTION,FLAGS,SPARE1) values (1,'Deployment template','01',null);
Insert into SYSTEM.REPCAT$_TEMPLATE_TYPES (TEMPLATE_TYPE_ID,TEMPLATE_DESCRIPTION,FLAGS,SPARE1) values (2,'IAS template','02',null);
REM INSERTING into SYSTEM.REPCAT$_USER_AUTHORIZATIONS
SET DEFINE OFF;
REM INSERTING into SYSTEM.REPCAT$_USER_PARM_VALUES
SET DEFINE OFF;
REM INSERTING into SYSTEM.RESTRIG
SET DEFINE OFF;
REM INSERTING into SYSTEM.SQLPLUS_PRODUCT_PROFILE
SET DEFINE OFF;
REM INSERTING into SYSTEM.TELEFONO
SET DEFINE OFF;
Insert into SYSTEM.TELEFONO (IDCONTACT,PHONENUMBER,PHONETYPE) values (1,'68599301','Movil');
--------------------------------------------------------
--  DDL for Index REPCAT$_SITES_NEW_FK1_IDX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_SITES_NEW_FK1_IDX" ON "SYSTEM"."REPCAT$_SITES_NEW" ("EXTENSION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_PRIORITY_F1_IDX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_PRIORITY_F1_IDX" ON "SYSTEM"."REPCAT$_PRIORITY" ("PRIORITY_GROUP", "SNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPCATLOG_PRIMARY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_REPCATLOG_PRIMARY" ON "SYSTEM"."REPCAT$_REPCATLOG" ("ID", "SOURCE", "ROLE", "MASTER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index TEMPLATE$_TARGETS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."TEMPLATE$_TARGETS_PK" ON "SYSTEM"."REPCAT$_TEMPLATE_TARGETS" ("TEMPLATE_TARGET_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_AGE_SPILL$_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGMNR_AGE_SPILL$_PK" ON "SYSTEM"."LOGMNR_AGE_SPILL$" ("SESSION#", "XIDUSN", "XIDSLT", "XIDSQN", "CHUNK", "SEQUENCE#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_RESOLUTION_STATS_N1
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_RESOLUTION_STATS_N1" ON "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS" ("SNAME", "ONAME", "RESOLVED_DATE", "CONFLICT_TYPE_ID", "REFERENCE_NAME", "METHOD_NAME", "FUNCTION_NAME", "PRIORITY_GROUP") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MVIEW$_ADV_AJG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."MVIEW$_ADV_AJG_PK" ON "SYSTEM"."MVIEW$_ADV_AJG" ("AJGID#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1USER$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1USER$" ON "SYSTEM"."LOGMNR_USER$" ("LOGMNR_UID", "USER#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index REPCAT$_EXCEPTIONS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_EXCEPTIONS_PK" ON "SYSTEM"."REPCAT$_EXCEPTIONS" ("EXCEPTION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1PROPS$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1PROPS$" ON "SYSTEM"."LOGMNR_PROPS$" ("LOGMNR_UID", "NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index MVIEW$_ADV_CLIQUE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."MVIEW$_ADV_CLIQUE_PK" ON "SYSTEM"."MVIEW$_ADV_CLIQUE" ("CLIQUEID#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_FLAVORS_UNQ1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_FLAVORS_UNQ1" ON "SYSTEM"."REPCAT$_FLAVORS" ("GNAME", "FLAVOR_ID", "GOWNER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I2INDPART$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I2INDPART$" ON "SYSTEM"."LOGMNR_INDPART$" ("LOGMNR_UID", "BO#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index UNQ_PAIRS
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."UNQ_PAIRS" ON "SYSTEM"."AQ$_INTERNET_AGENT_PRIVS" ("AGENT_NAME", "DB_USERNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_AUDIT_COLUMN_F2_IDX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_AUDIT_COLUMN_F2_IDX" ON "SYSTEM"."REPCAT$_AUDIT_COLUMN" ("BASE_SNAME", "BASE_ONAME", "BASE_CONFLICT_TYPE_ID", "BASE_REFERENCE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index HELP_TOPIC_SEQ
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."HELP_TOPIC_SEQ" ON "SYSTEM"."HELP" ("TOPIC", "SEQ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 16384 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index DIRECCION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."DIRECCION_PK" ON "SYSTEM"."DIRECCION" ("IDCONTACT", "ADDRESS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_TEMPLATE_PARMS_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_TEMPLATE_PARMS_U1" ON "SYSTEM"."REPCAT$_TEMPLATE_PARMS" ("REFRESH_TEMPLATE_ID", "PARAMETER_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPGROUP_PRIVS_UK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_REPGROUP_PRIVS_UK" ON "SYSTEM"."REPCAT$_REPGROUP_PRIVS" ("USERNAME", "GNAME", "GOWNER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MVIEW$_ADV_WORKLOAD_IDX_01
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."MVIEW$_ADV_WORKLOAD_IDX_01" ON "SYSTEM"."MVIEW$_ADV_WORKLOAD" ("COLLECTIONID#", "QUERYID#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1TABCOMPART$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1TABCOMPART$" ON "SYSTEM"."LOGMNR_TABCOMPART$" ("LOGMNR_UID", "OBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REFRESH_TEMPLATES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_REFRESH_TEMPLATES_PK" ON "SYSTEM"."REPCAT$_REFRESH_TEMPLATES" ("REFRESH_TEMPLATE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MVIEW$_ADV_OUTPUT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."MVIEW$_ADV_OUTPUT_PK" ON "SYSTEM"."MVIEW$_ADV_OUTPUT" ("RUNID#", "RANK#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_FLAVORS_GNAME
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_FLAVORS_GNAME" ON "SYSTEM"."REPCAT$_FLAVORS" ("GNAME", "FNAME", "GOWNER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNRC_I2GTLO
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNRC_I2GTLO" ON "SYSTEM"."LOGMNRC_GTLO" ("LOGMNR_UID", "BASEOBJ#", "BASEOBJV#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGMNR_LOG$_FLAGS
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_LOG$_FLAGS" ON "SYSTEM"."LOGMNR_LOG$" ("FLAGS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1NTAB$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1NTAB$" ON "SYSTEM"."LOGMNR_NTAB$" ("LOGMNR_UID", "OBJ#", "INTCOL#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGMNR_SESSION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGMNR_SESSION_PK" ON "SYSTEM"."LOGMNR_SESSION$" ("SESSION#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_USER_PARM_VALUES_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_USER_PARM_VALUES_U1" ON "SYSTEM"."REPCAT$_USER_PARM_VALUES" ("TEMPLATE_PARAMETER_ID", "USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_FLAVOR_OBJECTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_FLAVOR_OBJECTS_PK" ON "SYSTEM"."REPCAT$_FLAVOR_OBJECTS" ("SNAME", "ONAME", "TYPE", "GNAME", "FLAVOR_ID", "GOWNER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_TEMPLATE_REFGROUPS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS_PK" ON "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS" ("REFRESH_GROUP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGSTDBY$EVENTS_IND
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGSTDBY$EVENTS_IND" ON "SYSTEM"."LOGSTDBY$EVENTS" ("EVENT_TIME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPSCHEMA_DEST_IDX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_REPSCHEMA_DEST_IDX" ON "SYSTEM"."REPCAT$_REPSCHEMA" ("DBLINK", "EXTENSION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPPROP_KEY_INDEX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_REPPROP_KEY_INDEX" ON "SYSTEM"."REPCAT$_REPPROP" ("RECIPIENT_KEY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_USER_AUTHORIZATIONS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_USER_AUTHORIZATIONS_PK" ON "SYSTEM"."REPCAT$_USER_AUTHORIZATIONS" ("USER_AUTHORIZATION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_SITE_OBJECTS_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_SITE_OBJECTS_U1" ON "SYSTEM"."REPCAT$_SITE_OBJECTS" ("TEMPLATE_SITE_ID", "ONAME", "OBJECT_TYPE_ID", "SNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPPROP_DBLINK_HOW
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_REPPROP_DBLINK_HOW" ON "SYSTEM"."REPCAT$_REPPROP" ("DBLINK", "HOW", "EXTENSION_ID", "RECIPIENT_KEY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNRC_GSII_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGMNRC_GSII_PK" ON "SYSTEM"."LOGMNRC_GSII" ("LOGMNR_UID", "OBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index DEF$_CALLDEST_N2
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."DEF$_CALLDEST_N2" ON "SYSTEM"."DEF$_CALLDEST" ("DBLINK", "CATCHUP") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1COLTYPE$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1COLTYPE$" ON "SYSTEM"."LOGMNR_COLTYPE$" ("LOGMNR_UID", "OBJ#", "INTCOL#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1OBJ$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1OBJ$" ON "SYSTEM"."LOGMNR_OBJ$" ("LOGMNR_UID", "OBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index DEF$_ERROR_PRIMARY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."DEF$_ERROR_PRIMARY" ON "SYSTEM"."DEF$_ERROR" ("ENQ_TID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_PRIORITY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_PRIORITY_PK" ON "SYSTEM"."REPCAT$_PRIORITY" ("SNAME", "PRIORITY_GROUP", "PRIORITY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPGROUP_PRIVS_FK_IDX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_REPGROUP_PRIVS_FK_IDX" ON "SYSTEM"."REPCAT$_REPGROUP_PRIVS" ("GNAME", "GOWNER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_TEMPLATE_PARMS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_TEMPLATE_PARMS_PK" ON "SYSTEM"."REPCAT$_TEMPLATE_PARMS" ("TEMPLATE_PARAMETER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MVIEW$_ADV_BASETABLE_IDX_01
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."MVIEW$_ADV_BASETABLE_IDX_01" ON "SYSTEM"."MVIEW$_ADV_BASETABLE" ("QUERYID#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index OL$HNT_NUM
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."OL$HNT_NUM" ON "SYSTEM"."OL$HINTS" ("OL_NAME", "HINT#") ;
--------------------------------------------------------
--  DDL for Index REPCAT$_FLAVORS_FK1_IDX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_FLAVORS_FK1_IDX" ON "SYSTEM"."REPCAT$_FLAVORS" ("GNAME", "GOWNER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_RESOLUTION_IDX2
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_RESOLUTION_IDX2" ON "SYSTEM"."REPCAT$_RESOLUTION" ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_RESOL_STATS_CTRL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_RESOL_STATS_CTRL_PK" ON "SYSTEM"."REPCAT$_RESOL_STATS_CONTROL" ("SNAME", "ONAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1INDPART$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1INDPART$" ON "SYSTEM"."LOGMNR_INDPART$" ("LOGMNR_UID", "OBJ#", "BO#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPPROP_PRNT_IDX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_REPPROP_PRNT_IDX" ON "SYSTEM"."REPCAT$_REPPROP" ("SNAME", "ONAME", "TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_PARAMETER_INDX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_PARAMETER_INDX" ON "SYSTEM"."LOGMNR_PARAMETER$" ("SESSION#", "NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_LOG$_FIRST_CHANGE#
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_LOG$_FIRST_CHANGE#" ON "SYSTEM"."LOGMNR_LOG$" ("FIRST_CHANGE#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_USER_PARM_VALUES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_USER_PARM_VALUES_PK" ON "SYSTEM"."REPCAT$_USER_PARM_VALUES" ("USER_PARAMETER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1COL$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1COL$" ON "SYSTEM"."LOGMNR_COL$" ("LOGMNR_UID", "OBJ#", "INTCOL#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1TS$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1TS$" ON "SYSTEM"."LOGMNR_TS$" ("LOGMNR_UID", "TS#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPGROUP_PRIVS_N1
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_REPGROUP_PRIVS_N1" ON "SYSTEM"."REPCAT$_REPGROUP_PRIVS" ("GLOBAL_FLAG", "USERNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_RESTART_CKPT_TXINFO$_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGMNR_RESTART_CKPT_TXINFO$_PK" ON "SYSTEM"."LOGMNR_RESTART_CKPT_TXINFO$" ("SESSION#", "XIDUSN", "XIDSLT", "XIDSQN", "SESSION_NUM", "SERIAL_NUM", "EFFECTIVE_SCN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_FLAVOR_OBJECTS_FG
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_FLAVOR_OBJECTS_FG" ON "SYSTEM"."REPCAT$_FLAVOR_OBJECTS" ("FLAVOR_ID", "GNAME", "GOWNER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNRC_I2GTCS
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNRC_I2GTCS" ON "SYSTEM"."LOGMNRC_GTCS" ("LOGMNR_UID", "OBJ#", "OBJV#", "SEGCOL#", "INTCOL#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGSTDBY$EVENTS_IND_SCN
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGSTDBY$EVENTS_IND_SCN" ON "SYSTEM"."LOGSTDBY$EVENTS" ("COMMIT_SCN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_LOG$_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGMNR_LOG$_PK" ON "SYSTEM"."LOGMNR_LOG$" ("SESSION#", "THREAD#", "SEQUENCE#", "FIRST_CHANGE#", "DB_ID", "RESETLOGS_CHANGE#", "RESET_TIMESTAMP") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I2TAB$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I2TAB$" ON "SYSTEM"."LOGMNR_TAB$" ("LOGMNR_UID", "BOBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1INDCOMPART$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1INDCOMPART$" ON "SYSTEM"."LOGMNR_INDCOMPART$" ("LOGMNR_UID", "OBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGSTDBY$EDS_TABLES_PKEY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGSTDBY$EDS_TABLES_PKEY" ON "SYSTEM"."LOGSTDBY$EDS_TABLES" ("OWNER", "TABLE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_TEMPLATE_REFGROUPS_N2
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS_N2" ON "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS" ("REFRESH_TEMPLATE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MVIEW$_ADV_PARAMETERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."MVIEW$_ADV_PARAMETERS_PK" ON "SYSTEM"."MVIEW$_ADV_PARAMETERS" ("PARAMETER_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_TEMPLATE_OBJECTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS_PK" ON "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS" ("TEMPLATE_OBJECT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_PRIORITY_GROUP_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_PRIORITY_GROUP_U1" ON "SYSTEM"."REPCAT$_PRIORITY_GROUP" ("SNAME", "PRIORITY_GROUP", "DATA_TYPE_ID", "FIXED_DATA_LENGTH") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1ATTRIBUTE$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1ATTRIBUTE$" ON "SYSTEM"."LOGMNR_ATTRIBUTE$" ("LOGMNR_UID", "TOID", "VERSION#", "ATTRIBUTE#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPCAT_PRIMARY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_REPCAT_PRIMARY" ON "SYSTEM"."REPCAT$_REPCAT" ("SNAME", "GOWNER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1PARTOBJ$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1PARTOBJ$" ON "SYSTEM"."LOGMNR_PARTOBJ$" ("LOGMNR_UID", "OBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGMNR_RESTART_CKPT$_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGMNR_RESTART_CKPT$_PK" ON "SYSTEM"."LOGMNR_RESTART_CKPT$" ("SESSION#", "CKPT_SCN", "XIDUSN", "XIDSLT", "XIDSQN", "SESSION_NUM", "SERIAL_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I3COL$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I3COL$" ON "SYSTEM"."LOGMNR_COL$" ("LOGMNR_UID", "OBJ#", "COL#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index REPCAT$_PRIORITY_GROUP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_PRIORITY_GROUP_PK" ON "SYSTEM"."REPCAT$_PRIORITY_GROUP" ("PRIORITY_GROUP", "SNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index DEF$_TRANORDER
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."DEF$_TRANORDER" ON "SYSTEM"."DEF$_AQCALL" ("CSCN", "ENQ_TID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_GENERATED_N1
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_GENERATED_N1" ON "SYSTEM"."REPCAT$_GENERATED" ("BASE_SNAME", "BASE_ONAME", "BASE_TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1CDEF$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1CDEF$" ON "SYSTEM"."LOGMNR_CDEF$" ("LOGMNR_UID", "CON#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index REPCAT$_USER_AUTHORIZATIONS_N1
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_USER_AUTHORIZATIONS_N1" ON "SYSTEM"."REPCAT$_USER_AUTHORIZATIONS" ("REFRESH_TEMPLATE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index I_REPCAT$_SNAPGROUP1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."I_REPCAT$_SNAPGROUP1" ON "SYSTEM"."REPCAT$_SNAPGROUP" ("GNAME", "DBLINK", "GOWNER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNRP_CTAS_PART_MAP_I
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNRP_CTAS_PART_MAP_I" ON "SYSTEM"."LOGMNRP_CTAS_PART_MAP" ("LOGMNR_UID", "BASEOBJ#", "BASEOBJV#", "PART#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index REPCAT$_USER_AUTHORIZATIONS_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_USER_AUTHORIZATIONS_U1" ON "SYSTEM"."REPCAT$_USER_AUTHORIZATIONS" ("USER_ID", "REFRESH_TEMPLATE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index DEF$_LOB_N1
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."DEF$_LOB_N1" ON "SYSTEM"."DEF$_LOB" ("ENQ_TID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1INDSUBPART$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1INDSUBPART$" ON "SYSTEM"."LOGMNR_INDSUBPART$" ("LOGMNR_UID", "OBJ#", "POBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index SYS_C006988
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C006988" ON "SYSTEM"."CORREO" ("IDCONTACT", "EMAILADDRESS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_SESSION_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGMNR_SESSION_UK1" ON "SYSTEM"."LOGMNR_SESSION$" ("SESSION_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_RESOLUTION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_RESOLUTION_PK" ON "SYSTEM"."REPCAT$_RESOLUTION" ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME", "SEQUENCE_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MVIEW$_ADV_LEVEL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."MVIEW$_ADV_LEVEL_PK" ON "SYSTEM"."MVIEW$_ADV_LEVEL" ("RUNID#", "LEVELID#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNRC_GTCS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGMNRC_GTCS_PK" ON "SYSTEM"."LOGMNRC_GTCS" ("LOGMNR_UID", "OBJ#", "OBJV#", "INTCOL#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGMNR_SPILL$_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGMNR_SPILL$_PK" ON "SYSTEM"."LOGMNR_SPILL$" ("SESSION#", "XIDUSN", "XIDSLT", "XIDSQN", "CHUNK", "STARTIDX", "ENDIDX", "FLAG", "SEQUENCE#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_FLAVOR_OBJECTS_FK2_IDX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_FLAVOR_OBJECTS_FK2_IDX" ON "SYSTEM"."REPCAT$_FLAVOR_OBJECTS" ("GNAME", "FLAVOR_ID", "GOWNER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_TEMPLATE_REFGROUPS_N1
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS_N1" ON "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS" ("REFRESH_GROUP_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index DEF$_CALLDEST_PRIMARY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."DEF$_CALLDEST_PRIMARY" ON "SYSTEM"."DEF$_CALLDEST" ("ENQ_TID", "DBLINK", "STEP_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPSCHEMA_PRIMARY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_REPSCHEMA_PRIMARY" ON "SYSTEM"."REPCAT$_REPSCHEMA" ("SNAME", "DBLINK", "GOWNER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_INTEG_SPILL$_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGMNR_INTEG_SPILL$_PK" ON "SYSTEM"."LOGMNR_INTEGRATED_SPILL$" ("SESSION#", "XIDUSN", "XIDSLT", "XIDSQN", "CHUNK", "FLAG") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index LOGMNRC_GTLO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGMNRC_GTLO_PK" ON "SYSTEM"."LOGMNRC_GTLO" ("LOGMNR_UID", "KEYOBJ#", "BASEOBJV#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPOBJECT_PRNT_IDX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_REPOBJECT_PRNT_IDX" ON "SYSTEM"."REPCAT$_REPOBJECT" ("GNAME", "GOWNER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_LOG$_RECID
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_LOG$_RECID" ON "SYSTEM"."LOGMNR_LOG$" ("RECID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index DEF$_PROPAGATOR_PRIMARY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."DEF$_PROPAGATOR_PRIMARY" ON "SYSTEM"."DEF$_PROPAGATOR" ("USERID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MVIEW$_ADV_PRETTY_IDX_01
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."MVIEW$_ADV_PRETTY_IDX_01" ON "SYSTEM"."MVIEW$_ADV_PRETTY" ("QUERYID#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MVIEW$_ADV_SQLDEPEND_IDX_01
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."MVIEW$_ADV_SQLDEPEND_IDX_01" ON "SYSTEM"."MVIEW$_ADV_SQLDEPEND" ("COLLECTIONID#", "FROM_ADDRESS", "FROM_HASH", "INST_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1ATTRCOL$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1ATTRCOL$" ON "SYSTEM"."LOGMNR_ATTRCOL$" ("LOGMNR_UID", "OBJ#", "INTCOL#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGMNRC_DBNAME_UID_MAP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGMNRC_DBNAME_UID_MAP_PK" ON "SYSTEM"."LOGMNRC_DBNAME_UID_MAP" ("GLOBAL_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index MVIEW$_ADV_INFO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."MVIEW$_ADV_INFO_PK" ON "SYSTEM"."MVIEW$_ADV_INFO" ("RUNID#", "SEQ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNRC_GSBA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGMNRC_GSBA_PK" ON "SYSTEM"."LOGMNRC_GSBA" ("LOGMNR_UID", "AS_OF_SCN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1IND$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1IND$" ON "SYSTEM"."LOGMNR_IND$" ("LOGMNR_UID", "OBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I2IND$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I2IND$" ON "SYSTEM"."LOGMNR_IND$" ("LOGMNR_UID", "BO#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGMNRP_CTAS_PART_MAP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGMNRP_CTAS_PART_MAP_PK" ON "SYSTEM"."LOGMNRP_CTAS_PART_MAP" ("LOGMNR_UID", "BASEOBJV#", "KEYOBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1SEED$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1SEED$" ON "SYSTEM"."LOGMNR_SEED$" ("LOGMNR_UID", "OBJ#", "INTCOL#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1ENC$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1ENC$" ON "SYSTEM"."LOGMNR_ENC$" ("LOGMNR_UID", "OBJ#", "OWNER#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGSTDBY$SKIP_IDX1
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGSTDBY$SKIP_IDX1" ON "SYSTEM"."LOGSTDBY$SKIP" ("USE_LIKE", "SCHEMA", "NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_KEY_COLUMNS_PRIMARY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_KEY_COLUMNS_PRIMARY" ON "SYSTEM"."REPCAT$_KEY_COLUMNS" ("SNAME", "ONAME", "COL") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_SESSION_ACTION$_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGMNR_SESSION_ACTION$_PK" ON "SYSTEM"."LOGMNR_SESSION_ACTIONS$" ("LOGMNRSESSION#", "ACTIONNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1TAB$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1TAB$" ON "SYSTEM"."LOGMNR_TAB$" ("LOGMNR_UID", "OBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I2OBJ$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I2OBJ$" ON "SYSTEM"."LOGMNR_OBJ$" ("LOGMNR_UID", "OID$") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index REPCAT$_TEMPLATE_SITES_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_TEMPLATE_SITES_U1" ON "SYSTEM"."REPCAT$_TEMPLATE_SITES" ("REFRESH_TEMPLATE_NAME", "USER_NAME", "SITE_NAME", "REPAPI_SITE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index I1_QUEUE_TABLES
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."I1_QUEUE_TABLES" ON "SYSTEM"."AQ$_QUEUE_TABLES" ("OBJNO", "SCHEMA", "FLAGS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_AUDIT_ATTRIBUTE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_AUDIT_ATTRIBUTE_PK" ON "SYSTEM"."REPCAT$_AUDIT_ATTRIBUTE" ("ATTRIBUTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGSTDBY$EVENTS_IND_XID
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGSTDBY$EVENTS_IND_XID" ON "SYSTEM"."LOGSTDBY$EVENTS" ("XIDUSN", "XIDSLT", "XIDSQN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index LOGMNRC_I3GTLO
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNRC_I3GTLO" ON "SYSTEM"."LOGMNRC_GTLO" ("LOGMNR_UID", "DROP_SCN") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGMNR_SESSION_EVOLVE$_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGMNR_SESSION_EVOLVE$_PK" ON "SYSTEM"."LOGMNR_SESSION_EVOLVE$" ("SESSION#", "DB_ID", "RESET_SCN", "RESET_TIMESTAMP") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_UID$_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGMNR_UID$_PK" ON "SYSTEM"."LOGMNR_UID$" ("SESSION#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_INSTANTIATION_DDL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_INSTANTIATION_DDL_PK" ON "SYSTEM"."REPCAT$_INSTANTIATION_DDL" ("REFRESH_TEMPLATE_ID", "PHASE", "DDL_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_GROUPED_COLUMN_F1_IDX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_GROUPED_COLUMN_F1_IDX" ON "SYSTEM"."REPCAT$_GROUPED_COLUMN" ("SNAME", "ONAME", "GROUP_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I2COL$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I2COL$" ON "SYSTEM"."LOGMNR_COL$" ("LOGMNR_UID", "OBJ#", "NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index REPCAT$_OBJECT_PARMS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_OBJECT_PARMS_PK" ON "SYSTEM"."REPCAT$_OBJECT_PARMS" ("TEMPLATE_PARAMETER_ID", "TEMPLATE_OBJECT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I2TABPART$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I2TABPART$" ON "SYSTEM"."LOGMNR_TABPART$" ("LOGMNR_UID", "BO#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPCOLUMN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_REPCOLUMN_PK" ON "SYSTEM"."REPCAT$_REPCOLUMN" ("SNAME", "ONAME", "TYPE", "CNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_DDL_INDEX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_DDL_INDEX" ON "SYSTEM"."REPCAT$_DDL" ("LOG_ID", "SOURCE", "ROLE", "MASTER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1LOGMNR_BUILDLOG
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1LOGMNR_BUILDLOG" ON "SYSTEM"."LOGMNR_LOGMNR_BUILDLOG" ("LOGMNR_UID", "INITIAL_XID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index DEF$_DEFAULTDEST_PRIMARY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."DEF$_DEFAULTDEST_PRIMARY" ON "SYSTEM"."DEF$_DEFAULTDEST" ("DBLINK") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1REFCON$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1REFCON$" ON "SYSTEM"."LOGMNR_REFCON$" ("LOGMNR_UID", "OBJ#", "INTCOL#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index TELEFONO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."TELEFONO_PK" ON "SYSTEM"."TELEFONO" ("PHONENUMBER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_TEMPLATE_OBJECTS_N1
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS_N1" ON "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS" ("REFRESH_TEMPLATE_ID", "OBJECT_TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_AUDIT_COLUMN_F1_IDX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_AUDIT_COLUMN_F1_IDX" ON "SYSTEM"."REPCAT$_AUDIT_COLUMN" ("ATTRIBUTE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MVIEW$_ADV_TEMP_IDX_01
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."MVIEW$_ADV_TEMP_IDX_01" ON "SYSTEM"."MVIEW$_ADV_TEMP" ("ID#", "SEQ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I2TABCOMPART$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I2TABCOMPART$" ON "SYSTEM"."LOGMNR_TABCOMPART$" ("LOGMNR_UID", "BO#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index OL$NAME
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."OL$NAME" ON "SYSTEM"."OL$" ("OL_NAME") ;
--------------------------------------------------------
--  DDL for Index MVIEW$_ADV_JOURNAL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."MVIEW$_ADV_JOURNAL_PK" ON "SYSTEM"."MVIEW$_ADV_JOURNAL" ("RUNID#", "SEQ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_OBJECT_TYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_OBJECT_TYPE_PK" ON "SYSTEM"."REPCAT$_OBJECT_TYPES" ("OBJECT_TYPE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_TEMPLATE_OBJECTS_N2
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS_N2" ON "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS" ("REFRESH_TEMPLATE_ID", "OBJECT_NAME", "SCHEMA_NAME", "OBJECT_TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1OPQTYPE$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1OPQTYPE$" ON "SYSTEM"."LOGMNR_OPQTYPE$" ("LOGMNR_UID", "OBJ#", "INTCOL#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index DEF$_DESTINATION_PRIMARY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."DEF$_DESTINATION_PRIMARY" ON "SYSTEM"."DEF$_DESTINATION" ("DBLINK", "CATCHUP") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I2NTAB$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I2NTAB$" ON "SYSTEM"."LOGMNR_NTAB$" ("LOGMNR_UID", "NTAB#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index MVIEW$_ADV_FILTER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."MVIEW$_ADV_FILTER_PK" ON "SYSTEM"."MVIEW$_ADV_FILTER" ("FILTERID#", "SUBFILTERNUM#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1TABSUBPART$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1TABSUBPART$" ON "SYSTEM"."LOGMNR_TABSUBPART$" ("LOGMNR_UID", "OBJ#", "POBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1LOB$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1LOB$" ON "SYSTEM"."LOGMNR_LOB$" ("LOGMNR_UID", "OBJ#", "INTCOL#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index REPCAT$_FLAVOR_OBJECTS_FK1_IDX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_FLAVOR_OBJECTS_FK1_IDX" ON "SYSTEM"."REPCAT$_FLAVOR_OBJECTS" ("GNAME", "GOWNER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGSTDBY$SKIP_IND
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGSTDBY$SKIP_IND" ON "SYSTEM"."LOGSTDBY$SKIP_SUPPORT" ("NAME", "ACTION") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index MVIEW$_ADV_FJG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."MVIEW$_ADV_FJG_PK" ON "SYSTEM"."MVIEW$_ADV_FJG" ("FJGID#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPGEN_PRNT_IDX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_REPGEN_PRNT_IDX" ON "SYSTEM"."REPCAT$_GENERATED" ("SNAME", "ONAME", "TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_PROCESSED_LOG$_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGMNR_PROCESSED_LOG$_PK" ON "SYSTEM"."LOGMNR_PROCESSED_LOG$" ("SESSION#", "THREAD#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1TYPE$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1TYPE$" ON "SYSTEM"."LOGMNR_TYPE$" ("LOGMNR_UID", "TOID", "VERSION#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I2TABSUBPART$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I2TABSUBPART$" ON "SYSTEM"."LOGMNR_TABSUBPART$" ("LOGMNR_UID", "POBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index REPCAT$_FLAVORS_FNAME
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_FLAVORS_FNAME" ON "SYSTEM"."REPCAT$_FLAVORS" ("FNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index DEF$_PUSHED_TRAN_PRIMARY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."DEF$_PUSHED_TRAN_PRIMARY" ON "SYSTEM"."DEF$_PUSHED_TRANSACTIONS" ("SOURCE_SITE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPGEN_PRIMARY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_REPGEN_PRIMARY" ON "SYSTEM"."REPCAT$_GENERATED" ("SNAME", "ONAME", "TYPE", "BASE_SNAME", "BASE_ONAME", "BASE_TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index I1_QUEUES
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."I1_QUEUES" ON "SYSTEM"."AQ$_QUEUES" ("NAME", "EVENTID", "TABLE_OBJNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1TABPART$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1TABPART$" ON "SYSTEM"."LOGMNR_TABPART$" ("LOGMNR_UID", "OBJ#", "BO#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1KOPM$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1KOPM$" ON "SYSTEM"."LOGMNR_KOPM$" ("LOGMNR_UID", "NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index REPCAT$_GROUPED_COLUMN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_GROUPED_COLUMN_PK" ON "SYSTEM"."REPCAT$_GROUPED_COLUMN" ("SNAME", "ONAME", "GROUP_NAME", "COLUMN_NAME", "POS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_AUDIT_COLUMN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_AUDIT_COLUMN_PK" ON "SYSTEM"."REPCAT$_AUDIT_COLUMN" ("COLUMN_NAME", "ONAME", "SNAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1ICOL$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1ICOL$" ON "SYSTEM"."LOGMNR_ICOL$" ("LOGMNR_UID", "OBJ#", "INTCOL#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPSCHEMA_PRNT_IDX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_REPSCHEMA_PRNT_IDX" ON "SYSTEM"."REPCAT$_REPSCHEMA" ("SNAME", "GOWNER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_SITE_OBJECTS_N1
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_SITE_OBJECTS_N1" ON "SYSTEM"."REPCAT$_SITE_OBJECTS" ("TEMPLATE_SITE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I2SEED$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I2SEED$" ON "SYSTEM"."LOGMNR_SEED$" ("LOGMNR_UID", "SCHEMANAME", "TABLE_NAME", "COL_NAME", "OBJ#", "INTCOL#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPCOLUMN_FK_IDX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_REPCOLUMN_FK_IDX" ON "SYSTEM"."REPCAT$_REPCOLUMN" ("SNAME", "ONAME", "TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_RESOLUTION_F3_IDX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_RESOLUTION_F3_IDX" ON "SYSTEM"."REPCAT$_RESOLUTION" ("CONFLICT_TYPE_ID", "METHOD_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPOBJECT_PRIMARY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_REPOBJECT_PRIMARY" ON "SYSTEM"."REPCAT$_REPOBJECT" ("SNAME", "ONAME", "TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MVIEW$_ADV_WORKLOAD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."MVIEW$_ADV_WORKLOAD_PK" ON "SYSTEM"."MVIEW$_ADV_WORKLOAD" ("QUERYID#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNRT_MDDL$_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LOGMNRT_MDDL$_PK" ON "SYSTEM"."LOGMNRT_MDDL$" ("SOURCE_OBJ#", "SOURCE_ROWID") ;
--------------------------------------------------------
--  DDL for Index REPCAT$_PARAMETER_COLUMN_F1_I
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_PARAMETER_COLUMN_F1_I" ON "SYSTEM"."REPCAT$_PARAMETER_COLUMN" ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME", "SEQUENCE_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index DEF$_LOB_PRIMARY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."DEF$_LOB_PRIMARY" ON "SYSTEM"."DEF$_LOB" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGSTDBY$SKIP_IDX2
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGSTDBY$SKIP_IDX2" ON "SYSTEM"."LOGSTDBY$SKIP" ("STATEMENT_OPT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1DICTIONARY$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1DICTIONARY$" ON "SYSTEM"."LOGMNR_DICTIONARY$" ("LOGMNR_UID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index MVIEW$_ADV_LOG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."MVIEW$_ADV_LOG_PK" ON "SYSTEM"."MVIEW$_ADV_LOG" ("RUNID#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REFRESH_TEMPLATES_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_REFRESH_TEMPLATES_U1" ON "SYSTEM"."REPCAT$_REFRESH_TEMPLATES" ("REFRESH_TEMPLATE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1CCOL$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1CCOL$" ON "SYSTEM"."LOGMNR_CCOL$" ("LOGMNR_UID", "CON#", "INTCOL#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index MVIEW$_ADV_ELIGIBLE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."MVIEW$_ADV_ELIGIBLE_PK" ON "SYSTEM"."MVIEW$_ADV_ELIGIBLE" ("SUMOBJN#", "RUNID#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1LOBFRAG$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1LOBFRAG$" ON "SYSTEM"."LOGMNR_LOBFRAG$" ("LOGMNR_UID", "FRAGOBJ#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Index REPCAT$_RUNTIME_PARMS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_RUNTIME_PARMS_PK" ON "SYSTEM"."REPCAT$_RUNTIME_PARMS" ("RUNTIME_PARM_ID", "PARAMETER_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_TEMPLATE_OBJECTS_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS_U1" ON "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS" ("OBJECT_NAME", "OBJECT_TYPE", "REFRESH_TEMPLATE_ID", "SCHEMA_NAME", "DDL_NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_CONFLICT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_CONFLICT_PK" ON "SYSTEM"."REPCAT$_CONFLICT" ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MVIEW$_ADV_ROLLUP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."MVIEW$_ADV_ROLLUP_PK" ON "SYSTEM"."MVIEW$_ADV_ROLLUP" ("RUNID#", "CLEVELID#", "PLEVELID#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_TEMPLATE_TYPES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_TEMPLATE_TYPES_PK" ON "SYSTEM"."REPCAT$_TEMPLATE_TYPES" ("TEMPLATE_TYPE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_COLUMN_GROUP_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_COLUMN_GROUP_PK" ON "SYSTEM"."REPCAT$_COLUMN_GROUP" ("SNAME", "ONAME", "GROUP_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPPROP_PRIMARY
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_REPPROP_PRIMARY" ON "SYSTEM"."REPCAT$_REPPROP" ("SNAME", "ONAME", "TYPE", "DBLINK") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_RESOL_METHOD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_RESOL_METHOD_PK" ON "SYSTEM"."REPCAT$_RESOLUTION_METHOD" ("CONFLICT_TYPE_ID", "METHOD_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_SITES_NEW_FK2_IDX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_SITES_NEW_FK2_IDX" ON "SYSTEM"."REPCAT$_SITES_NEW" ("GNAME", "GOWNER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_PARAMETER_COLUMN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_PARAMETER_COLUMN_PK" ON "SYSTEM"."REPCAT$_PARAMETER_COLUMN" ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME", "SEQUENCE_NO", "PARAMETER_TABLE_NAME", "PARAMETER_SEQUENCE_NO", "COLUMN_POS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPPROP_PRNT2_IDX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_REPPROP_PRNT2_IDX" ON "SYSTEM"."REPCAT$_REPPROP" ("SNAME", "DBLINK") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_SITES_NEW_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_SITES_NEW_PK" ON "SYSTEM"."REPCAT$_SITES_NEW" ("EXTENSION_ID", "GOWNER", "GNAME", "DBLINK") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_TEMPLATE_SITES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_TEMPLATE_SITES_PK" ON "SYSTEM"."REPCAT$_TEMPLATE_SITES" ("TEMPLATE_SITE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MVIEW$_ADV_GC_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."MVIEW$_ADV_GC_PK" ON "SYSTEM"."MVIEW$_ADV_GC" ("GCID#") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_TEMPLATE_STATUS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_TEMPLATE_STATUS_PK" ON "SYSTEM"."REPCAT$_TEMPLATE_STATUS" ("TEMPLATE_STATUS_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index OL$SIGNATURE
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."OL$SIGNATURE" ON "SYSTEM"."OL$" ("SIGNATURE", "CATEGORY") ;
--------------------------------------------------------
--  DDL for Index REPCAT$_TEMPLATE_TARGETS_U1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_TEMPLATE_TARGETS_U1" ON "SYSTEM"."REPCAT$_TEMPLATE_TARGETS" ("TARGET_DATABASE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_KEY_COLUMNS_PRNT_IDX
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_KEY_COLUMNS_PRNT_IDX" ON "SYSTEM"."REPCAT$_KEY_COLUMNS" ("SNAME", "ONAME", "TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPOBJECT_GNAME
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_REPOBJECT_GNAME" ON "SYSTEM"."REPCAT$_REPOBJECT" ("GNAME", "ONAME", "TYPE", "GOWNER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_REPCATLOG_GNAME
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_REPCATLOG_GNAME" ON "SYSTEM"."REPCAT$_REPCATLOG" ("GNAME", "SNAME", "ONAME", "TYPE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_DDL
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."REPCAT$_DDL" ON "SYSTEM"."REPCAT$_DDL" ("LOG_ID", "SOURCE", "ROLE", "MASTER", "LINE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index REPCAT$_OBJECT_PARMS_N2
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."REPCAT$_OBJECT_PARMS_N2" ON "SYSTEM"."REPCAT$_OBJECT_PARMS" ("TEMPLATE_OBJECT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LOGMNR_I1SUBCOLTYPE$
--------------------------------------------------------

  CREATE INDEX "SYSTEM"."LOGMNR_I1SUBCOLTYPE$" ON "SYSTEM"."LOGMNR_SUBCOLTYPE$" ("LOGMNR_UID", "OBJ#", "INTCOL#", "TOID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255  LOGGING 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ) ;
--------------------------------------------------------
--  DDL for Trigger DEF$_PROPAGATOR_TRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."DEF$_PROPAGATOR_TRIG" 
  BEFORE INSERT ON system.def$_propagator
DECLARE
  prop_count  NUMBER;
BEGIN
  SELECT count(*) into prop_count
    FROM system.def$_propagator;

  IF (prop_count > 0) THEN
    -- Raise duplicate propagator error
    sys.dbms_sys_error.raise_system_error(-23394);
  END IF;
END;
/
ALTER TRIGGER "SYSTEM"."DEF$_PROPAGATOR_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger REPCATLOGTRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."REPCATLOGTRIG" 
AFTER UPDATE OR DELETE ON system.repcat$_repcatlog
BEGIN
  sys.dbms_alert.signal('repcatlog_alert', '');
END;
/
ALTER TRIGGER "SYSTEM"."REPCATLOGTRIG" ENABLE;
--------------------------------------------------------
--  DDL for Procedure ORA$_SYS_REP_AUTH
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SYSTEM"."ORA$_SYS_REP_AUTH" as
begin
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.repcat$_repschema TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.repcat$_repprop TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_aqcall TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_calldest TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_error TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_destination TO SYS ' ||
                 'WITH GRANT OPTION';
end;

/
--------------------------------------------------------
--  DDL for Package DBMS_REPCAT_AUTH
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "SYSTEM"."DBMS_REPCAT_AUTH" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
9
bf d6
0cfc6e4Sm6mfaMYwsbW2JygBepcwg/BKmJ4VZy/pO06UXsVUMejsissTcGWYR4qeK4TPqfDK
q7UPH+SmKP6nW9zmxMZnuK1VDzM0Iv9O4E4SvvsnHWn+EPF9hR+oBFe3fEro6RQ5R5Ejd1nr
e+fAK010dExf76gg/c6ZB3YxGPHDOqkGI4lV6HNsd57gKLwTd0bxan5UwJriIpt7Vjc=

/
--------------------------------------------------------
--  DDL for Package Body DBMS_REPCAT_AUTH
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "SYSTEM"."DBMS_REPCAT_AUTH" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
b
b9d 39c
PBMGkNCh5NDAdLezCHsLvZaVi/swg5UrNSCDfI4Zvp0VB6GpRld+By6E2nVdlFHT2g2kK9zM
8jSnsuee7mkmJD+W3Mo36HQvUfOe7jH5vP7tu1i0jDykzR0pUhJZUcY6xVrSwNPoNVPcT72N
eHhGwyRBj2+0vKbgTmcZKBMJzETRfOl2YGDDVB3FvKBSixMMqfWSX8uh3wPGOi8W9vOASC3z
0UvPqL7KR78SykUEoBCxpMGmE8pgElC/dagmVpIIt7QA6sneMlNb2OO/1zTN44ACRsm+2JAo
zD41TcuGaNUqDYNDRbPEKzeRZeXxrx1UvOWsYTNaO6icaV/NrtZbmXpDuGA/sqnz4jnKFK8S
0VC+Yjh2iJEV5edD2+8pyMgx44NVDiAQ+sjjDkpGc0IxXrm/v52yduhnj/xnkualIm/RyAv0
Q/YzRAHy7NvyavbajIvCFoZWpbO3Jw8NwkoU25ysfgvXZJrw4vPjh4hHR4Mpto6jFMM+dZPW
3N9HL971bTBgyAL0BjASEFXe83D+IoBYX0VQVk5+t7p7iUsmfyK5t+cECNpNOL6UaACcsAYB
Le+yLOAqFHSvCXlWcECxG7wXjAA2/XmBwvKBNLcggXKVp3i9cNzab0Mq9qSAcIYgRFxRdAOe
sTDZNOx6HkJTbCRKCMiJzgjQQW476DlOZD+9Gwh+AA/Y3PIDOfyhlvXT6HsjW33mASJUuORB
la5Jb3rB4syO6QO2a5vSHu26Gwib2EflS8bqC1hZhpHsvM+mAaWJ2x72JyrPe8V7Ohjbre49
gRsjAtspIYfP5958sSnHdkz32nGAXnrEY95lEHGwkuXLlj9y6I21aAyd3/lJkuEAEBxzZVnm
IaNJBwl8u33+SqGLZzILy1QxmA+pF8yUaQ+yRU/5+3n1mY4=

/
--------------------------------------------------------
--  DDL for Synonymn CATALOG
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."CATALOG" FOR "SYS"."CATALOG";
--------------------------------------------------------
--  DDL for Synonymn COL
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."COL" FOR "SYS"."COL";
--------------------------------------------------------
--  DDL for Synonymn PRODUCT_USER_PROFILE
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."PRODUCT_USER_PROFILE" FOR "SYSTEM"."SQLPLUS_PRODUCT_PROFILE";
--------------------------------------------------------
--  DDL for Synonymn PUBLICSYN
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."PUBLICSYN" FOR "SYS"."PUBLICSYN";
--------------------------------------------------------
--  DDL for Synonymn SYSCATALOG
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."SYSCATALOG" FOR "SYS"."SYSCATALOG";
--------------------------------------------------------
--  DDL for Synonymn SYSFILES
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."SYSFILES" FOR "SYS"."SYSFILES";
--------------------------------------------------------
--  DDL for Synonymn TAB
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."TAB" FOR "SYS"."TAB";
--------------------------------------------------------
--  DDL for Synonymn TABQUOTAS
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."TABQUOTAS" FOR "SYS"."TABQUOTAS";
--------------------------------------------------------
--  DDL for Queue DEF$_AQERROR
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => 'SYSTEM.DEF$_AQERROR',
     Queue_table         => 'SYSTEM.DEF$_AQERROR',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  TRUE,
     comment             => 'Error Queue for Deferred RPCs');
  END;
/
--------------------------------------------------------
--  DDL for Queue DEF$_AQCALL
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => 'SYSTEM.DEF$_AQCALL',
     Queue_table         => 'SYSTEM.DEF$_AQCALL',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  TRUE,
     comment             => 'Deferred RPC Queue');
  END;
/
--------------------------------------------------------
--  DDL for Queue Table DEF$_AQCALL
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYSTEM"."DEF$_AQCALL"',
     Queue_payload_type => 'VARIANT',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 TABLESPACE SYSTEM',
     Sort_list          => 'ENQ_TIME',
     Compatible         => '8.0.3');
  END;
/
--------------------------------------------------------
--  DDL for Queue Table DEF$_AQERROR
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYSTEM"."DEF$_AQERROR"',
     Queue_payload_type => 'VARIANT',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 TABLESPACE SYSTEM',
     Sort_list          => 'ENQ_TIME',
     Compatible         => '8.0.3');
  END;
/
--------------------------------------------------------
--  Constraints for Table LOGMNRC_DBNAME_UID_MAP
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNRC_DBNAME_UID_MAP" ADD CONSTRAINT "LOGMNRC_DBNAME_UID_MAP_PK" PRIMARY KEY ("GLOBAL_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  ENABLE;
  ALTER TABLE "SYSTEM"."LOGMNRC_DBNAME_UID_MAP" MODIFY ("GLOBAL_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_IND$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_IND$" ADD CONSTRAINT "LOGMNR_IND$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_IND$" MODIFY ("OBJ#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_GROUPED_COLUMN
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_GROUPED_COLUMN" ADD CONSTRAINT "REPCAT$_GROUPED_COLUMN_PK" PRIMARY KEY ("SNAME", "ONAME", "GROUP_NAME", "COLUMN_NAME", "POS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REPCAT$_REPCATLOG
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_REPCATLOG" ADD CONSTRAINT "REPCAT$_REPCATLOG_PRIMARY" PRIMARY KEY ("ID", "SOURCE", "ROLE", "MASTER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_REPCATLOG" ADD CONSTRAINT "REPCAT$_REPCATLOG_STATUS" CHECK (status IN (0, 1, 2, 3, 4)) ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_REPCATLOG" ADD CONSTRAINT "REPCAT$_REPCATLOG_TYPE" CHECK (type IN (-1, 0, 1, 2, 4, 5, 7, 8, 9, 11, 12, -3,
                                    13, 14, 32, 33)) ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_REPCATLOG" ADD CONSTRAINT "REPCAT$_REPCATLOG_REQUEST" CHECK (request IN (-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
                                       11, 12, 13, 14, 15, 16, 17,
                                       18, 19, 20, 21, 22, 23, 24, 25)) ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGSTDBY$EDS_TABLES
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGSTDBY$EDS_TABLES" ADD CONSTRAINT "LOGSTDBY$EDS_TABLES_PKEY" PRIMARY KEY ("OWNER", "TABLE_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REPCAT$_REPSCHEMA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_REPSCHEMA" ADD CONSTRAINT "REPCAT$_REPSCHEMA_PRIMARY" PRIMARY KEY ("SNAME", "DBLINK", "GOWNER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_TAB$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_TAB$" ADD CONSTRAINT "LOGMNR_TAB$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_TAB$" MODIFY ("OBJ#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_OPQTYPE$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_OPQTYPE$" ADD CONSTRAINT "LOGMNR_OPQTYPE$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_OPQTYPE$" MODIFY ("OBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNR_OPQTYPE$" MODIFY ("INTCOL#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_TEMPLATE_SITES
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_SITES" ADD CONSTRAINT "REPCAT$_TEMPLATE_SITES_U1" UNIQUE ("REFRESH_TEMPLATE_NAME", "USER_NAME", "SITE_NAME", "REPAPI_SITE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_SITES" ADD CONSTRAINT "REPCAT$_TEMPLATE_SITES_PK" PRIMARY KEY ("TEMPLATE_SITE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_SITES" ADD CONSTRAINT "REPCAT$_TEMPLATE_SITES_C2" CHECK ((site_name is not null and repapi_site_id is null) or
   (site_name is null and repapi_site_id is not null)) ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_SITES" ADD CONSTRAINT "REPCAT$_TEMPLATE_SITES_C1" CHECK (status in (-100,-1,0,1)) ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_SITES" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_SITES" MODIFY ("USER_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_SITES" MODIFY ("REFRESH_TEMPLATE_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_DICTSTATE$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_DICTSTATE$" ADD CONSTRAINT "LOGMNR_DICTSTATE$_PK" PRIMARY KEY ("LOGMNR_UID") DISABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_LOG$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_LOG$" ADD CONSTRAINT "LOGMNR_LOG$_PK" PRIMARY KEY ("SESSION#", "THREAD#", "SEQUENCE#", "FIRST_CHANGE#", "DB_ID", "RESETLOGS_CHANGE#", "RESET_TIMESTAMP")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_KOPM$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_KOPM$" ADD CONSTRAINT "LOGMNR_KOPM$_PK" PRIMARY KEY ("LOGMNR_UID", "NAME") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_KOPM$" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_ELIGIBLE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_ELIGIBLE" ADD CONSTRAINT "MVIEW$_ADV_ELIGIBLE_PK" PRIMARY KEY ("SUMOBJN#", "RUNID#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_ELIGIBLE" MODIFY ("FREQUENCY" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_ELIGIBLE" MODIFY ("FLAGS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_ELIGIBLE" MODIFY ("BYTECOST" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_ELIGIBLE" MODIFY ("RUNID#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_ELIGIBLE" MODIFY ("SUMOBJN#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_AUDIT_ATTRIBUTE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_AUDIT_ATTRIBUTE" ADD CONSTRAINT "REPCAT$_AUDIT_ATTRIBUTE_PK" PRIMARY KEY ("ATTRIBUTE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_AUDIT_ATTRIBUTE" ADD CONSTRAINT "REPCAT$_AUDIT_ATTRIBUTE_C1" CHECK ((data_type_id in (2, 4, 5, 6, 7) and
                  data_length is not null)
              or (data_type_id not in (2, 4, 5, 6, 7) and
                  data_length is null)
                 ) ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_AUDIT_ATTRIBUTE" MODIFY ("SOURCE" CONSTRAINT "REPCAT$_AUDIT_ATTRIBUTE_NN2" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_AUDIT_ATTRIBUTE" MODIFY ("DATA_TYPE_ID" CONSTRAINT "REPCAT$_AUDIT_ATTRIBUTE_NN1" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_USER_PARM_VALUES
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_USER_PARM_VALUES" ADD CONSTRAINT "REPCAT$_USER_PARM_VALUES_U1" UNIQUE ("TEMPLATE_PARAMETER_ID", "USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_USER_PARM_VALUES" ADD CONSTRAINT "REPCAT$_USER_PARM_VALUES_PK" PRIMARY KEY ("USER_PARAMETER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_USER_PARM_VALUES" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_USER_PARM_VALUES" MODIFY ("TEMPLATE_PARAMETER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_REPOBJECT
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_REPOBJECT" ADD CONSTRAINT "REPCAT$_REPOBJECT_PRIMARY" PRIMARY KEY ("SNAME", "ONAME", "TYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_REPOBJECT" ADD CONSTRAINT "REPCAT$_REPOBJECT_GENTRIGGER" CHECK (gentrigger IN (0, 1, 2)) ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_REPOBJECT" ADD CONSTRAINT "REPCAT$_REPOBJECT_GENPACKAGE" CHECK (genpackage IN (0, 1, 2)) ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_REPOBJECT" ADD CONSTRAINT "REPCAT$_REPOBJECT_STATUS" CHECK (status IN (0, 1, 2, 3, 4, 5, 6)) ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_REPOBJECT" ADD CONSTRAINT "REPCAT$_REPOBJECT_VERSION" CHECK (version# >= 0 AND version# < 65536) ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_REPOBJECT" ADD CONSTRAINT "REPCAT$_REPOBJECT_TYPE" CHECK (type IN (-1, 1, 2, 4, 5, 7, 8, 9, 11, 12, -3,
                                      -4, 13, 14, 32, 33)) ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_INDCOMPART$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_INDCOMPART$" ADD CONSTRAINT "LOGMNR_INDCOMPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_INDCOMPART$" MODIFY ("PART#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_TS$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_TS$" ADD CONSTRAINT "LOGMNR_TS$_PK" PRIMARY KEY ("LOGMNR_UID", "TS#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_TS$" MODIFY ("BLOCKSIZE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TELEFONO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."TELEFONO" MODIFY ("PHONETYPE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TELEFONO" MODIFY ("PHONENUMBER" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TELEFONO" MODIFY ("IDCONTACT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TELEFONO" ADD CONSTRAINT "TELEFONO_PK" PRIMARY KEY ("PHONENUMBER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REPCAT$_RESOLUTION_STATISTICS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS" MODIFY ("PRIMARY_KEY_VALUE" CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN8" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS" MODIFY ("RESOLVED_DATE" CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN7" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS" MODIFY ("FUNCTION_NAME" CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN6" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS" MODIFY ("METHOD_NAME" CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN5" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS" MODIFY ("REFERENCE_NAME" CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN4" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS" MODIFY ("CONFLICT_TYPE_ID" CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN3" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS" MODIFY ("ONAME" CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN2" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_RESOLUTION_STATISTICS" MODIFY ("SNAME" CONSTRAINT "REPCAT$_RESOLUTION_STATS_NN1" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_JOURNAL
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_JOURNAL" ADD CONSTRAINT "MVIEW$_ADV_JOURNAL_PK" PRIMARY KEY ("RUNID#", "SEQ#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_JOURNAL" MODIFY ("FLAGS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_JOURNAL" MODIFY ("TIMESTAMP" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_JOURNAL" MODIFY ("SEQ#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_JOURNAL" MODIFY ("RUNID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_SEED$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_SEED$" ADD CONSTRAINT "LOGMNR_SEED$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_SEED$" MODIFY ("NULL$" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_TYPE$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_TYPE$" ADD CONSTRAINT "LOGMNR_TYPE$_PK" PRIMARY KEY ("LOGMNR_UID", "TOID", "VERSION#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_TYPE$" MODIFY ("TOID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_COLUMN_GROUP
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_COLUMN_GROUP" ADD CONSTRAINT "REPCAT$_COLUMN_GROUP_PK" PRIMARY KEY ("SNAME", "ONAME", "GROUP_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_COLUMN_GROUP" MODIFY ("GROUP_NAME" CONSTRAINT "REPCAT$_COLUMN_GROUP_NN3" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_COLUMN_GROUP" MODIFY ("ONAME" CONSTRAINT "REPCAT$_COLUMN_GROUP_NN2" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_COLUMN_GROUP" MODIFY ("SNAME" CONSTRAINT "REPCAT$_COLUMN_GROUP_NN1" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_OUTPUT
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_OUTPUT" ADD CONSTRAINT "MVIEW$_ADV_OUTPUT_PK" PRIMARY KEY ("RUNID#", "RANK#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_OUTPUT" MODIFY ("BENEFIT_TO_COST_RATIO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_OUTPUT" MODIFY ("OUTPUT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_OUTPUT" MODIFY ("RUNID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_AJG
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_AJG" ADD CONSTRAINT "MVIEW$_ADV_AJG_PK" PRIMARY KEY ("AJGID#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_AJG" MODIFY ("HASHVALUE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_AJG" MODIFY ("AJGDES" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_AJG" MODIFY ("AJGDESLEN" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_AJG" MODIFY ("RUNID#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_AJG" MODIFY ("AJGID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_TABCOMPART$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_TABCOMPART$" ADD CONSTRAINT "LOGMNR_TABCOMPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_TABCOMPART$" MODIFY ("PART#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_TEMPLATE_STATUS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_STATUS" ADD CONSTRAINT "REPCAT$_TEMPLATE_STATUS_PK" PRIMARY KEY ("TEMPLATE_STATUS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_STATUS" MODIFY ("STATUS_TYPE_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEF$_LOB
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."DEF$_LOB" ADD CONSTRAINT "DEF$_LOB_PRIMARY" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_LOGMNR_BUILDLOG
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_LOGMNR_BUILDLOG" ADD CONSTRAINT "LOGMNR_LOGMNR_BUILDLOG_PK" PRIMARY KEY ("LOGMNR_UID", "INITIAL_XID") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_LOGMNR_BUILDLOG" MODIFY ("INITIAL_XID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_TEMPLATE_REFGROUPS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS" ADD CONSTRAINT "REPCAT$_TEMPLATE_REFGROUPS_PK" PRIMARY KEY ("REFRESH_GROUP_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS" MODIFY ("REFRESH_TEMPLATE_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS" MODIFY ("REFRESH_GROUP_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS" MODIFY ("REFRESH_GROUP_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_UID$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_UID$" ADD CONSTRAINT "LOGMNR_UID$_PK" PRIMARY KEY ("SESSION#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REPCAT$_TEMPLATE_TARGETS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_TARGETS" ADD CONSTRAINT "TEMPLATE$_TARGETS_PK" PRIMARY KEY ("TEMPLATE_TARGET_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_TARGETS" MODIFY ("TARGET_DATABASE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_KEY_COLUMNS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_KEY_COLUMNS" ADD CONSTRAINT "REPCAT$_KEY_COLUMNS_PRIMARY" PRIMARY KEY ("SNAME", "ONAME", "COL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REPCAT$_CONFLICT
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_CONFLICT" ADD CONSTRAINT "REPCAT$_CONFLICT_PK" PRIMARY KEY ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_CONFLICT" ADD CONSTRAINT "REPCAT$_CONFLICT_C1" CHECK (conflict_type_id in (1, 2, 3)) ENABLE;
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_WORKLOAD
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_WORKLOAD" ADD CONSTRAINT "MVIEW$_ADV_WORKLOAD_PK" PRIMARY KEY ("QUERYID#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_WORKLOAD" MODIFY ("SQL_TEXTLEN" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_WORKLOAD" MODIFY ("SQL_TEXT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_WORKLOAD" MODIFY ("UNAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_WORKLOAD" MODIFY ("COLLECTTIME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_WORKLOAD" MODIFY ("COLLECTIONID#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_WORKLOAD" MODIFY ("QUERYID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_NTAB$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_NTAB$" ADD CONSTRAINT "LOGMNR_NTAB$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_NTAB$" MODIFY ("OBJ#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_AUDIT_COLUMN
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_AUDIT_COLUMN" ADD CONSTRAINT "REPCAT$_AUDIT_COLUMN_PK" PRIMARY KEY ("COLUMN_NAME", "ONAME", "SNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_AUDIT_COLUMN" MODIFY ("ATTRIBUTE" CONSTRAINT "REPCAT$_AUDIT_COLUMN_NN5" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_AUDIT_COLUMN" MODIFY ("BASE_REFERENCE_NAME" CONSTRAINT "REPCAT$_AUDIT_COLUMN_NN4" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_AUDIT_COLUMN" MODIFY ("BASE_CONFLICT_TYPE_ID" CONSTRAINT "REPCAT$_AUDIT_COLUMN_NN3" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_AUDIT_COLUMN" MODIFY ("BASE_ONAME" CONSTRAINT "REPCAT$_AUDIT_COLUMN_NN2" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_AUDIT_COLUMN" MODIFY ("BASE_SNAME" CONSTRAINT "REPCAT$_AUDIT_COLUMN_NN1" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNRC_GTCS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNRC_GTCS" ADD CONSTRAINT "LOGMNRC_GTCS_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "OBJV#", "INTCOL#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" )  ENABLE;
  ALTER TABLE "SYSTEM"."LOGMNRC_GTCS" MODIFY ("TYPE#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRC_GTCS" MODIFY ("COLNAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRC_GTCS" MODIFY ("INTCOL#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRC_GTCS" MODIFY ("SEGCOL#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRC_GTCS" MODIFY ("OBJV#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRC_GTCS" MODIFY ("OBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRC_GTCS" MODIFY ("LOGMNR_UID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGSTDBY$FLASHBACK_SCN
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGSTDBY$FLASHBACK_SCN" ADD PRIMARY KEY ("PRIMARY_SCN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  ENABLE;
  ALTER TABLE "SYSTEM"."LOGSTDBY$FLASHBACK_SCN" MODIFY ("PRIMARY_SCN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_LEVEL
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_LEVEL" ADD CONSTRAINT "MVIEW$_ADV_LEVEL_PK" PRIMARY KEY ("RUNID#", "LEVELID#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_LEVEL" MODIFY ("COLUMNLIST" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_LEVEL" MODIFY ("TBLOBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_LEVEL" MODIFY ("FLAGS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_LEVEL" MODIFY ("LEVELID#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_LEVEL" MODIFY ("RUNID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_GENERATED
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_GENERATED" ADD CONSTRAINT "REPCAT$_REPGEN_PRIMARY" PRIMARY KEY ("SNAME", "ONAME", "TYPE", "BASE_SNAME", "BASE_ONAME", "BASE_TYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_GENERATED" ADD CONSTRAINT "REPCAT$_GENERATED_OBJ" CHECK (reason IN (0, 1, 2, 3, 4, 5, 6, 7, 9, 10)) ENABLE;
--------------------------------------------------------
--  Constraints for Table REPCAT$_REPCAT
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_REPCAT" ADD CONSTRAINT "REPCAT$_REPCAT_PRIMARY" PRIMARY KEY ("SNAME", "GOWNER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_REPCAT" ADD CONSTRAINT "REPCAT$_REPCAT_STATUS" CHECK (status IN (0, 1, 2)) ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_INDPART$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_INDPART$" ADD CONSTRAINT "LOGMNR_INDPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "BO#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_INDPART$" MODIFY ("TS#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNRC_GTLO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNRC_GTLO" ADD CONSTRAINT "LOGMNRC_GTLO_PK" PRIMARY KEY ("LOGMNR_UID", "KEYOBJ#", "BASEOBJV#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" )  ENABLE;
  ALTER TABLE "SYSTEM"."LOGMNRC_GTLO" MODIFY ("START_SCN" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRC_GTLO" MODIFY ("INTCOLS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRC_GTLO" MODIFY ("LVL0NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRC_GTLO" MODIFY ("OWNERNAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRC_GTLO" MODIFY ("LVL0TYPE#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRC_GTLO" MODIFY ("BASEOBJV#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRC_GTLO" MODIFY ("BASEOBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRC_GTLO" MODIFY ("LVLCNT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRC_GTLO" MODIFY ("KEYOBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRC_GTLO" MODIFY ("LOGMNR_UID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_SITES_NEW
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_SITES_NEW" ADD CONSTRAINT "REPCAT$_SITES_NEW_PK" PRIMARY KEY ("EXTENSION_ID", "GOWNER", "GNAME", "DBLINK")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_SITES_NEW" ADD CONSTRAINT "REPCAT$_SITES_NEW_FULL_INST" CHECK (full_instantiation IN ('Y', 'N')) ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_SPILL$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_SPILL$" ADD CONSTRAINT "LOGMNR_SPILL$_PK" PRIMARY KEY ("SESSION#", "XIDUSN", "XIDSLT", "XIDSQN", "CHUNK", "STARTIDX", "ENDIDX", "FLAG", "SEQUENCE#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_LOG
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_LOG" ADD CONSTRAINT "MVIEW$_ADV_LOG_PK" PRIMARY KEY ("RUNID#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_LOG" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEF$_DEFAULTDEST
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."DEF$_DEFAULTDEST" ADD CONSTRAINT "DEF$_DEFAULTDEST_PRIMARY" PRIMARY KEY ("DBLINK")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_ICOL$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_ICOL$" ADD CONSTRAINT "LOGMNR_ICOL$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_ICOL$" MODIFY ("INTCOL#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_REPPROP
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_REPPROP" ADD CONSTRAINT "REPCAT$_REPPROP_PRIMARY" PRIMARY KEY ("SNAME", "ONAME", "TYPE", "DBLINK")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_REPPROP" ADD CONSTRAINT "REPCAT$_REPPROP_HOW" CHECK (how IN (0, 1, 2, 3)) ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNRP_CTAS_PART_MAP
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNRP_CTAS_PART_MAP" ADD CONSTRAINT "LOGMNRP_CTAS_PART_MAP_PK" PRIMARY KEY ("LOGMNR_UID", "BASEOBJV#", "KEYOBJ#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" )  ENABLE;
  ALTER TABLE "SYSTEM"."LOGMNRP_CTAS_PART_MAP" MODIFY ("PART#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRP_CTAS_PART_MAP" MODIFY ("KEYOBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRP_CTAS_PART_MAP" MODIFY ("BASEOBJV#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRP_CTAS_PART_MAP" MODIFY ("BASEOBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRP_CTAS_PART_MAP" MODIFY ("LOGMNR_UID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_REFCON$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_REFCON$" ADD CONSTRAINT "LOGMNR_REFCON$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_REFCON$" MODIFY ("OBJ#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_BASETABLE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_BASETABLE" MODIFY ("QUERYID#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_BASETABLE" MODIFY ("COLLECTIONID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEF$_PROPAGATOR
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."DEF$_PROPAGATOR" ADD CONSTRAINT "DEF$_PROPAGATOR_PRIMARY" PRIMARY KEY ("USERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."DEF$_PROPAGATOR" MODIFY ("CREATED" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."DEF$_PROPAGATOR" MODIFY ("USERNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_TEMPLATE_OBJECTS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS" ADD CONSTRAINT "REPCAT$_TEMPLATE_OBJECTS_U1" UNIQUE ("OBJECT_NAME", "OBJECT_TYPE", "REFRESH_TEMPLATE_ID", "SCHEMA_NAME", "DDL_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS" ADD CONSTRAINT "REPCAT$_TEMPLATE_OBJECTS_PK" PRIMARY KEY ("TEMPLATE_OBJECT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS" ADD CONSTRAINT "REPCAT$_TEMPLATE_OBJECTS_VER" CHECK (object_version# >= 0 AND object_version# < 65536) ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS" MODIFY ("TEMPLATE_REFGROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS" MODIFY ("DDL_NUM" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS" MODIFY ("OBJECT_TYPE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS" MODIFY ("OBJECT_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS" MODIFY ("REFRESH_TEMPLATE_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS" MODIFY ("TEMPLATE_OBJECT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_ROLLUP
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_ROLLUP" ADD CONSTRAINT "MVIEW$_ADV_ROLLUP_PK" PRIMARY KEY ("RUNID#", "CLEVELID#", "PLEVELID#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_ROLLUP" MODIFY ("FLAGS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_ROLLUP" MODIFY ("PLEVELID#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_ROLLUP" MODIFY ("CLEVELID#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_ROLLUP" MODIFY ("RUNID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_SESSION$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_SESSION$" ADD CONSTRAINT "LOGMNR_SESSION_UK1" UNIQUE ("SESSION_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_SESSION$" ADD CONSTRAINT "LOGMNR_SESSION_PK" PRIMARY KEY ("SESSION#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_SESSION$" MODIFY ("SESSION_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNRT_MDDL$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNRT_MDDL$" ADD CONSTRAINT "LOGMNRT_MDDL$_PK" PRIMARY KEY ("SOURCE_OBJ#", "SOURCE_ROWID") ENABLE;
  ALTER TABLE "SYSTEM"."LOGMNRT_MDDL$" MODIFY ("DEST_ROWID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNRC_GSII
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNRC_GSII" ADD CONSTRAINT "LOGMNRC_GSII_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" )  ENABLE;
  ALTER TABLE "SYSTEM"."LOGMNRC_GSII" MODIFY ("INDTYPE#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRC_GSII" MODIFY ("BO#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRC_GSII" MODIFY ("OBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRC_GSII" MODIFY ("LOGMNR_UID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_EXCEPTIONS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_EXCEPTIONS" ADD CONSTRAINT "REPCAT$_EXCEPTIONS_PK" PRIMARY KEY ("EXCEPTION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_COLTYPE$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_COLTYPE$" ADD CONSTRAINT "LOGMNR_COLTYPE$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_COLTYPE$" MODIFY ("OBJ#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEF$_ERROR
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."DEF$_ERROR" ADD CONSTRAINT "DEF$_ERROR_PRIMARY" PRIMARY KEY ("ENQ_TID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DEF$_PUSHED_TRANSACTIONS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."DEF$_PUSHED_TRANSACTIONS" ADD CONSTRAINT "DEF$_PUSHED_TRAN_PRIMARY" PRIMARY KEY ("SOURCE_SITE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."DEF$_PUSHED_TRANSACTIONS" ADD CHECK (disabled IN ('T', 'F')) ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_SESSION_ACTIONS$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_SESSION_ACTIONS$" ADD CONSTRAINT "LOGMNR_SESSION_ACTION$_PK" PRIMARY KEY ("LOGMNRSESSION#", "ACTIONNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  ENABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_SESSION_ACTIONS$" MODIFY ("ACTIONTYPE#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNR_SESSION_ACTIONS$" MODIFY ("PROCESSROLE#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNR_SESSION_ACTIONS$" MODIFY ("LOGMNRSESSION#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNR_SESSION_ACTIONS$" MODIFY ("ACTIONNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_OBJ$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_OBJ$" ADD CONSTRAINT "LOGMNR_OBJ$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_OBJ$" MODIFY ("OBJ#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_REPCOLUMN
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_REPCOLUMN" ADD CONSTRAINT "REPCAT$_REPCOLUMN_PK" PRIMARY KEY ("SNAME", "ONAME", "TYPE", "CNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_REPCOLUMN" ADD CONSTRAINT "REPCAT$_REPCOLUMN_VERSION" CHECK (version# >= 0 AND version# < 65536) ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_PROCESSED_LOG$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_PROCESSED_LOG$" ADD CONSTRAINT "LOGMNR_PROCESSED_LOG$_PK" PRIMARY KEY ("SESSION#", "THREAD#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_DICTIONARY$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_DICTIONARY$" ADD CONSTRAINT "LOGMNR_DICTIONARY$_PK" PRIMARY KEY ("LOGMNR_UID") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_DICTIONARY$" MODIFY ("DB_DICT_OBJECTCOUNT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DIRECCION
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."DIRECCION" ADD CONSTRAINT "DIRECCION_PK" PRIMARY KEY ("IDCONTACT", "ADDRESS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."DIRECCION" MODIFY ("COUNTRY" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."DIRECCION" MODIFY ("CITY" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."DIRECCION" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."DIRECCION" MODIFY ("IDCONTACT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_PARAMETERS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_PARAMETERS" ADD CONSTRAINT "MVIEW$_ADV_PARAMETERS_PK" PRIMARY KEY ("PARAMETER_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_PARAMETERS" MODIFY ("PARAMETER_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_PARAMETER_COLUMN
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_PARAMETER_COLUMN" ADD CONSTRAINT "REPCAT$_PARAMETER_COLUMN_PK" PRIMARY KEY ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME", "SEQUENCE_NO", "PARAMETER_TABLE_NAME", "PARAMETER_SEQUENCE_NO", "COLUMN_POS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REPCAT$_INSTANTIATION_DDL
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_INSTANTIATION_DDL" ADD CONSTRAINT "REPCAT$_INSTANTIATION_DDL_PK" PRIMARY KEY ("REFRESH_TEMPLATE_ID", "PHASE", "DDL_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_CCOL$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_CCOL$" ADD CONSTRAINT "LOGMNR_CCOL$_PK" PRIMARY KEY ("LOGMNR_UID", "CON#", "INTCOL#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_CCOL$" MODIFY ("INTCOL#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_EXTENSION
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_EXTENSION" ADD PRIMARY KEY ("EXTENSION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_EXTENSION" ADD CONSTRAINT "REPCAT$_EXTENSION_PUSH_TO_NEW" CHECK (push_to_new IN ('Y', 'N')) ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_EXTENSION" ADD CONSTRAINT "REPCAT$_EXTENSION_PUSH_TO_MDEF" CHECK (push_to_mdef IN ('Y', 'N')) ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_EXTENSION" ADD CONSTRAINT "REPCAT$_EXTENSION_STATUS" CHECK (extension_status IN (0, 1, 2, 3, 4)) ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_EXTENSION" ADD CONSTRAINT "REPCAT$_EXTENSION_EXPORTREQ" CHECK (export_required IN ('Y', 'N')) ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_EXTENSION" ADD CONSTRAINT "REPCAT$_EXTENSION_CODE" CHECK (extension_code IN (0)) ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_SESSION_EVOLVE$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_SESSION_EVOLVE$" ADD CONSTRAINT "LOGMNR_SESSION_EVOLVE$_PK" PRIMARY KEY ("SESSION#", "DB_ID", "RESET_SCN", "RESET_TIMESTAMP")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_LOB$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_LOB$" ADD CONSTRAINT "LOGMNR_LOB$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_LOB$" MODIFY ("CHUNK" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SQLPLUS_PRODUCT_PROFILE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."SQLPLUS_PRODUCT_PROFILE" MODIFY ("PRODUCT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEF$_DESTINATION
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."DEF$_DESTINATION" ADD CONSTRAINT "DEF$_DESTINATION_PRIMARY" PRIMARY KEY ("DBLINK", "CATCHUP")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."DEF$_DESTINATION" MODIFY ("LAST_DELIVERED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_RESTART_CKPT_TXINFO$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_RESTART_CKPT_TXINFO$" ADD CONSTRAINT "LOGMNR_RESTART_CKPT_TXINFO$_PK" PRIMARY KEY ("SESSION#", "XIDUSN", "XIDSLT", "XIDSQN", "SESSION_NUM", "SERIAL_NUM", "EFFECTIVE_SCN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNRC_GSBA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNRC_GSBA" ADD CONSTRAINT "LOGMNRC_GSBA_PK" PRIMARY KEY ("LOGMNR_UID", "AS_OF_SCN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  LOCAL
 (PARTITION "P_LESSTHAN100" 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" )  ENABLE;
  ALTER TABLE "SYSTEM"."LOGMNRC_GSBA" MODIFY ("AS_OF_SCN" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNRC_GSBA" MODIFY ("LOGMNR_UID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_SUBCOLTYPE$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_SUBCOLTYPE$" ADD CONSTRAINT "LOGMNR_SUBCOLTYPE$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#", "TOID") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_SUBCOLTYPE$" MODIFY ("OBJ#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNR_SUBCOLTYPE$" MODIFY ("VERSION#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNR_SUBCOLTYPE$" MODIFY ("TOID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNR_SUBCOLTYPE$" MODIFY ("INTCOL#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_PARTOBJ$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_PARTOBJ$" ADD CONSTRAINT "LOGMNR_PARTOBJ$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_PARTOBJ$" MODIFY ("OBJ#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_COL$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_COL$" ADD CONSTRAINT "LOGMNR_COL$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_COL$" MODIFY ("OBJ#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_RESOLUTION_METHOD
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_RESOLUTION_METHOD" ADD CONSTRAINT "REPCAT$_RESOL_METHOD_PK" PRIMARY KEY ("CONFLICT_TYPE_ID", "METHOD_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_FILTERINSTANCE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_FILTERINSTANCE" MODIFY ("RUNID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_REFRESH_TEMPLATES
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_REFRESH_TEMPLATES" ADD CONSTRAINT "REPCAT$_REFRESH_TEMPLATES_U1" UNIQUE ("REFRESH_TEMPLATE_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_REFRESH_TEMPLATES" ADD CONSTRAINT "REPCAT$_REFRESH_TEMPLATES_PK" PRIMARY KEY ("REFRESH_TEMPLATE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_REFRESH_TEMPLATES" ADD CONSTRAINT "REFRESH_TEMPLATES_C1" CHECK ((public_template in ('Y','N'))
   or public_template is NULL) ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_REFRESH_TEMPLATES" MODIFY ("TEMPLATE_STATUS_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_REFRESH_TEMPLATES" MODIFY ("TEMPLATE_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_REFRESH_TEMPLATES" MODIFY ("REFRESH_GROUP_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_REFRESH_TEMPLATES" MODIFY ("REFRESH_TEMPLATE_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_REFRESH_TEMPLATES" MODIFY ("REFRESH_GROUP_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_REFRESH_TEMPLATES" MODIFY ("OWNER" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_REFRESH_TEMPLATES" MODIFY ("REFRESH_TEMPLATE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGSTDBY$SKIP_SUPPORT
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGSTDBY$SKIP_SUPPORT" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGSTDBY$SKIP_SUPPORT" MODIFY ("ACTION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_CDEF$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_CDEF$" ADD CONSTRAINT "LOGMNR_CDEF$_PK" PRIMARY KEY ("LOGMNR_UID", "CON#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_CDEF$" MODIFY ("OBJ#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_FJG
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_FJG" ADD CONSTRAINT "MVIEW$_ADV_FJG_PK" PRIMARY KEY ("FJGID#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_FJG" MODIFY ("HASHVALUE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_FJG" MODIFY ("FJGDES" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_FJG" MODIFY ("FJGDESLEN" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_FJG" MODIFY ("AJGID#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_FJG" MODIFY ("FJGID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_INDSUBPART$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_INDSUBPART$" ADD CONSTRAINT "LOGMNR_INDSUBPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "POBJ#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_INDSUBPART$" MODIFY ("TS#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_TABSUBPART$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_TABSUBPART$" ADD CONSTRAINT "LOGMNR_TABSUBPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "POBJ#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_TABSUBPART$" MODIFY ("TS#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_INTEGRATED_SPILL$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_INTEGRATED_SPILL$" ADD CONSTRAINT "LOGMNR_INTEG_SPILL$_PK" PRIMARY KEY ("SESSION#", "XIDUSN", "XIDSLT", "XIDSQN", "CHUNK", "FLAG")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_USER$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_USER$" ADD CONSTRAINT "LOGMNR_USER$_PK" PRIMARY KEY ("LOGMNR_UID", "USER#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_USER$" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_ATTRCOL$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_ATTRCOL$" ADD CONSTRAINT "LOGMNR_ATTRCOL$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "INTCOL#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_ATTRCOL$" MODIFY ("OBJ#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_FLAVOR_OBJECTS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_FLAVOR_OBJECTS" ADD CONSTRAINT "REPCAT$_FLAVOR_OBJECTS_PK" PRIMARY KEY ("SNAME", "ONAME", "TYPE", "GNAME", "FLAVOR_ID", "GOWNER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_FLAVOR_OBJECTS" ADD CONSTRAINT "REPCAT$_FLAVOR_OBJECTS_VERSION" CHECK (version# >= 0 AND version# < 65536) ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_PROPS$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_PROPS$" ADD CONSTRAINT "LOGMNR_PROPS$_PK" PRIMARY KEY ("LOGMNR_UID", "NAME") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_PROPS$" MODIFY ("NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_LOBFRAG$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_LOBFRAG$" ADD CONSTRAINT "LOGMNR_LOBFRAG$_PK" PRIMARY KEY ("LOGMNR_UID", "FRAGOBJ#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_LOBFRAG$" MODIFY ("FRAG#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_OBJECT_TYPES
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_OBJECT_TYPES" ADD CONSTRAINT "REPCAT$_OBJECT_TYPE_PK" PRIMARY KEY ("OBJECT_TYPE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PERSONA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."PERSONA" MODIFY ("BIRDTDATE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PERSONA" MODIFY ("GENDER" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PERSONA" MODIFY ("LASTNAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PERSONA" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."PERSONA" ADD PRIMARY KEY ("IDCONTACT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."PERSONA" MODIFY ("IDCONTACT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEF$_CALLDEST
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."DEF$_CALLDEST" ADD CONSTRAINT "DEF$_CALLDEST_PRIMARY" PRIMARY KEY ("ENQ_TID", "DBLINK", "STEP_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_AGE_SPILL$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_AGE_SPILL$" ADD CONSTRAINT "LOGMNR_AGE_SPILL$_PK" PRIMARY KEY ("SESSION#", "XIDUSN", "XIDSLT", "XIDSQN", "CHUNK", "SEQUENCE#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LOGMNR_PARAMETER$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_PARAMETER$" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGMNR_PARAMETER$" MODIFY ("SESSION#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_INFO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_INFO" ADD CONSTRAINT "MVIEW$_ADV_INFO_PK" PRIMARY KEY ("RUNID#", "SEQ#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_INFO" MODIFY ("INFOLEN" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_INFO" MODIFY ("TYPE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_INFO" MODIFY ("SEQ#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_INFO" MODIFY ("RUNID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_USER_AUTHORIZATIONS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_USER_AUTHORIZATIONS" ADD CONSTRAINT "REPCAT$_USER_AUTHORIZATIONS_U1" UNIQUE ("USER_ID", "REFRESH_TEMPLATE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_USER_AUTHORIZATIONS" ADD CONSTRAINT "REPCAT$_USER_AUTHORIZATIONS_PK" PRIMARY KEY ("USER_AUTHORIZATION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_USER_AUTHORIZATIONS" MODIFY ("REFRESH_TEMPLATE_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_USER_AUTHORIZATIONS" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_USER_AUTHORIZATIONS" MODIFY ("USER_AUTHORIZATION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_TABPART$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_TABPART$" ADD CONSTRAINT "LOGMNR_TABPART$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "BO#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_TABPART$" MODIFY ("BO#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_CLIQUE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_CLIQUE" ADD CONSTRAINT "MVIEW$_ADV_CLIQUE_PK" PRIMARY KEY ("CLIQUEID#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_CLIQUE" MODIFY ("NUMROWS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_CLIQUE" MODIFY ("ROWSIZE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_CLIQUE" MODIFY ("BYTECOST" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_CLIQUE" MODIFY ("FREQUENCY" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_CLIQUE" MODIFY ("HASHVALUE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_CLIQUE" MODIFY ("CLIQUEDES" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_CLIQUE" MODIFY ("CLIQUEDESLEN" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_CLIQUE" MODIFY ("RUNID#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_CLIQUE" MODIFY ("CLIQUEID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CORREO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."CORREO" ADD CONSTRAINT "SYS_C006988" PRIMARY KEY ("IDCONTACT", "EMAILADDRESS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."CORREO" MODIFY ("EMAILTYPE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."CORREO" MODIFY ("EMAILADDRESS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."CORREO" MODIFY ("IDCONTACT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_RESOLUTION
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_RESOLUTION" ADD CONSTRAINT "REPCAT$_RESOLUTION_PK" PRIMARY KEY ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME", "SEQUENCE_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_RESOLUTION" MODIFY ("FUNCTION_NAME" CONSTRAINT "REPCAT$_RESOLUTION_NN2" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_RESOLUTION" MODIFY ("METHOD_NAME" CONSTRAINT "REPCAT$_RESOLUTION_NN1" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_GC
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_GC" ADD CONSTRAINT "MVIEW$_ADV_GC_PK" PRIMARY KEY ("GCID#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_GC" MODIFY ("HASHVALUE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_GC" MODIFY ("GCDES" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_GC" MODIFY ("GCDESLEN" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_GC" MODIFY ("FJGID#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_GC" MODIFY ("GCID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_TEMPLATE_TYPES
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_TYPES" ADD CONSTRAINT "REPCAT$_TEMPLATE_TYPES_PK" PRIMARY KEY ("TEMPLATE_TYPE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REPCAT$_OBJECT_PARMS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_OBJECT_PARMS" ADD CONSTRAINT "REPCAT$_OBJECT_PARMS_PK" PRIMARY KEY ("TEMPLATE_PARAMETER_ID", "TEMPLATE_OBJECT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_OBJECT_PARMS" MODIFY ("TEMPLATE_OBJECT_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_OBJECT_PARMS" MODIFY ("TEMPLATE_PARAMETER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_FLAVORS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_FLAVORS" ADD CONSTRAINT "REPCAT$_FLAVORS_UNQ1" UNIQUE ("GNAME", "FLAVOR_ID", "GOWNER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_FLAVORS" ADD CONSTRAINT "REPCAT$_FLAVORS_C2" CHECK (published is NULL or (published in ('Y','N','O'))) ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_FLAVORS" MODIFY ("GNAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_FLAVORS" MODIFY ("FLAVOR_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGSTDBY$EVENTS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGSTDBY$EVENTS" MODIFY ("EVENT_TIME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_ENC$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_ENC$" ADD CONSTRAINT "LOGMNR_ENC$_PK" PRIMARY KEY ("LOGMNR_UID", "OBJ#", "OWNER#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_ENC$" MODIFY ("MKEYID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_ATTRIBUTE$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_ATTRIBUTE$" ADD CONSTRAINT "LOGMNR_ATTRIBUTE$_PK" PRIMARY KEY ("LOGMNR_UID", "TOID", "VERSION#", "ATTRIBUTE#") DISABLE;
  ALTER TABLE "SYSTEM"."LOGMNR_ATTRIBUTE$" MODIFY ("TOID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_TEMPLATE_PARMS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_PARMS" ADD CONSTRAINT "REPCAT$_TEMPLATE_PARMS_U1" UNIQUE ("REFRESH_TEMPLATE_ID", "PARAMETER_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_PARMS" ADD CONSTRAINT "REPCAT$_TEMPLATE_PARMS_PK" PRIMARY KEY ("TEMPLATE_PARAMETER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_PARMS" ADD CONSTRAINT "REPCAT$_TEMPLATE_PARMS_C1" CHECK (user_override in ('Y','N')) ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_PARMS" MODIFY ("PARAMETER_NAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_PARMS" MODIFY ("REFRESH_TEMPLATE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_PRIORITY
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_PRIORITY" ADD CONSTRAINT "REPCAT$_PRIORITY_PK" PRIMARY KEY ("SNAME", "PRIORITY_GROUP", "PRIORITY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_PRIORITY" MODIFY ("PRIORITY" CONSTRAINT "REPCAT$_PRIORITY_NN3" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_PRIORITY" MODIFY ("PRIORITY_GROUP" CONSTRAINT "REPCAT$_PRIORITY_NN2" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_PRIORITY" MODIFY ("SNAME" CONSTRAINT "REPCAT$_PRIORITY_NN1" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGSTDBY$APPLY_MILESTONE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGSTDBY$APPLY_MILESTONE" MODIFY ("FETCHLWM_SCN" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGSTDBY$APPLY_MILESTONE" MODIFY ("PROCESSED_SCN" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGSTDBY$APPLY_MILESTONE" MODIFY ("EPOCH" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGSTDBY$APPLY_MILESTONE" MODIFY ("SYNCH_SCN" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGSTDBY$APPLY_MILESTONE" MODIFY ("COMMIT_SCN" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LOGSTDBY$APPLY_MILESTONE" MODIFY ("SESSION_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HELP
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."HELP" ADD CONSTRAINT "HELP_TOPIC_SEQ" PRIMARY KEY ("TOPIC", "SEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 16384 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."HELP" MODIFY ("SEQ" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."HELP" MODIFY ("TOPIC" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_RESOL_STATS_CONTROL
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_RESOL_STATS_CONTROL" ADD CONSTRAINT "REPCAT$_RESOL_STATS_CTRL_PK" PRIMARY KEY ("SNAME", "ONAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_RESOL_STATS_CONTROL" MODIFY ("STATUS_UPDATE_DATE" CONSTRAINT "REPCAT$_RESOL_STATS_CTRL_NN3" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_RESOL_STATS_CONTROL" MODIFY ("STATUS" CONSTRAINT "REPCAT$_RESOL_STATS_CTRL_NN2" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_RESOL_STATS_CONTROL" MODIFY ("CREATED" CONSTRAINT "REPCAT$_RESOL_STATS_CTRL_NN1" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table LOGMNR_RESTART_CKPT$
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LOGMNR_RESTART_CKPT$" ADD CONSTRAINT "LOGMNR_RESTART_CKPT$_PK" PRIMARY KEY ("SESSION#", "CKPT_SCN", "XIDUSN", "XIDSLT", "XIDSQN", "SESSION_NUM", "SERIAL_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REPCAT$_REPGROUP_PRIVS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_REPGROUP_PRIVS" ADD CONSTRAINT "REPCAT$_REPGROUP_PRIVS_UK" UNIQUE ("USERNAME", "GNAME", "GOWNER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_REPGROUP_PRIVS" MODIFY ("CREATED" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_REPGROUP_PRIVS" MODIFY ("GLOBAL_FLAG" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_REPGROUP_PRIVS" MODIFY ("USERNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_PRIORITY_GROUP
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_PRIORITY_GROUP" ADD CONSTRAINT "REPCAT$_PRIORITY_GROUP_U1" UNIQUE ("SNAME", "PRIORITY_GROUP", "DATA_TYPE_ID", "FIXED_DATA_LENGTH")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_PRIORITY_GROUP" ADD CONSTRAINT "REPCAT$_PRIORITY_GROUP_PK" PRIMARY KEY ("PRIORITY_GROUP", "SNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_PRIORITY_GROUP" ADD CONSTRAINT "REPCAT$_PRIORITY_GROUP_C2" CHECK ((data_type_id in (4, 7) and
                  fixed_data_length is not null)
              or (data_type_id in (1, 2, 3, 5, 6) and
                  fixed_data_length is null)) ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_PRIORITY_GROUP" ADD CONSTRAINT "REPCAT$_PRIORITY_GROUP_C1" CHECK (data_type_id in (1, 2, 3, 4, 5, 6, 7)) ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_PRIORITY_GROUP" MODIFY ("DATA_TYPE_ID" CONSTRAINT "REPCAT$_PRIORITY_GROUP_NN1" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REPCAT$_SITE_OBJECTS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_SITE_OBJECTS" ADD CONSTRAINT "REPCAT$_SITE_OBJECTS_U1" UNIQUE ("TEMPLATE_SITE_ID", "ONAME", "OBJECT_TYPE_ID", "SNAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_SITE_OBJECTS" MODIFY ("OBJECT_TYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_SITE_OBJECTS" MODIFY ("ONAME" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."REPCAT$_SITE_OBJECTS" MODIFY ("TEMPLATE_SITE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RESTRIG
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."RESTRIG" MODIFY ("FECHA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MVIEW$_ADV_FILTER
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_FILTER" ADD CONSTRAINT "MVIEW$_ADV_FILTER_PK" PRIMARY KEY ("FILTERID#", "SUBFILTERNUM#")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_FILTER" MODIFY ("SUBFILTERTYPE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_FILTER" MODIFY ("SUBFILTERNUM#" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_FILTER" MODIFY ("FILTERID#" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table CORREO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."CORREO" ADD CONSTRAINT "CORREO_FK1" FOREIGN KEY ("IDCONTACT")
	  REFERENCES "SYSTEM"."PERSONA" ("IDCONTACT") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DEF$_CALLDEST
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."DEF$_CALLDEST" ADD CONSTRAINT "DEF$_CALL_DESTINATION" FOREIGN KEY ("DBLINK", "CATCHUP")
	  REFERENCES "SYSTEM"."DEF$_DESTINATION" ("DBLINK", "CATCHUP") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DIRECCION
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."DIRECCION" ADD CONSTRAINT "DIRECCION_FK1" FOREIGN KEY ("IDCONTACT")
	  REFERENCES "SYSTEM"."PERSONA" ("IDCONTACT") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_AJG
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_AJG" ADD CONSTRAINT "MVIEW$_ADV_AJG_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "SYSTEM"."MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_BASETABLE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_BASETABLE" ADD CONSTRAINT "MVIEW$_ADV_BASETABLE_FK" FOREIGN KEY ("QUERYID#")
	  REFERENCES "SYSTEM"."MVIEW$_ADV_WORKLOAD" ("QUERYID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_CLIQUE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_CLIQUE" ADD CONSTRAINT "MVIEW$_ADV_CLIQUE_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "SYSTEM"."MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_ELIGIBLE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_ELIGIBLE" ADD CONSTRAINT "MVIEW$_ADV_ELIGIBLE_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "SYSTEM"."MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_EXCEPTIONS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_EXCEPTIONS" ADD CONSTRAINT "MVIEW$_ADV_EXCEPTION_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "SYSTEM"."MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_FILTERINSTANCE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_FILTERINSTANCE" ADD CONSTRAINT "MVIEW$_ADV_FILTERINSTANCE_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "SYSTEM"."MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_FJG
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_FJG" ADD CONSTRAINT "MVIEW$_ADV_FJG_FK" FOREIGN KEY ("AJGID#")
	  REFERENCES "SYSTEM"."MVIEW$_ADV_AJG" ("AJGID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_GC
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_GC" ADD CONSTRAINT "MVIEW$_ADV_GC_FK" FOREIGN KEY ("FJGID#")
	  REFERENCES "SYSTEM"."MVIEW$_ADV_FJG" ("FJGID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_INFO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_INFO" ADD CONSTRAINT "MVIEW$_ADV_INFO_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "SYSTEM"."MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_JOURNAL
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_JOURNAL" ADD CONSTRAINT "MVIEW$_ADV_JOURNAL_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "SYSTEM"."MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_LEVEL
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_LEVEL" ADD CONSTRAINT "MVIEW$_ADV_LEVEL_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "SYSTEM"."MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_OUTPUT
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_OUTPUT" ADD CONSTRAINT "MVIEW$_ADV_OUTPUT_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "SYSTEM"."MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MVIEW$_ADV_ROLLUP
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MVIEW$_ADV_ROLLUP" ADD CONSTRAINT "MVIEW$_ADV_ROLLUP_CFK" FOREIGN KEY ("RUNID#", "CLEVELID#")
	  REFERENCES "SYSTEM"."MVIEW$_ADV_LEVEL" ("RUNID#", "LEVELID#") ENABLE;
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_ROLLUP" ADD CONSTRAINT "MVIEW$_ADV_ROLLUP_FK" FOREIGN KEY ("RUNID#")
	  REFERENCES "SYSTEM"."MVIEW$_ADV_LOG" ("RUNID#") ENABLE;
  ALTER TABLE "SYSTEM"."MVIEW$_ADV_ROLLUP" ADD CONSTRAINT "MVIEW$_ADV_ROLLUP_PFK" FOREIGN KEY ("RUNID#", "PLEVELID#")
	  REFERENCES "SYSTEM"."MVIEW$_ADV_LEVEL" ("RUNID#", "LEVELID#") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_AUDIT_COLUMN
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_AUDIT_COLUMN" ADD CONSTRAINT "REPCAT$_AUDIT_COLUMN_F1" FOREIGN KEY ("ATTRIBUTE")
	  REFERENCES "SYSTEM"."REPCAT$_AUDIT_ATTRIBUTE" ("ATTRIBUTE") ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_AUDIT_COLUMN" ADD CONSTRAINT "REPCAT$_AUDIT_COLUMN_F2" FOREIGN KEY ("BASE_SNAME", "BASE_ONAME", "BASE_CONFLICT_TYPE_ID", "BASE_REFERENCE_NAME")
	  REFERENCES "SYSTEM"."REPCAT$_CONFLICT" ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_DDL
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_DDL" ADD CONSTRAINT "REPCAT$_DDL_PRNT" FOREIGN KEY ("LOG_ID", "SOURCE", "ROLE", "MASTER")
	  REFERENCES "SYSTEM"."REPCAT$_REPCATLOG" ("ID", "SOURCE", "ROLE", "MASTER") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_FLAVORS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_FLAVORS" ADD CONSTRAINT "REPCAT$_FLAVORS_FK1" FOREIGN KEY ("GNAME", "GOWNER")
	  REFERENCES "SYSTEM"."REPCAT$_REPCAT" ("SNAME", "GOWNER") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_FLAVOR_OBJECTS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_FLAVOR_OBJECTS" ADD CONSTRAINT "REPCAT$_FLAVOR_OBJECTS_FK1" FOREIGN KEY ("GNAME", "GOWNER")
	  REFERENCES "SYSTEM"."REPCAT$_REPCAT" ("SNAME", "GOWNER") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_FLAVOR_OBJECTS" ADD CONSTRAINT "REPCAT$_FLAVOR_OBJECTS_FK2" FOREIGN KEY ("GNAME", "FLAVOR_ID", "GOWNER")
	  REFERENCES "SYSTEM"."REPCAT$_FLAVORS" ("GNAME", "FLAVOR_ID", "GOWNER") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_GENERATED
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_GENERATED" ADD CONSTRAINT "REPCAT$_REPGEN_PRNT" FOREIGN KEY ("SNAME", "ONAME", "TYPE")
	  REFERENCES "SYSTEM"."REPCAT$_REPOBJECT" ("SNAME", "ONAME", "TYPE") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_GENERATED" ADD CONSTRAINT "REPCAT$_REPGEN_PRNT2" FOREIGN KEY ("BASE_SNAME", "BASE_ONAME", "BASE_TYPE")
	  REFERENCES "SYSTEM"."REPCAT$_REPOBJECT" ("SNAME", "ONAME", "TYPE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_GROUPED_COLUMN
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_GROUPED_COLUMN" ADD CONSTRAINT "REPCAT$_GROUPED_COLUMN_F1" FOREIGN KEY ("SNAME", "ONAME", "GROUP_NAME")
	  REFERENCES "SYSTEM"."REPCAT$_COLUMN_GROUP" ("SNAME", "ONAME", "GROUP_NAME") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_INSTANTIATION_DDL
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_INSTANTIATION_DDL" ADD CONSTRAINT "REPCAT$_INSTANTIATION_DDL_FK1" FOREIGN KEY ("REFRESH_TEMPLATE_ID")
	  REFERENCES "SYSTEM"."REPCAT$_REFRESH_TEMPLATES" ("REFRESH_TEMPLATE_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_KEY_COLUMNS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_KEY_COLUMNS" ADD CONSTRAINT "REPCAT$_KEY_COLUMNS_PRNT" FOREIGN KEY ("SNAME", "ONAME", "TYPE")
	  REFERENCES "SYSTEM"."REPCAT$_REPOBJECT" ("SNAME", "ONAME", "TYPE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_OBJECT_PARMS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_OBJECT_PARMS" ADD CONSTRAINT "REPCAT$_OBJECT_PARMS_FK1" FOREIGN KEY ("TEMPLATE_PARAMETER_ID")
	  REFERENCES "SYSTEM"."REPCAT$_TEMPLATE_PARMS" ("TEMPLATE_PARAMETER_ID") ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_OBJECT_PARMS" ADD CONSTRAINT "REPCAT$_OBJECT_PARMS_FK2" FOREIGN KEY ("TEMPLATE_OBJECT_ID")
	  REFERENCES "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS" ("TEMPLATE_OBJECT_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_PARAMETER_COLUMN
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_PARAMETER_COLUMN" ADD CONSTRAINT "REPCAT$_PARAMETER_COLUMN_F1" FOREIGN KEY ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME", "SEQUENCE_NO")
	  REFERENCES "SYSTEM"."REPCAT$_RESOLUTION" ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME", "SEQUENCE_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_PRIORITY
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_PRIORITY" ADD CONSTRAINT "REPCAT$_PRIORITY_F1" FOREIGN KEY ("PRIORITY_GROUP", "SNAME")
	  REFERENCES "SYSTEM"."REPCAT$_PRIORITY_GROUP" ("PRIORITY_GROUP", "SNAME") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_REFRESH_TEMPLATES
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_REFRESH_TEMPLATES" ADD CONSTRAINT "REPCAT$_REFRESH_TEMPLATES_FK1" FOREIGN KEY ("TEMPLATE_TYPE_ID")
	  REFERENCES "SYSTEM"."REPCAT$_TEMPLATE_TYPES" ("TEMPLATE_TYPE_ID") ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_REFRESH_TEMPLATES" ADD CONSTRAINT "REPCAT$_REFRESH_TEMPLATES_FK2" FOREIGN KEY ("TEMPLATE_STATUS_ID")
	  REFERENCES "SYSTEM"."REPCAT$_TEMPLATE_STATUS" ("TEMPLATE_STATUS_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_REPCOLUMN
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_REPCOLUMN" ADD CONSTRAINT "REPCAT$_REPCOLUMN_FK" FOREIGN KEY ("SNAME", "ONAME", "TYPE")
	  REFERENCES "SYSTEM"."REPCAT$_REPOBJECT" ("SNAME", "ONAME", "TYPE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_REPGROUP_PRIVS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_REPGROUP_PRIVS" ADD CONSTRAINT "REPCAT$_REPGROUP_PRIVS_FK" FOREIGN KEY ("GNAME", "GOWNER")
	  REFERENCES "SYSTEM"."REPCAT$_REPCAT" ("SNAME", "GOWNER") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_REPOBJECT
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_REPOBJECT" ADD CONSTRAINT "REPCAT$_REPOBJECT_PRNT" FOREIGN KEY ("GNAME", "GOWNER")
	  REFERENCES "SYSTEM"."REPCAT$_REPCAT" ("SNAME", "GOWNER") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_REPPROP
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_REPPROP" ADD CONSTRAINT "REPCAT$_REPPROP_PRNT" FOREIGN KEY ("SNAME", "ONAME", "TYPE")
	  REFERENCES "SYSTEM"."REPCAT$_REPOBJECT" ("SNAME", "ONAME", "TYPE") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_REPSCHEMA
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_REPSCHEMA" ADD CONSTRAINT "REPCAT$_REPSCHEMA_DEST" FOREIGN KEY ("DBLINK", "EXTENSION_ID")
	  REFERENCES "SYSTEM"."DEF$_DESTINATION" ("DBLINK", "CATCHUP") ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_REPSCHEMA" ADD CONSTRAINT "REPCAT$_REPSCHEMA_PRNT" FOREIGN KEY ("SNAME", "GOWNER")
	  REFERENCES "SYSTEM"."REPCAT$_REPCAT" ("SNAME", "GOWNER") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_RESOLUTION
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_RESOLUTION" ADD CONSTRAINT "REPCAT$_RESOLUTION_F1" FOREIGN KEY ("CONFLICT_TYPE_ID", "METHOD_NAME")
	  REFERENCES "SYSTEM"."REPCAT$_RESOLUTION_METHOD" ("CONFLICT_TYPE_ID", "METHOD_NAME") ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_RESOLUTION" ADD CONSTRAINT "REPCAT$_RESOLUTION_F3" FOREIGN KEY ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME")
	  REFERENCES "SYSTEM"."REPCAT$_CONFLICT" ("SNAME", "ONAME", "CONFLICT_TYPE_ID", "REFERENCE_NAME") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_SITES_NEW
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_SITES_NEW" ADD CONSTRAINT "REPCAT$_SITES_NEW_FK1" FOREIGN KEY ("EXTENSION_ID")
	  REFERENCES "SYSTEM"."REPCAT$_EXTENSION" ("EXTENSION_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_SITES_NEW" ADD CONSTRAINT "REPCAT$_SITES_NEW_FK2" FOREIGN KEY ("GNAME", "GOWNER")
	  REFERENCES "SYSTEM"."REPCAT$_REPCAT" ("SNAME", "GOWNER") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_SITE_OBJECTS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_SITE_OBJECTS" ADD CONSTRAINT "REPCAT$_SITE_OBJECTS_FK1" FOREIGN KEY ("OBJECT_TYPE_ID")
	  REFERENCES "SYSTEM"."REPCAT$_OBJECT_TYPES" ("OBJECT_TYPE_ID") ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_SITE_OBJECTS" ADD CONSTRAINT "REPCAT$_SITE_OBJECT_FK2" FOREIGN KEY ("TEMPLATE_SITE_ID")
	  REFERENCES "SYSTEM"."REPCAT$_TEMPLATE_SITES" ("TEMPLATE_SITE_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_TEMPLATE_OBJECTS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS" ADD CONSTRAINT "REPCAT$_TEMPLATE_OBJECTS_FK1" FOREIGN KEY ("REFRESH_TEMPLATE_ID")
	  REFERENCES "SYSTEM"."REPCAT$_REFRESH_TEMPLATES" ("REFRESH_TEMPLATE_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_OBJECTS" ADD CONSTRAINT "REPCAT$_TEMPLATE_OBJECTS_FK3" FOREIGN KEY ("OBJECT_TYPE")
	  REFERENCES "SYSTEM"."REPCAT$_OBJECT_TYPES" ("OBJECT_TYPE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_TEMPLATE_PARMS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_PARMS" ADD CONSTRAINT "REPCAT$_TEMPLATE_PARMS_FK1" FOREIGN KEY ("REFRESH_TEMPLATE_ID")
	  REFERENCES "SYSTEM"."REPCAT$_REFRESH_TEMPLATES" ("REFRESH_TEMPLATE_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_TEMPLATE_REFGROUPS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_TEMPLATE_REFGROUPS" ADD CONSTRAINT "REPCAT$_TEMPLATE_REFGROUPS_FK1" FOREIGN KEY ("REFRESH_TEMPLATE_ID")
	  REFERENCES "SYSTEM"."REPCAT$_REFRESH_TEMPLATES" ("REFRESH_TEMPLATE_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_USER_AUTHORIZATIONS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_USER_AUTHORIZATIONS" ADD CONSTRAINT "REPCAT$_USER_AUTHORIZATION_FK2" FOREIGN KEY ("REFRESH_TEMPLATE_ID")
	  REFERENCES "SYSTEM"."REPCAT$_REFRESH_TEMPLATES" ("REFRESH_TEMPLATE_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REPCAT$_USER_PARM_VALUES
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."REPCAT$_USER_PARM_VALUES" ADD CONSTRAINT "REPCAT$_USER_PARM_VALUES_FK1" FOREIGN KEY ("TEMPLATE_PARAMETER_ID")
	  REFERENCES "SYSTEM"."REPCAT$_TEMPLATE_PARMS" ("TEMPLATE_PARAMETER_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TELEFONO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."TELEFONO" ADD CONSTRAINT "TELEFONO_FK1" FOREIGN KEY ("IDCONTACT")
	  REFERENCES "SYSTEM"."PERSONA" ("IDCONTACT") ENABLE;

const Map<String, String> machineNameMap = {"쇼트블라스트": "ShotBlast", "인산염피막기": "AROPump", "비형상도포기": "DispensingMachine", "진공펌프": "VacuumPump"};
const List machineList = ["쇼트블라스트", "인산염피막기", "비형상도포기", "진공펌프"];

const BASE_URL = "http://182.228.122.118:8445";
const DATE_FORMAT = "yyyy-MM-dd";
//const String BASE_URL = "http://192.168.0.8:8080";

const ANOMALY_EVENT = "anomaly";


//******* REQUEST URL *******//
const SHOT_BLAST_URL = "/sio/ShotBlast";
const ARO_PUMP_URL = "/sio/AROPump";
const DISPENSING_MACHINE_URL = "/sio/DispensingMachine";
const VACUUM_PUMP1_URL = "/sio/VacuumPump1";
const VACUUM_PUMP2_URL = "/sio/VacuumPump2";


//******* CHANNEL NAME *******//
const SHOT_BLAST_CHANNEL_NAME = 'shot_blast_vib';

const ARO_PUMP1_CHANNEL_NAME = "aro_vib1";
const ARO_PUMP2_CHANNEL_NAME = "aro_vib2";

const DISPENSING_MACHINE_CHANNEL_NAME = 'dispensing_vib';

const VACUUM_PUMP1_CHANNEL_NAME = "pump1_vib";
const VACUUM_PUMP2_CHANNEL_NAME = "pump2_vib";
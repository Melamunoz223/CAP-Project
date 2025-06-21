using {proyecto.mym as entities} from '../db/schema';

service MyService {

    entity Orders    as projection on entities.Orders;
    entity Items     as projection on entities.Items;
    entity VH_Status as projection on entities.Status;

}

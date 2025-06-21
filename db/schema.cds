namespace proyecto.mym;
using {
    /* cuid,
    managed, */
    sap.common.CodeList,
    sap.common.Currencies
  /*   sap.common.Currencies */
} from '@sap/cds/common';

entity Orders {
    key id           : String(36);
        email        : String(30);
        firstname    : String(30);
        lastname     : String;
        country      : String(30);
        createon     : Date;
        deliverydate : DateTime;
        orderestatus : Association to Status;
        imageurl     : String;
        toitems      : Composition of many Items on  toitems.IdHead = $self ;
};

entity Items {
    key Id              : String(36);
        name            : String(40);
        description     : String(40);
        releasedate     : Date;
        discontinuedate : Date;
        price           : Decimal(12, 2);
        currency        : Association to Currencies;
        height          : Decimal(15, 3);
        width           : Decimal(13, 3);
        depth           : Decimal(12, 2);
        quantity        : Decimal(16, 2);
        unitofmeasure   : String default 'CM';
        IdHead          :  Association to Orders;
};

//VH

entity Status : CodeList{
    key code         : String(20) enum {
            Canceled = 'Canceled';
            Inprogress = 'In progress';
            LowAvailability = 'Low Availability';
        };
    criticality : Integer;

};

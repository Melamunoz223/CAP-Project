using {proyecto.mym as services} from '../service';

/* annotate services.Items with @odata.draft.enabled ; */

annotate services.Items with {
    Id              @title: 'Id';
    IdHead          @title: 'Id Head';
    name            @title: 'Name';
    description     @title: 'Description';
    releasedate     @title: 'Release Date';
    discontinuedate @title: 'Descontinue Date';
    price           @title: 'Price'     @Measures.ISOCurrency: currency_code; //soy un precio y estoy asociado a la moneda currency
    currency        @title: 'Currency'  @Common.IsCurrency; //asociasion a la moneda
    height          @title: 'Height'    @Measures.Unit       : unitofmeasure;
    width           @title: 'Width'     @Measures.Unit       : unitofmeasure;
    depth           @title: 'Depth'     @Measures.Unit       : unitofmeasure;
    quantity        @title: 'Quantity';
    unitofmeasure   @title: 'Unitfmeasur';


};


annotate services.Items with @(
    UI.HeaderInfo: { //información de la cabecera
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Item',
        TypeNamePlural: 'Items',
        Title         : {
            $Type: 'UI.DataField',
            Value: name,
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: description,
        },
    },

    UI.LineItem  : [ //para agregarlos en columnas a la interfaz
        {
            $Type                : 'UI.DataField',
            Value                : Id,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '6rem'

            },
        },
        {
            $Type: 'UI.DataField',
            Value: name
        },
        {
            $Type: 'UI.DataField',
            Value: description
        },
        {
            $Type: 'UI.DataField',
            Value: releasedate
        },
        {
            $Type: 'UI.DataField',
            Value: discontinuedate
        },
        {
            $Type: 'UI.DataField',
            Value: price
        },

        {
            $Type: 'UI.DataField',
            Value: height
        },
        {
            $Type: 'UI.DataField',
            Value: width
        },

        {
            $Type: 'UI.DataField',
            Value: depth
        },

        {
            $Type: 'UI.DataField',
            Value: quantity
        },


    ],
);

annotate services.Items with @(
    UI.FieldGroup #Item: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: Id,
            },
            {
                $Type: 'UI.DataField',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Value: description,
            },
            {
                $Type: 'UI.DataField',
                Value: releasedate,
            },
            {
                $Type: 'UI.DataField',
                Value: discontinuedate,
            },
            {
                $Type: 'UI.DataField',
                Value: price,
            },
            {
                $Type: 'UI.DataField',
                Value: height,
            },
            {
                $Type: 'UI.DataField',
                Value: width,
            },
            {
                $Type: 'UI.DataField',
                Value: depth,
            },
            {
                $Type: 'UI.DataField',
                Value: quantity,
            },
            {
                $Type: 'UI.DataField',
                Value: unitofmeasure,
            },
        ],
    },
    UI.Facets          : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#Item',
        Label : 'iTEMS'
    }, ],
);

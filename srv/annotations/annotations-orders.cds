using {proyecto.mym as services} from '../service';
using from './annotations-items';

annotate services.Orders with @odata.draft.enabled; //crea la draft para hacer el crud, hace el crud automatico

annotate services.Orders with {

    id           @title: 'Id';
    email        @title: 'Email';
    firstname    @title: 'First Name';
    lastname     @title: 'Last Name';
    country      @title: 'Country';
    createon     @title: 'Create On';
    deliverydate @title: 'Delivery Date';
    orderestatus @title: 'Order Status';
    imageurl     @title: 'Image' /* @UI.IsImageURL */;
};


annotate services.Orders with {
    orderestatus @Common: {
        Text           : orderestatus.name, //muestre el nombre del stado y no el cod
        TextArrangement: #TextOnly, //solo muestre el texto
    };
    id           @Common: {ValueList: { //en el filtro salga el listado
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Orders', //el campo del que va a hacer la lista
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: id, //campo donde se va a almacenar
                ValueListProperty: 'id',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly', //que este campo aparezca también en el listado del filtro
                ValueListProperty: 'firstname',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'lastname',
            },
        ],
    }, };
    firstname    @Common: {ValueList: { //en el filtro salga el listado
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Orders', //el campo del que va a hacer la lista
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: firstname, //campo donde se va a almacenar
                ValueListProperty: 'firstname',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'lastname',
            },
        ],
    }, };
    lastname     @Common: {ValueList: { //en el filtro salga el listado
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Orders', //el campo del que va a hacer la lista
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: lastname, //campo donde se va a almacenar
                ValueListProperty: 'lastname',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly', //que este campo aparezca también en el listado del filtro
                ValueListProperty: 'firstname',
            },
        ],
    }, };
    country      @Common: {ValueList: { //en el filtro salga el listado
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Orders', //el campo del que va a hacer la lista
        Parameters    : [{
            $Type            : 'Common.ValueListParameterInOut',
            LocalDataProperty: country, //campo donde se va a almacenar
            ValueListProperty: 'country', // el campo que se va a guardar
        }, ],
    }, };
};

annotate services.Orders with @(
    Common.SemanticKey  : [id //para que el id, que es la clave quede en negrilla
    ],

    UI.HeaderInfo       : { //información de la cabecera
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Order',
        TypeNamePlural: 'Orders',
        Title         : { //titulo del object page(navegación en la orden )
            $Type: 'UI.DataField',
            Value: id
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: createon
        },
        ImageUrl      : {$value: imageurl, },

    },

    UI.SelectionFields  : [ //anotación para filtros de busqueda
        id,
        firstname,
        lastname,
        country,
        orderestatus_code,

    ],

    UI.LineItem         : [
        {
            $Type: 'UI.DataField',
            Value: imageurl
        }, //para agregarlos en columnas a la interfaz
{
            $Type                : 'UI.DataField',
            Value                : id,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '6rem'
 
            },
        },
        {
            $Type: 'UI.DataField',
            Value: email
        },
        {
            $Type: 'UI.DataField',
            Value: firstname
        },
        {
            $Type: 'UI.DataField',
            Value: lastname
        },
        {
            $Type      : 'UI.DataField',
            Value      : orderestatus_code,
            Criticality: orderestatus.criticality,
        },
        {
            $Type: 'UI.DataField',
            Value: country
        },
        {
            $Type: 'UI.DataField',
            Value: createon
        },
        {
            $Type: 'UI.DataField',
            Value: deliverydate
        },
        {
            $Type        : 'UI.DataField',
            Value        : imageurl,
         ![@UI.Hidden],
        }
    ],


    UI.FieldGroup #Image: {
        $Type: 'UI.FieldGroupType',
        Data : [{
            $Type: 'UI.DataField',
            Value: imageurl,
            Label: ''
        }]
    },
    UI.FieldGroup #order: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                //Agrupar la info despues de la navegación
                Value: id,
            },
            {
                $Type: 'UI.DataField',
                //Agrupar la info despues de la n
                Value: firstname,
            },
            {
                $Type: 'UI.DataField',
                //Agrupar la info despues de la n
                Value: lastname,
            },
            {
                $Type: 'UI.DataField',
                //Agrupar la info despues de la n
                Value: country,
            },
            {
                $Type: 'UI.DataField',
                //Agrupar la info despues de la n
                Value: createon,
            },
            {
                $Type: 'UI.DataField',
                //Agrupar la info despues de la n
                Value: deliverydate,
            },
            {
                $Type      : 'UI.DataField',
                //Agrupar la info despues de la n
                Value      : orderestatus_code,
                Criticality: orderestatus.criticality,
            },
            {
                $Type: 'UI.DataField',
                //Agrupar la info despues de la n
                Value: imageurl,
            },

        ],
    },

    UI.Facets           : [
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#order',
            Label : 'ORDER'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: 'toitems/@UI.LineItem',
            Label : 'ITEMS'
        },

    ],
/*     UI.HeaderFacets     : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#Image',
        Label : '',
    }, ], */
);

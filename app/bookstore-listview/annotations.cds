using Bookstore as service from '../../srv/service';
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'genre',
                Value : genre,
            },
            {
                $Type : 'UI.DataField',
                Label : 'publishedAt',
                Value : publishedAt,
            },
            {
                $Type : 'UI.DataField',
                Label : 'pages',
                Value : pages,
            },
            {
                $Type : 'UI.DataField',
                Label : 'price',
                Value : price,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'genre',
            Value : genre,
        },
        {
            $Type : 'UI.DataField',
            Label : 'publishedAt',
            Value : publishedAt,
        },
        {
            $Type : 'UI.DataField',
            Label : 'pages',
            Value : pages,
        },
        {
            $Type : 'UI.DataField',
            Label : 'price',
            Value : price,
        },
    ],
    UI.SelectionFields : [
        title,
        genre,
        price,
    ],
    UI.DataPoint #pages : {
        Value : pages,
        Visualization : #Rating,
        TargetValue : 5,
    },
    UI.DataPoint #price : {
        Value : price,
        Visualization : #Progress,
        TargetValue : 100,
    },
);

annotate service.Books with {
    author @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Authors',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : author_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
        ],
    }
};

annotate service.Books with {
    title @Common.Label : 'Title'
};

annotate service.Books with {
    genre @Common.Label : 'Genre'
};

annotate service.Books with {
    price @Common.Label : 'Price'
};


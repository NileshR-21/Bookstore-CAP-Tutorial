using Bookstore as service from '../../srv/service';
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : genre,
            },
            {
                $Type : 'UI.DataField',
                Value : status_code,
                Criticality : status.criticality,
                CriticalityRepresentation : #WithIcon,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Price',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Published At',
                Value : publishedAt,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Info',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Entry Info',
            ID : 'EntryInfo',
            Target : '@UI.FieldGroup#EntryInfo',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Chapters',
            ID : 'Chapters',
            Target : 'Chapters/@UI.LineItem#Chapters',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'Status',
            Criticality : status.criticality,
            CriticalityRepresentation : #WithIcon,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Genre',
            Value : genre,
        },
        {
            $Type : 'UI.DataField',
            Value : author.name,
            Label : 'Author Name',
        },
        {
            $Type : 'UI.DataField',
            Label : 'Published At',
            Value : publishedAt,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Pages',
            Value : pages,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Price',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedAt,
        },
    ],
    UI.SelectionFields : [
        title,
        genre,
        price,
        status_code,
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
    UI.HeaderInfo : {
        TypeName : 'Book',
        TypeNamePlural : 'Books',
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeImageUrl : 'sap-icon://course-book',
        Description : {
            $Type : 'UI.DataField',
            Value : author.name,
        },
    },
    UI.FieldGroup #EntryInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
        ],
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

annotate service.Chapters with @(
    UI.LineItem #Chapters : [
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.title,
            Label : 'Title',
        },
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.number,
            Label : 'Number',
        },
        {
            $Type : 'UI.DataField',
            Value : book.Chapters.pages,
            Label : 'Pages',
        },
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : 'Chapter',
        TypeNamePlural : 'Chapters',
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General Info',
            ID : 'GeneralInfo',
            Target : '@UI.FieldGroup#GeneralInfo',
        },
    ],
    UI.FieldGroup #GeneralInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : number,
                Label : 'Number',
            },
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : 'Title',
            },
            {
                $Type : 'UI.DataField',
                Value : pages,
                Label : 'Pages',
            },
        ],
    },
);

annotate service.Books with {
    status @(
        Common.Label : 'Status',
        Common.Text : status.displayText,
        Common.Text.@UI.TextArrangement : #TextOnly,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Bookstatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status_code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Bookstatus with {
    code @(
        Common.Text : displayText,
        Common.Text.@UI.TextArrangement : #TextOnly,
)};


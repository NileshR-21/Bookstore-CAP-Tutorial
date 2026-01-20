using {
    cuid,
    managed
} from '@sap/cds/common';

namespace tutorial.db;

entity Books : cuid, managed {
    status      : Association to Bookstatus;
    title       : String;
    author      : Association to Authors;
    genre       : String;
    publishedAt : Date;
    pages       : Integer;
    price       : Decimal(3, 2);
    Chapters    : Composition of many Chapter
                      on Chapters.book = $self;
}

entity Bookstatus {
    key code        : String(1) enum {
            Available = 'A';
            Low_Stock = 'L';
            Unavailable = 'U';
        }
        criticality : Integer;
        displayText : String;
}

entity Authors : cuid, managed {
    name  : String;
    books : Association to many Books
                on books.author = $self;
}

entity Chapter : cuid, managed {
    key book   : Association to Books;
        number : Integer;
        title  : String;
        pages  : Integer;
}

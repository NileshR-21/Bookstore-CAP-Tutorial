using {
    cuid,
    managed,
    sap.common.Currencies
} from '@sap/cds/common';

namespace tutorial.db;

entity Books : cuid, managed {
    status      : Association to Bookstatus;
    title       : String;
    author      : Association to Authors;
    genre       : Association to Genres;
    publishedAt : Date;
    pages       : Integer;
    price       : Decimal(3, 2);
    currency    : Association to Currencies;
    Chapters    : Composition of many Chapter
                      on Chapters.book = $self;
}

entity Genres {
    key code : GenreType;
        description : String;
}

type GenreType : String enum{
    Dystopian = 'Dystopian';
    Political = 'Political';
    Fantasy = 'Fantasy';
    History = 'History';
    Fiction = 'Fiction';
    Romance = 'Romance';
    Thriller = 'Thriller';
    Biography = 'Biography';
    Mystery = 'Mystery';
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

using {
    cuid,
    managed
} from '@sap/cds/common';

namespace tutorial.db;

entity Books : cuid, managed {
    title  : String;
    author : Association to Authors;
    genre: String;
    publishedAt: Date;
    pages: Integer;
    price: Decimal(3, 2);
    Chapters : Composition of many Chapter on Chapters.book = $self;
}

entity Authors : cuid, managed {
    name  : String;
    books : Association to many Books
                on books.author = $self;
}

entity Chapter : cuid, managed {
    number : Integer;
    key book : Association to Books;
}

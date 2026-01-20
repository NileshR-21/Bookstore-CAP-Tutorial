using {tutorial.db as db} from '../db/schema';

service Bookstore {
    entity Books    as projection on db.Books;
    entity Authors  as projection on db.Authors;
    entity Chapters as projection on db.Chapter;
    entity Bookstatus as projection on db.Bookstatus;
}

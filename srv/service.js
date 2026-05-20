const { Books } = require('#cds-models/Bookstore')
const { GenreType } = require('#cds-models/tutorial/db')
const cds = require('@sap/cds')

module.exports = class Bookstore extends cds.ApplicationService { 
  init() {

    // const { Books } = cds.entities('Bookstore')
    // const { Books, Bookstatus, Authors, GenresVH, Chapters } = cds.entities('Bookstore')


    // this.before (['CREATE', 'UPDATE'], Books, async (req) => {
    //   console.log('Before CREATE/UPDATE Books', req.data)
    // })
    this.before ('READ', Books, async (req) => {
      console.log('Before READ Books')
    })
    
    this.on ('READ', Books, async (req, next) => {
      console.log('On READ Books')
      return next()
    })

    this.after ('READ', Books, async (books, req) => {
      for (const book of books) {
        if (book.genre_code === GenreType.Fantasy) {
          book.price = book.price * 0.9 // Apply a 10% discount for fantasy books
          book.title = '(Special Offer) ' + book.title // Append a note to the title
        }
      }
      
      console.log('After READ Books')
    })

    // this.before (['CREATE', 'UPDATE'], Bookstatus, async (req) => {
    //   console.log('Before CREATE/UPDATE Bookstatus', req.data)
    // })
    // this.after ('READ', Bookstatus, async (bookstatus, req) => {
    //   console.log('After READ Bookstatus', bookstatus)
    // })
    // this.before (['CREATE', 'UPDATE'], Authors, async (req) => {
    //   console.log('Before CREATE/UPDATE Authors', req.data)
    // })
    // this.after ('READ', Authors, async (authors, req) => {
    //   console.log('After READ Authors', authors)
    // })
    // this.before (['CREATE', 'UPDATE'], GenresVH, async (req) => {
    //   console.log('Before CREATE/UPDATE GenresVH', req.data)
    // })
    // this.after ('READ', GenresVH, async (genresVH, req) => {
    //   console.log('After READ GenresVH', genresVH)
    // })
    // this.before (['CREATE', 'UPDATE'], Chapters, async (req) => {
    //   console.log('Before CREATE/UPDATE Chapters', req.data)
    // })
    // this.after ('READ', Chapters, async (chapters, req) => {
    //   console.log('After READ Chapters', chapters)
    // })


    return super.init()
  }
}

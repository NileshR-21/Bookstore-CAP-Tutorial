//Before the action happens
this.before('READ', Books, async (req) => {
    console.log('Before READ Books');
    // You can modify the request or perform any necessary actions here
}); 

//During the action handling
this.on('READ', Books, async (req, next) => {
    console.log('On READ Books');
    return next(); // Call the next handler to continue processing the request
});

//After the action has been completed
this.after('READ', Books, async (req, res) => {
    console.log('After READ Books');        
    // You can perform the main action for reading books here
});

let lotion = require('lotion');

let app = lotion({
    initialState: {
        title:"",
        
        document_number: 0
    },
    rpcPort: 8000
});

function transactionHandler(state, transaction) {
    if (state.count === transaction.nonce) {
        state.count++
    }
}

app.use(transactionHandler);
app.start().then(appInfo => console.log(appInfo.GCI));

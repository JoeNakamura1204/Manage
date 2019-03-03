
let lotion = require('lotion');

let app = lotion({
    initialState: {
        document_number:0,
        document_db_id:0,
        content_hash:""
    },
    rpcPort: 8000
});

function documentHandler(state, transaction) {
    if (transaction.document_db_id && transaction.content_hash){
        state.document_number++;
        state.document_db_id= transaction.document_db_id;
        state.content_hash= transaction.content_hash;
    }else{
        console.log("Something Wrong")
    }
}

app.use(documentHandler);
app.start().then(appInfo => console.log(appInfo.GCI));

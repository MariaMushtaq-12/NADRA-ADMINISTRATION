//imports 

var express = require('express');
const bodyParser = require("body-parser");
const res = require('express/lib/response');
var app = express();
var router;
app.use(bodyParser.urlencoded({ extended: true }));
var meradatabase = require('./databaseconnection');
const req = require('express/lib/request');
//static files specifications
app.use(express.static("internals"));
app.use("/css", express.static(__dirname + "internals/css"));
app.use("/js", express.static(__dirname + "internals/js"));
app.use("/img", express.static(__dirname + "internals/img"));
//displaying the views
app.set("views", "./views");
app.set("view engine", "ejs");
//
app.get("", (req, res) => {
        res.render("index");
    })
    //all the three registeration forms
app.get("/regform", (req, res) => {
    res.render("regform");
})
app.get("/maleregform", (req, res) => {
    res.render("maleregform");
})
app.get("/femaleregform", (req, res) => {
    res.render("femaleregform");
})

app.get("/marriage", (req, res) => {
    res.render("marriage");
})
app.get("/bform", (req, res) => {
    res.render("bform");
})
app.get("/searchRec", (req, res) => {
    res.render("searchRec");
})
app.get("/cardRenewal", (req, res) => {
    res.render("cardRenewal");
})

//declaring variables to store the results of the search
// var fname;
// var lname;
// var fcnic;
// var dob;
// var address;
// var city;
// var district;
// var province;
// var status;

//this code is used to handle the search operation we do 
app.post('/search', (req, res) => {
    //res.send(`cnic is ${req.body.CNIC}`);
    console.log(req.body);
    var myQuery = `SELECT * FROM male where cnic = ${req.body.CNIC}`;
    meradatabase.query(myQuery, (e, rows, fields) => {
        if (e) {
            throw e;
            res.send("record not found");
        } else {
            if (rows.length == 0) {
                var myQuery = `SELECT * FROM female where cnic = ${req.body.CNIC}`;
                meradatabase.query(myQuery, (e, rows, fields) => {
                    if (e) { throw e } else {
                        if (rows.length == 0) {
                            res.send("wrong CNIC entry!!!")
                        } else {
                            res.render("searchRec", { data: rows[0] })
                        }
                    }
                })
            } else {
                res.render("searchRec", { data: rows[0] })
            }
        }


    })
});

//these post requests are used for the addition of the data to the database
app.post('/adding', (req, res) => {
    //res.send(`cnic is ${req.body.CNIC}`);
    console.log(req.body);
    if (req.body.gender == "Male") {
        res.render('maleregform', { data: req.body });
    } else {
        res.render('femaleregform', { data: req.body });
    }





});
app.post('/maleadding', (req, res) => {
    var query = `select cnic from randomcnic limit 1`;
    var generatedCnic;
    meradatabase.query(query, (e, rows, fields) => {
        if (e) {
            throw e;
            res.send("record not found");
        } else {

            console.log(req.body)
            query1 = `insert into district_table values ('${req.body.district}','${req.body.province}')`;
            meradatabase.query(query1, (e, rows, fields) => {
                if (e) {
                    throw e;

                }
            })
            query2 = `insert into city_table values('${req.body.city}','${req.body.district}');`;
            meradatabase.query(query2, (e, rows, fields) => {
                if (e) {
                    throw e;

                }
            })
            query3 = `insert into male values(${rows[0].cnic},'male','${req.body.first_name}','${req.body.last_name}',${req.body.father_CNIC},'${req.body.DOB}','${req.body.address}','${req.body.city}','${req.body.marital_status}');`;
            meradatabase.query(query3, (e, rows, fields) => {
                    if (e) {
                        throw e;

                    }
                })
                //after the data has been registered properly we delete that cnic value from our randomcnic table
            query = `delete from randomcnic where cnic=${rows[0].cnic}`
            meradatabase.query(query, (e, rows, fields) => {
                if (e) {
                    throw e;
                    res.send("record not found");
                }
            })

            res.render("regform")
        }


    })



});
app.post('/femaleadding', (req, res) => {


    var query = `select cnic from male where cnic = ${req.body.husband_cnic}`;
    meradatabase.query(query, (e, mrows, fields) => {
        if (e) {
            throw e;
            res.send("record not found");
        } else {
            console.log(mrows)
            if (mrows.length == 0) {
                res.render('regform');
            } else {
                var query = `select cnic from randomcnic limit 1`;
                console.log(req.body)
                meradatabase.query(query, (e, rows, fields) => {
                    if (e) {
                        throw e;

                    }
                    //to set the male is married
                    query0 = `update male set marital_status='married' where cnic=${req.body.husband_cnic}`
                    meradatabase.query(query0, (e, rows, fields) => {
                        if (e) {
                            throw e;

                        }
                    })
                    query1 = `insert into district_table values ('${req.body.district}','${req.body.province}')`;
                    meradatabase.query(query1, (e, rows, fields) => {
                        if (e) {
                            throw e;

                        }
                    })
                    query2 = `insert into city_table values('${req.body.city}','${req.body.district}');`;
                    meradatabase.query(query2, (e, rows, fields) => {
                        if (e) {
                            throw e;

                        }
                    })
                    query3 = `insert into female values(${rows[0].cnic},'female','${req.body.first_name}','${req.body.last_name}',${req.body.father_CNIC},${req.body.husband_cnic},'${req.body.DOB}','${req.body.address}','${req.body.city}','${req.body.marital_status}');`;
                    meradatabase.query(query3, (e, rows, fields) => {
                            if (e) {
                                throw e;

                            }
                        })
                        //after the data has been registered properly we delete that cnic value from our randomcnic table
                    query = `delete from randomcnic where cnic=${rows[0].cnic}`
                    meradatabase.query(query, (e, rows, fields) => {
                        if (e) {
                            throw e;
                            res.send("record not found");
                        }
                    })

                    res.render("regform")
                })
            }

        }
    })
});
//post request for marriage certificate
app.post('/marraigeAdding', (req, res) => {
    console.log(req.body)
    query0 = `update male set marital_status='married' where cnic=${req.body.hCNIC}`
    meradatabase.query(query0, (e, rows, fields) => {
        if (e) {
            throw e;

        }
    })
    query1 = `update female set marital_status='married' where cnic=${req.body.wCNIC}`
    meradatabase.query(query1, (e, rows, fields) => {
        if (e) {
            throw e;

        }
    })
    res.send("Successfully registered")
});
app.post('/bformAdding', (req, res) => {
    console.log(req.body)
    var query0 = `select cnic from male where cnic = ${req.body.fCNIC}`;
    meradatabase.query(query0, (e, frows, fields) => {
        if (e) {
            throw e;
        }
        var query1 = `select cnic from female where cnic = ${req.body.mCNIC}`;
        meradatabase.query(query0, (e, mrows, fields) => {
            if (e) {
                throw e;
            }
            if (frows.lenght == 0 || mrows.lenght == 0) {
                res.send("PARENT(S) NOT REGISTERED")
            } else {
                var query = `select cnic from randomcnic limit 1`;
                meradatabase.query(query, (e, crows, fields) => {
                    if (e) {
                        throw e;

                    }

                    queryToinsert = `insert into child values (${crows[0].cnic},${req.body.fCNIC},${req.body.mCNIC})`
                    meradatabase.query(queryToinsert, (e, rows, fields) => {
                        if (e) { throw e }


                    })
                    query = `delete from randomcnic where cnic=${crows[0].cnic}`;
                    meradatabase.query(query, (e, rows, fields) => {
                        if (e) { throw e }
                    })


                })
                res.send("Successfully registered")

            }


        })

    })
});
app.post('/card', (req, res) => {
        //res.send(`cnic is ${req.body.CNIC}`);
        console.log(req.body);
        // var myQuery = `SELECT * FROM male where cnic = ${req.body.CNIC}`;




        var myQuery = `select * from card_details where card_no=${req.body.CNIC} and barcode_number = ${req.body.barcode}`
        meradatabase.query(myQuery, (e, rows, fields) => {
            if (e) {
                throw e;

            } else {

                if (rows.length == 0) {
                    res.send("You have entered invalid credentials or the card data does not exists")
                } else {
                    var newQuery = `update card_details set issue_date='27-12-2021',expiry_date='27-12-2029'`;
                    meradatabase.query(newQuery, (e, rows, fields) => {
                        if (e) {
                            throw e
                        } else {
                            res.send("successfully renewed")
                        }
                    })
                }
            }
        });












    })
    // Binding express app to port 3000
app.listen(3000, function() {
    console.log('Node server running ')
});
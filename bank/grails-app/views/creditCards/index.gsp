<%--
  Created by IntelliJ IDEA.
  User: vinayprakash
  Date: 27/04/21
  Time: 6:31 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
    .navbar {
        margin-bottom: 0;
        border-radius: 0;
    }

    .row.content {height: 450px}



    footer {
        background-color: #555;
        color: white;
        padding: 15px;
    }

    @media screen and (max-width: 767px) {
        .sidenav {
            height: auto;
            padding: 15px;
        }
        .row.content {height:auto;}
    }

    </style>
    <script>
        function modelClicked(){
            var name = $("#name").val();

            var str = name +", please provide your Email ID.";
            $("#emailTitle").html(str);
            $('#emailmodel').modal('show')
        }
        function emailClicked(){
            var name = $("#name").val();
            var email = $("#email").val();

            var str = name +",your Email ID is"+email+", please provide your Phone Number.";
            $("#phoneNumberTitle").html(str);
            $('#phoneNumbermodel').modal('show')
        }

        function phoneClicked(){


            var str = "please provide your Salary.";
            $("#salaryTitle").html(str);
            $('#salarymodel').modal('show')
        }
        function submitRequest(){
            var name = $("#name").val();
            var email = $("#email").val();
            var phoneNumber = $("#phoneNumber").val();
            var salary = $("#salary").val();
            console.log('gfjhfgf')

            var URL="${createLink(controller:'creditCards',action:'creditCardRequest')}";

            $.ajax({
                async: true,
                url: URL,
                data: {name: name, email: email, phoneNumber: phoneNumber, salary: salary},
                success: function (resp) {
                    $('#salarymodel').modal('hide')
                    $('#phoneNumbermodel').modal('hide')
                    $('#emailmodel').modal('hide')
                    $('#nameModalCenter').modal('hide')
                    if (resp.success) {
                        $('#successmodel').modal('show')
                    }
                }
            });
        }

        function EnableDisable(name,type) {
            //Reference the Button.
            var btnSubmit = document.getElementById("nameButton");
            if(type == "email"){
                btnSubmit = document.getElementById("emailButton");
                    }else if (type =="phone"){
                btnSubmit = document.getElementById("phoneNumberButton");
            }else if (type =="salary") {
                btnSubmit = document.getElementById("salaryButton");

            }

            if (name.value.trim() != "") {
                btnSubmit.disabled = false;
            } else {
                btnSubmit.disabled = true;
            }
        };
    </script>

</head>

<body style="background-color: #DFDFDF">

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img width="60" height="30" src="https://d2e45v6fm6n91w.cloudfront.net/images/logos/logo-white.png?v2"></a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/creditCards">Home</a></li>
                <li><a href="#">Credit Cards</a></li>
            </ul>

        </div>
    </div>
</nav>

<div class="container-fluid text-center">
    <div class="row content centered">
        <div class="text-center">
            <h1>Welcome</h1>
        <h2 style="color:  #843534;font-family: 'Al Tarikh'">You can bank on us to simplify your financial decisions</h2>
            <hr>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nameModalCenter">
            Apply for credit cards
        </button>
        </div>

    </div>
</div>

<footer class="container-fluid text-center">
    <p>Our mission is to become the most reliable platform for personal finance and insurance in the UAE by simplifying the process. Find and compare insurance policies, credit cards, loans, and bank accounts all in one place.</p>
</footer>
<div class="modal fade" id="nameModalCenter" tabindex="-1" role="dialog" aria-labelledby="nameModalCenterTitle" aria-hidden="true">
    <div  class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 style="color:  #843534;font-family: 'Al Tarikh';font-size: medium" class="modal-title" id="nameModalLongTitle">Credit card is few clicks away!!!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label>Please enter your full name:</label>
                        <input id="name" type="text" class="form-control" placeholder="Full Name" onkeyup="EnableDisable(this,'name')">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button id="nameButton" disabled="true" type="button" class="btn btn-primary" onclick="modelClicked()">Next</button>

            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="emailmodel" tabindex="-1" role="dialog" aria-labelledby="nameModalCenterTitle" aria-hidden="true">
    <div  class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 style="color:  #843534;font-family: 'Al Tarikh';font-size: medium" class="modal-title" id="emailTitle">Email is necessary!!!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label>Please enter your Email:</label>
                        <input id="email" type="text" class="form-control" placeholder="Email" onkeyup="EnableDisable(this,'email')">

                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Previous</button>
                <button disabled="true" id="emailButton" type="button" class="btn btn-primary"onclick="emailClicked()">Next</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="phoneNumbermodel" tabindex="-1" role="dialog" aria-labelledby="phoneNumberModalCenterTitle" aria-hidden="true">
    <div  class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 style="color:  #843534;font-family: 'Al Tarikh';font-size: medium" class="modal-title" id="phoneNumberTitle">phoneNumber is necessary!!!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label>Please enter your Phone Number:</label>
                        <input id="phoneNumber" type="number" class="form-control" placeholder="Phone Number" onkeyup="EnableDisable(this,'phone')">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Previous</button>
                <button disabled="true" id="phoneNumberButton" type="button" class="btn btn-primary" onclick="phoneClicked()">Next</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="salarymodel" tabindex="-1" role="dialog" aria-labelledby="salaryModalCenterTitle" aria-hidden="true">
    <div  class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 style="color:  #843534;font-family: 'Al Tarikh';font-size: medium" class="modal-title" id="salaryTitle">phoneNumber is necessary!!!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label>Please enter your Salary:</label>
                        <input id="salary" type="number" class="form-control" placeholder="Salary" onkeyup="EnableDisable(this,'salary')">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Previous</button>
                <button disabled="true" id="salaryButton" type="button" class="btn btn-primary" onclick="submitRequest()">Finish</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="successmodel" tabindex="-1" role="dialog" aria-labelledby="successModalCenterTitle" aria-hidden="true">
    <div  class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 style="color:  #4D8618;font-family: 'Al Nile';font-size: larger" class="modal-title" id="successTitle">Request submitted successfully!!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label>Our executive will contact you shortly;</label>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>
</body>

</html>
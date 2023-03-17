$(document).ready(function ()
{
    /*$('#btnsubmit').hide();*/

    $("#2tab").addClass("disable_a_href");
    $("#3tab").addClass("disable_a_href");
    var surnameError, firstnameError, genderError, QualificationError, addressError, stateError, LGAError, filenoError, fileuploadError,
        daterangepickerError, RiversLGAselectError, gradeError, emailError;

    $('#lnkContinue').click(function () {
        var filenoValue;
        filenoValue = $("#txtfileno").val();

        if (filenoValue == '') {
            $("#filenospanmsg").remove();
            $("#txtfileno").after('<span class="validationerror" id="filenospanmsg">Please enter staff File No.</span>');

            /*Add red border that shows error*/
            $("#txtfileno").addClass("inputred");
            filenoError = "filenoError";
            return false;
        }
        else {
            filenoError = "NoError";
            /*$("[id*=profiletab]").click();*/
            $("#filenospanmsg").remove();
        }

    });


    $('#lnkContinue').click(function () {
        var surnameValue;       
        surnameValue = $("#txtsurname").val();

        if (surnameValue == '')
        {
            $("#spanmsg").remove();
            $("#txtsurname").after('<span class="validationerror" id="spanmsg">Please enter staff surname.</span>');

            /*Add red border that shows error*/
            $("#txtsurname").addClass("inputred");
            surnameError = "surnameError";
            return false;
        }
        else
        {
            surnameError = "NoError";
            /*$("[id*=profiletab]").click();*/
            $("#spanmsg").remove();
        }
       
    });

    $('#lnkContinue').click(function () {
        var firstnameValue;
        firstnameValue = $("#txtfirstname").val();

        if (firstnameValue == '') {
            $("#firstnamespanmsg").remove();
            $("#txtfirstname").after('<span class="validationerror" id="firstnamespanmsg">Please enter staff first name.</span>');

            /*Add red border that shows error*/
            $("#txtfirstname").addClass("inputred");
            firstnameError = "firstnameError";
            return false;
        }        
        else
        {
            firstnameError = "NoError";
            /*$("[id*=profiletab]").click();*/
            $("#firstnamespanmsg").remove();
        }

    });

    $('#lnkContinue').click(function () {
        var emailValue;
        emailValue = $("#txtemail").val();

        if (emailValue == '') {
            $("#emailspanmsg").remove();
            $("#txtemail").after('<span class="validationerror" id="emailspanmsg">Please enter staff e-mail address.</span>');

            /*Add red border that shows error*/
            $("#txtemail").addClass("inputred");
            emailError = "emailError";
            return false;
        }
        else {
            emailError = "NoError";
            /*$("[id*=profiletab]").click();*/
            $("#emailspanmsg").remove();
        }
    });

    $('#lnkContinue').click(function () {
        var check = true;
        var name;
        $("input:radio").each(function () {
            name = $(this).attr("name");
            if ($("input:radio[name=" + name + "]:checked").length == 0) {
                check = false;
            }
        });

        if (check) {
            genderError = "NoError";
            $("#genderspanmsg").remove();
        } else {
            $("#genderspanmsg").remove();
            $("#genderdiv").after('<span class="validationerror" id="genderspanmsg">Please select gender.</span>');           
            genderError = "genderError";
        }
    });

    $('#lnkContinue').click(function () {
        var qualificationValue;
        qualificationValue = $("#txtqualification").val();

        if (qualificationValue == '') {
            $("#qualificationspanmsg").remove();
            $("#txtqualification").after('<span class="validationerror" id="qualificationspanmsg">Please enter staff quaification.</span>');

            /*Add red border that shows error*/
            $("#txtqualification").addClass("inputred");
            QualificationError = "QualificationError";
            return false;
        }
        else {
            QualificationError = "NoError";
            /*$("[id*=profiletab]").click();*/
            $("#qualificationspanmsg").remove();
        }

    });

    $('#lnkContinue').click(function () {
        var addressValue;
        addressValue = $("#txtaddress").val();

        if (addressValue == '') {
            $("#addressspanmsg").remove();
            $("#txtaddress").after('<span class="validationerror" id="addressspanmsg">Please enter staff full address.</span>');

            /*Add red border that shows error*/
            $("#txtaddress").addClass("inputred");
            addressError = "addressError";
            return false;
        }
        else {
            addressError = "NoError";
            /*$("[id*=profiletab]").click();*/
            $("#addressspanmsg").remove();
        }

    });

    $('#lnkContinue').click(function () {
        var stateValue;
        stateValue = $("#StateSelect").val();

        if (stateValue == 'selected') {
            $("#statespanmsg").remove();
            $("#StateSelect").after('<span class="validationerror" id="statespanmsg">Please select staff state of origin.</span>');

            /*Add red border that shows error*/
            $("#StateSelect").addClass("inputred");
            stateError = "stateError";
            return false;
        }
        else {
            stateError = "NoError";
            /*$("[id*=profiletab]").click();*/
            $("#statespanmsg").remove();
        }

    });

    $('#lnkContinue').click(function () {
        var LGAValue;
        // I am using to state dropdown select to determine if LGA selecthas value
        LGAValue = $("#StateSelect").val();

        if (LGAValue == 'selected') {
            $("#LGAspanmsg").remove();
            $("#LGASelect").after('<span class="validationerror" id="LGAspanmsg">Please select staff LGA of origin.</span>');

            /*Add red border that shows error*/
            $("#LGASelect").addClass("inputred");
            LGAError = "LGAError";
            return false;
        }
        else {
            LGAError = "NoError";
            $("#LGAspanmsg").remove();
        }

    });
    

    $('#lnkContinue').click(function () {
        var fileuploadValue;
        fileuploadValue = $("#fileupload").val();

        if (fileuploadValue == '') {
            $("#fileuploadspanmsg").remove();
            $("#fileupload").after('<span class="validationerror" id="fileuploadspanmsg">Please select staff Photograph.</span>');

            /*Add red border that shows error*/
            $("#fileupload").addClass("inputred");
            fileuploadError = "fileuploadError";
            return false;
        }
        else {
            fileuploadError = "NoError";
            $("#fileuploadspanmsg").remove();
        }

    });

    $('#lnkContinue').click(function () {        
        var date = $("#daterangepicker").val();
        var inpDate = new Date(date);
        var currDate = new Date();

        if (inpDate.setHours(0, 0, 0, 0) == currDate.setHours(0, 0, 0, 0))
        {
            $("#daterangepickerspanmsg").remove();
            $("#daterangepicker").after('<span class="validationerror" id="daterangepickerspanmsg">Please select staff Date of Birth.</span>');

            /*Add red border that shows error*/
            $("#daterangepicker").addClass("inputred");
            daterangepickerError = "daterangepickerError";
            return false;
        }
        else {
            daterangepickerError = "NoError";            
            $("#daterangepickerspanmsg").remove();
        }  
       
    });

   

   

    /*===============Check for error in Staff profile tab and flag them by clicking on continue link================================*/
    $('#lnkContinue').click(function ()
    {
        if (surnameError == "surnameError" || firstnameError == "firstnameError" || genderError == "genderError" || stateError == "stateError"
            || QualificationError == "QualificationError" || addressError == "addressError"
            || LGAError == "LGAError" || filenoError == "filenoError" || fileuploadError == "fileuploadError"
            || daterangepickerError == "daterangepickerError" || RiversLGAselectError == "RiversLGAselectError" || emailError == "emailError" )
        {
            $("#2tab").addClass("disable_a_href");
            $("#3tab").addClass("disable_a_href");
        }
        else
        {
        /*Assign staff name and fileno to labels*/
            $('#lblfileno').html($('#txtfileno').val());
            $('#lblfullname').html($('#txtfirstname').val() + " " + $('#txtsurname').val() + " " + $('#txtmiddlename').val());

            /*$('#lblstateorigin').html($('#LGASelect').val());*/

            /*disable 1st tab*/
            $("#1tab").addClass("disable_a_href");

            /*Enable second tab only*/
            $("#2tab").removeClass("disable_a_href");

            /*Click on second Tab*/
            $("[id*=profiletab]").click();
        }
    });
    /*================================================*/

    /*===============Check for error in Staff profile tab and show Submit button================================*/
    $('#lnkcheck').click(function () {
        if (RiversLGAselectError == "RiversLGAselectError" || gradeError == "gradeError") {
            $('#btnsubmit').hide();
            $('#lnkcheck').show();
        }
        else {
            $('#btnsubmit').show();
            $('#lnkcheck').hide();
        }
    });
    /*================================================*/

    /*For Back button*/
    $('#lnkback').click(function () {
        $("#2tab").addClass("disable_a_href");
        $("#3tab").addClass("disable_a_href");

        $("[id*=home-tab]").click();
    });


    /*Control text change events for controls start here*/

    $("#txtfirstname").keyup(function () {
        /*Delete the error message*/
        $("#firstnamespanmsg").remove();

        /*Remove the red border of the control*/
        $("#txtfirstname").removeClass("inputred");

        /*Add green border for correct validation*/
        $("#txtfirstname").addClass("inputgreen");
    });

    $("#txtsurname").keyup(function () {
        /*Delete the error message*/
        $("#spanmsg").remove();

        /*Remove the red border of the control*/
        $("#txtsurname").removeClass("inputred");

        /*Add green border for correct validation*/
        $("#txtsurname").addClass("inputgreen");
    });

    $("#txtemail").keyup(function () {
        /*Delete the error message*/
        $("#emailspanmsg").remove();

        /*Remove the red border of the control*/
        $("#txtemail").removeClass("inputred");

        /*Add green border for correct validation*/
        $("#txtemail").addClass("inputgreen");
    });

    $("#txtqualification").keyup(function () {
        /*Delete the error message*/
        $("#qualificationspanmsg").remove();

        /*Remove the red border of the control*/
        $("#txtqualification").removeClass("inputred");

        /*Add green border for correct validation*/
        $("#txtqualification").addClass("inputgreen");
    });

    $("#txtaddress").keyup(function () {
        /*Delete the error message*/
        $("#addressspanmsg").remove();

        /*Remove the red border of the control*/
        $("#txtaddress").removeClass("inputred");

        /*Add green border for correct validation*/
        $("#txtaddress").addClass("inputgreen");
    });

    $("#StateSelect").on("change", function () {
        /*Delete the error message*/
        $("#statespanmsg").remove();

        /*Remove the red border of the control*/
        $("#StateSelect").removeClass("inputred");

        /*Add green border for correct validation*/
        $("#StateSelect").addClass("inputgreen");
    });

    $("#LGASelect").on("change", function () {
        /*Delete the error message*/
        $("#LGAspanmsg").remove();

        /*Remove the red border of the control*/
        $("#LGASelect").removeClass("inputred");

        /*Add green border for correct validation*/
        $("#LGASelect").addClass("inputgreen");
    });

    $("#txtfileno").keyup(function () {
        /*Delete the error message*/
        $("#filenospanmsg").remove();

        /*Remove the red border of the control*/
        $("#txtfileno").removeClass("inputred");

        /*Add green border for correct validation*/
        $("#txtfileno").addClass("inputgreen");
    });

    $("#daterangepicker").keyup(function () {
        /*Delete the error message*/
        $("#daterangepickerspanmsg").remove();

        /*Remove the red border of the control*/
        $("#daterangepicker").removeClass("inputred");

        /*Add green border for correct validation*/
        $("#daterangepicker").addClass("inputgreen");
    });

    $("#RiversLGAselect").on("change", function () {
        RiversLGAselectError = "NoError";

        /*Delete the error message*/
        $("#RiversLGAselectspanmsg").remove();

        /*Remove the red border of the control*/
        $("#RiversLGAselect").removeClass("inputred");

        /*Add green border for correct validation*/
        $("#RiversLGAselect").addClass("inputgreen");
    });

    $("#txtgrade").keyup(function () {
        gradeError = "NoError";

        /*Delete the error message*/
        $("#gradespanmsg").remove();

        /*Remove the red border of the control*/
        $("#txtgrade").removeClass("inputred");

        /*Add green border for correct validation*/
        $("#txtgrade").addClass("inputgreen");
    });
    /*===Control text change events for controls end here====*/




    /*====== profile tab clcik to check error ====*/
    //$('#profiletab').click(function () {
    //    if (surnameError == "surnameError" || firstnameError == "firstnameError" || genderError == "genderError" || stateError == "stateError"
    //        || QualificationError == "QualificationError" || addressError == "addressError")
    //    {
    //        /*Go back to Biodata Tab*/
    //        $("#home-tab").click();
    //    }
    //    else
    //    {
    //        /*Do nothing*/            
    //    }
    //});
    /*===========================================*/




    /* For selecting LGA as a result of selected State*/
    $("#StateSelect").change(function () {
        var val = $(this).val();
        if (val == "Abuja FCT") {
            $("#LGASelect").html
                (
                    "<option value = Gwagwalada>Gwagwalada</option> \
                     <option value = 'Kuje'>Kuje</option> \
                     <option value = 'Abaji'>Abaji</option>\
                     <option value = 'Abuja Municipal'>Abuja Municipal</option> \
                     <option value = 'Bwari'>Bwari</option> \
                     <option value = 'Kwali'>Kwali</option>"

                );
        }
        else if (val == "Abia") {
            $("#LGASelect").html
                (
                    "<option value = 'Aba North'>Aba North</option> \
                     <option value = 'Aba South'>Aba South</option> \
                     <option value = 'Arochukwu'>Arochukwu</option>\
                     <option value = 'Bende'>Bende</option> \
                     <option value = 'Ikwuano'>Ikwuano</option> \
                     <option value = 'Isiala-Ngwa North'>Isiala-Ngwa North</option>\
                     <option value = 'Isiala-Ngwa South'>Isiala-Ngwa South</option> \
                     <option value = 'Isuikwuato'>Isuikwuato</option> \
                     <option value = 'Obi Ngwa'>Obi Ngwa</option>\
                     <option value = 'Ohafia'>Ohafia</option> \
                     <option value = 'Osisioma Ngwa'>Osisioma Ngwa</option> \
                     <option value = 'Ugwunagbo'>Ugwunagbo</option> \
                     <option value = 'Ukwa East'>Ukwa East</option> \
                     <option value = 'Abuja Municipal'>Abuja Municipal</option> \
                     <option value = 'Umuahia North'>Umuahia North</option> \
                     <option value = 'Umuahia South'>Umuahia South</option> \
                     <option value = 'Umu Nneochi'> Umu Nneochi</option>"

                );
        }
        else if (val == "Adamawa") {
            $("#LGASelect").html
                (
                    "<option value = 'Demsa'>Demsa</option> \
                     <option value = 'Fufore'>Fufore</option> \
                     <option value = 'Ganye'>Ganye</option>\
                     <option value = 'Girei'>Girei</option> \
                     <option value = 'Gombi'>Gombi</option> \
                     <option value = 'Guyuk'>Guyuk</option>\
                     <option value = 'Hong'>Hong</option> \
                     <option value = 'Jada'>Jada</option> \
                     <option value = 'Lamurde'>Lamurde</option>\
                     <option value = 'Madagali'>Madagali</option> \
                     <option value = 'Maiha'>Maiha</option> \
                     <option value = 'Mayo-Belwa'>Mayo-Belwa</option> \
                     <option value = 'Michika'>Michika</option> \
                     <option value = 'Mubi North'>Mubi North</option>\
                     <option value = 'Mubi South'>Mubi South</option> \
                     <option value = 'Numan'>Numan</option> \
                     <option value = 'Shelleng'>Shelleng</option> \
                     <option value = 'Song'>Song</option> \
                     <option value = 'Toungo'>Toungo</option> \
                     <option value = 'Yola'>Yola</option> \
                     <option value = 'Jimeta' >Jimeta</option>"
                );
        }
        else if (val == "Akwa Ibom") {
            $("#LGASelect").html
                (
                    "<option value = 'Abak'>Abak</option> \
                     <option value = 'Eastern Obolo'>Eastern Obolo</option> \
                     <option value = 'Eket'>Eket</option>\
                     <option value = 'Esit-Eket'>Esit-Eket</option> \
                     <option value = 'Essien Udim'>Essien Udim</option> \
                     <option value = 'Etim-Ekpo'>Etim-Ekpo</option>\
                     <option value = 'Etinan'>Etinan</option> \
                     <option value = 'Ibeno'>Ibeno</option> \
                     <option value = 'Ibesikpo-Asutan'>Ibesikpo-Asutan</option>\
                     <option value = 'Ibiono-Ibom'>Ibiono-Ibom</option> \
                     <option value = 'Ika'>Ika</option> \
                     <option value = 'Ikono'>Ikono</option> \
                     <option value = 'Ikot Abasi'>Ikot Abasi</option> \
                     <option value = 'Ikot Ekpene'>Ikot Ekpene</option>\
                     <option value = 'Ini'>Ini</option> \
                     <option value = 'Itu'>Itu</option> \
                     <option value = 'Mbo'>Mbo</option> \
                     <option value = 'Mkpat-Enin'>Mkpat-Enin</option> \
                     <option value = 'Nsit-Atai'>Nsit-Atai</option> \
                     <option value = 'Nsit-Ibom'>Nsit-Ibom</option> \
                     <option value = 'Nsit-Ubium'>Nsit-Ubium</option>\
                     <option value = 'Obot-Akara'> Numan</option > \
                     <option value = 'Okobo'>Okobo</option> \
                     <option value = 'Onna'>Onna</option> \
                     <option value = 'Oron'>Oron</option> \
                     <option value = 'Oruk Anam'>Oruk Anam</option> \
                     <option value = 'Ukanafun'> Ukanafun</option > \
                     <option value = 'Udung-Uko'>Udung-Uko</option> \
                     <option value = 'Uruan'>Uruan</option> \
                     <option value = 'Urue-Offong/Oruko'>Urue-Offong/Oruko</option> \
                     <option value = 'Uyo'>Uyo</option>"
                );
        }
        else if (val == "Anambra") {
            $("#LGASelect").html
                (
                    "<option value = 'Aguata'>Aguata</option> \
                     <option value = 'Anambra East'>Anambra East</option> \
                     <option value = 'Anambra West'>Anambra West</option>\
                     <option value = 'Anaocha'>Anaocha</option> \
                     <option value = 'Awka North'>Awka North</option> \
                     <option value = 'Awka South'>Awka South</option>\
                     <option value = 'Ayamelum'>Ayamelum</option> \
                     <option value = 'Dunukofia'>Dunukofia</option> \
                     <option value = 'Ekwusigo'>Ekwusigo</option>\
                     <option value = 'Idemili North'>Idemili North</option> \
                     <option value = 'Idemili South'>Idemili South</option> \
                     <option value = 'Ihiala'>Ihiala</option> \
                     <option value = 'Njikoka'>Njikoka</option> \
                     <option value = 'Nnewi North'>Nnewi North</option>\
                     <option value = 'Nnewi South'>Nnewi South</option> \
                     <option value = 'Ogbaru'>Ogbaru</option> \
                     <option value = 'Onitsha North'>Onitsha North</option> \
                     <option value = 'Onitsha South'>Onitsha South</option> \
                     <option value = 'Orumba North'>Orumba North</option> \
                     <option value = 'Orumba South'>Orumba South</option> \
                     <option value = 'Oyi'>Oyi</option>"
                );
        }
        else if (val == "Bauchi") {
            $("#LGASelect").html
                (
                    "<option value = 'Bauchi'>Bauchi</option> \
                     <option value = 'Tafawa Balewa'>Tafawa Balewa</option> \
                     <option value = 'Dass'>Dass</option> \
                     <option value = 'Toro'>Toro</option> \
                     <option value = 'Dogoro'>Dogoro</option>\
                     <option value = 'Ningi'>Ningi</option> \
                     <option value = 'Warji'>Warji</option> \
                     <option value = 'Garguwa'>Garguwa</option>\
                     <option value = 'kirfi'>kirfi</option> \
                     <option value = 'Alkaleri'>Alkaleri</option> \
                     <option value = 'Darazo'>Darazo</option> \
                     <option value = 'Misau'>Misau</option> \
                     <option value = 'Giade'>Giade</option>\
                     <option value = 'Shira'>Shira</option> \
                     <option value = 'Jama’are'>Jama’are</option> \
                     <option value = 'Kantangum'>Kantangum</option> \
                     <option value = 'Itas/Gadau'>Itas/Gadau</option> \
                     <option value = 'Zaki'>Zaki</option>"
                );
        }
        else if (val == "Bayelsa") {
            $("#LGASelect").html
                (
                    "<option value = 'Brass'>Brass</option> \
                     <option value = 'Ekeremor'>Ekeremor</option> \
                     <option value = 'Kolokuma/Opokuma'>Kolokuma/Opokuma</option> \
                     <option value = 'Nembe'>Nembe</option> \
                     <option value = 'Ogbia'>Ogbia</option>\
                     <option value = 'Sagbama'>Sagbama</option> \
                     <option value = 'Southern Ijaw'>Southern Ijaw</option> \
                     <option value = 'Yenagoa'>Yenagoa</option>"
                );
        }
        else if (val == "Benue") {
            $("#LGASelect").html
                (
                    "<option value = 'Ado'>Ado</option> \
                     <option value = 'Agatu'>Agatu</option> \
                     <option value = 'Apa'>Apa</option> \
                     <option value = 'Buruku'>Buruku</option> \
                     <option value = 'Gboko'>Gboko</option>\
                     <option value = 'Guma'>Guma</option> \
                     <option value = 'Gwer East'>Gwer East</option> \
                     <option value = 'Gwer West'>Gwer West</option> \
                     <option value = 'Katsina-Ala'>Katsina-Ala</option> \
                     <option value = 'Konshisha'>Konshisha</option> \
                     <option value = 'Kwande'>Kwande</option> \
                     <option value = 'Logo'>Logo</option>\
                     <option value = 'Makurdi'>Makurdi</option> \
                     <option value = 'Obi'>Obi</option> \
                     <option value = 'Ogbadibo'>Ogbadibo</option> \
                     <option value = 'Ohimini'>Ohimini</option> \
                     <option value = 'Oju'>Oju</option >\
                     <option value = 'okpoku'>okpoku</option> \
                     <option value = 'Otukpo'>Otukpo</option>\
                     <option value = 'Tarka'>Tarka</option> \
                     <option value = 'Ukum'>Ukum</option> \
                     <option value = 'Ushongo'>Ushongo</option> \
                     <option value = 'Vandeikya'>Vandeikya</option>"
                );
        }
        else if (val == "Borno") {
            $("#LGASelect").html
                (
                    "<option value = 'Abadam'>Abadam</option> \
                     <option value = 'Askira/Uba'>Askira/Uba</option> \
                     <option value = 'Bama'>Bama</option> \
                     <option value = 'Bayo'>Bayo</option> \
                     <option value = 'Biu'>Biu</option>\
                     <option value = 'Chibok'>Chibok</option> \
                     <option value = 'Damboa'>Damboa</option> \
                     <option value = 'Dikwa'>Dikwa</option> \
                     <option value = 'Gubio'>Gubio</option> \
                     <option value = 'Guzamala'>Guzamala</option> \
                     <option value = 'Gwoza'>Gwoza</option> \
                     <option value = 'Hawul'>Hawul</option>\
                     <option value = 'Jere'>Jere</option> \
                     <option value = 'Kaga'>Kaga</option> \
                     <option value = 'Kala'>Kala</option> \
                     <option value = 'Konduga'>Konduga</option> \
                     <option value = 'Kukawa'>Kukawa</option >\
                     <option value = 'Kwaya Kusar'>Kwaya Kusar</option> \
                     <option value = 'Mafa'>Mafa</option>\
                     <option value = 'Magumeri'>Magumeri</option> \
                     <option value = 'Maiduguri'>Maiduguri</option> \
                     <option value = 'Marte'>Marte</option> \
                     <option value = 'Mobbar'>Mobbar</option> \
                     <option value = 'Monguno'> Monguno</option > \
                     <option value = 'Ngala'>Ngala</option> \
                     <option value = 'Nganzai'>Nganzai</option >\
                     <option value = 'Shani'>Shani</option>"
                );
        }
        else if (val == "Cross River") {
            $("#LGASelect").html
                (
                    "<option value = 'Abi'>Abi</option> \
                     <option value = 'Akamkpa'>Akamkpa</option> \
                     <option value = 'Akpabuyo'>Akpabuyo</option> \
                     <option value = 'Bakassi'>Bakassi </option >\
                     <option value = 'Bekwarra'>Bekwarra</option> \
                     <option value = 'Biase'>Biase</option>\
                     <option value = 'Boki'>Boki</option> \
                     <option value = 'Calabar Municipal'>Calabar Municipal</option> \
                     <option value = 'Calabar South'>Calabar South</option> \
                     <option value = 'Etung'>Etung</option> \
                     <option value = 'Ikom'>Ikom</option> \
                     <option value = 'Obanliku'>Obanliku</option> \
                     <option value = 'Obubra'>Obubra</option>\
                     <option value = 'Obudu'>Obudu</option> \
                     <option value = 'Odukpani'>Odukpani</option> \
                     <option value = 'Ogoja'>Ogoja</option> \
                     <option value = 'Yakurr'>Yakurr</option> \
                     <option value = 'Yala'>Yala</option>"
                );
        }
        else if (val == "Delta") {
            $("#LGASelect").html
                (
                    "<option value = 'Aniocha North'>Aniocha North</option> \
                     <option value = 'Aniocha South'>Aniocha South</option> \
                     <option value = 'Bomadi'>Bomadi</option> \
                     <option value = 'Burutu'>Burutu</option> \
                     <option value = 'Ethiope East'>Ethiope East</option>\
                     <option value = 'Ethiope West'>Ethiope West</option> \
                     <option value = 'Ika North East'>Ika North East</option> \
                     <option value = 'Ika South'>Ika South</option> \
                     <option value = 'Isoko North'>Isoko North</option> \
                     <option value = 'Isoko South'>Isoko South</option> \
                     <option value = 'Ndokwa East'>Ndokwa East</option> \
                     <option value = 'Ndokwa West'>Ndokwa West</option>\
                     <option value = 'Okpe'>Okpe</option> \
                     <option value = 'Oshimili North'>Oshimili North</option> \
                     <option value = 'Oshimili South'>Oshimili South</option> \
                     <option value = 'Patani'>Patani</option> \
                     <option value = 'Sapele, Delta'>Sapele, Delta</option> \
                     <option value = 'Udu'>Udu</option >\
                     <option value = 'Ughelli North'>Ughelli North</option> \
                     <option value = 'Ughelli South'>Ughelli South</option>\
                     <option value = 'Ukwuani'>Ukwuani</option> \
                     <option value = 'Uvwie'>Uvwie</option> \
                     <option value = 'Warri central'> Warri central</option > \
                     <option value = 'Warri North'>Warri North</option> \
                     <option value = 'Warri South'>Warri South</option>"
                );
        }
        else if (val == "Ebonyi") {
            $("#LGASelect").html
                (
                    "<option value = 'Abakaliki'>Abakaliki</option> \
                     <option value = 'Afikpo North'>Afikpo North</option> \
                     <option value = 'Afikpo South (Edda)'>Afikpo South (Edda)</option> \
                     <option value = 'Ebonyi'>Ebonyi</option >\
                     <option value = 'Ezza North'>Ezza North</option> \
                     <option value = 'Ezza South'>Ezza South</option>\
                     <option value = 'Ikwo'>Ikwo</option> \
                     <option value = 'Ishielu'>Ishielu</option> \
                     <option value = 'Ivo'>Ivo</option> \
                     <option value = 'Izzi'>Izzi</option> \
                     <option value = 'Ohaozara'>Ohaozara</option> \
                     <option value = 'Ohaukwu'>Ohaukwu</option> \
                     <option value = 'Onicha'>Onicha</option>"
                );
        }
        else if (val == "Edo") {
            $("#LGASelect").html
                (
                    "<option value = 'Akoko-Edo'>Akoko-Edo</option> \
                     <option value = 'Egor'>Egor</option> \
                     <option value = 'Esan Central'>Esan Central</option> \
                     <option value = 'Esan North-East'>Esan North-East</option >\
                     <option value = 'Esan South-East'>Esan South-East</option> \
                     <option value = 'Esan West'>Esan West</option>\
                     <option value = 'Etsako Central'>Etsako Central</option> \
                     <option value = 'Etsako East'>Etsako East</option> \
                     <option value = 'Etsako West'>Etsako West</option> \
                     <option value = 'Igueben'>Igueben</option> \
                     <option value = 'Ikpoba-Okha'>Ikpoba-Okha</option> \
                     <option value = 'Oredo'>Oredo</option> \
                     <option value = 'Orhionmwon'>Orhionmwon</option>\
                     <option value = 'Ovia North-East'>Ovia North-East</option> \
                     <option value = 'Ovia South-West'>Ovia South-West</option> \
                     <option value = 'Owan East'>Owan East</option> \
                     <option value = 'Owan West'>Owan West</option> \
                     <option value = 'Uhunmwonde'>Uhunmwonde</option>"
                );
        }
        else if (val == "Ekiti") {
            $("#LGASelect").html
                (
                    "<option value = 'Ado-Ekiti'>Ado-Ekiti</option> \
                     <option value = 'Ikere'>Ikere</option> \
                     <option value = 'Oye'>Oye</option> \
                     <option value = 'Aiyekire (Gbonyin)'>Aiyekire (Gbonyin)</option >\
                     <option value = 'Efon'>Efon</option> \
                     <option value = 'Ekiti East'>Ekiti East</option >\
                     <option value = 'Ekiti South-West'>Ekiti South-West</option> \
                     <option value = 'Ekiti West'>Ekiti West</option>\
                     <option value = 'Emure'>Emure</option> \
                     <option value = 'Ido-Osi'>Ido-Osi</option> \
                     <option value = 'Ijero'>Ijero</option> \
                     <option value = 'Ikole'>Ikole</option> \
                     <option value = 'Ilejemeje'>Ilejemeje</option> \
                     <option value = 'Irepodun/Ifelodun'>Irepodun/Ifelodun</option> \
                     <option value = 'Ise/Orun'>Ise/Orun</option>\
                     <option value = 'Moba'>Moba</option>"
                );
        }
        else if (val == "Enugu") {
            $("#LGASelect").html
                (
                    "<option value = 'Aninri'>Aninri</option> \
                     <option value = 'Awgu'>Awgu</option> \
                     <option value = 'Enugu East'>Enugu East</option> \
                     <option value = 'Enugu North'>Enugu North</option >\
                     <option value = 'Enugu South'>Enugu South</option> \
                     <option value = 'Ezeagu'>Ezeagu</option >\
                     <option value = 'Igbo Etiti'>Igbo Etiti</option> \
                     <option value = 'Igbo Eze North'>Igbo Eze North</option>\
                     <option value = 'Igbo Eze South'>Igbo Eze South</option> \
                     <option value = 'Isi Uzo'>Isi Uzo</option> \
                     <option value = 'Nkanu East'>Nkanu East</option> \
                     <option value = 'Nkanu West'>Nkanu West</option> \
                     <option value = 'Nsukka'>Nsukka</option> \
                     <option value = 'Oji River'>Oji River</option> \
                     <option value = 'Udenu'>Udenu</option>\
                     <option value = 'Udi'>Udi</option> \
                     <option value = 'Uzo-Uwani'>Uzo-Uwani</option>"
                );
        }
        else if (val == "Gombe") {
            $("#LGASelect").html
                (
                    "<option value = 'Akko'>Akko</option> \
                     <option value = 'Balanga'>Balanga</option> \
                     <option value = 'Billiri'>Billiri</option> \
                     <option value = 'Dukku'>Dukku</option > \
                     <option value = 'Funakaye'>Funakaye</option> \
                     <option value = 'Gombe'>Gombe</option> \
                     <option value = 'Kaltungo'>Kaltungo</option> \
                     <option value = 'Kwami'>Kwami</option> \
                     <option value = 'Nafada'>Nafada</option> \
                     <option value = 'Shomgom'>Shomgom</option> \
                     <option value = 'Yamaltu/Deba'>Yamaltu/Deba</option> "
                );
        }
        else if (val == "Imo") {
            $("#LGASelect").html
                (
                    "<option value = 'Aboh Mbaise'>Aboh Mbaise</option> \
                     <option value = 'Ahiazu Mbaise'>Ahiazu Mbaise</option> \
                     <option value = 'Ehime Mbano'>Ehime Mbano</option> \
                     <option value = 'Ezinihitte Mbaise'>Ezinihitte Mbaise</option > \
                     <option value = 'Ideato North'>Ideato North</option> \
                     <option value = 'Ideato South'>Ideato South</option> \
                     <option value = 'Ihitte/Uboma'>Ihitte/Uboma</option> \
                     <option value = 'Ikeduru'>Ikeduru</option> \
                     <option value = 'Isiala Mbano'>Isiala Mbano</option> \
                     <option value = 'Isu'>Isu</option> \
                     <option value = 'Mbaitoli'>Mbaitoli</option> \
                     <option value = 'Ngor Okpala'>Ngor Okpala</option> \
                     <option value = 'Njaba'>Njaba</option> \
                     <option value = 'Nkwerre'>Nkwerre</option> \
                     <option value = 'Nwangele'>Nwangele</option> \
                     <option value = 'Obowo'>Obowo</option> \
                     <option value = 'Oguta'>Oguta</option> \
                     <option value = 'Ohaji/Egbema'>Ohaji/Egbema</option> \
                     <option value = 'Okigwe'>Okigwe</option> \
                     <option value = 'Onuimo'>Onuimo</option> \
                     <option value = 'Orlu'>Orlu</option> \
                     <option value = 'Orsu'>Orsu</option> \
                     <option value = 'Oru East'>Oru East</option> \
                     <option value = 'Oru West'>Oru West</option> \
                     <option value = 'Owerri Municipal'>Owerri Municipal</option> \
                     <option value = 'Owerri North'>Owerri North</option> \
                     <option value = 'Owerri West'>Owerri West</option>"
                );
        }
        else if (val == "Jigawa") {
            $("#LGASelect").html
                (
                    "<option value = 'Auyo'>Auyo</option> \
                     <option value = 'Babura'>Babura</option> \
                     <option value = 'Biriniwa'>Biriniwa</option> \
                     <option value = 'Birnin Kudu'>Birnin Kudu</option> \
                     <option value = 'Buji'>Buji</option>\
                     <option value = 'Dutse'>Dutse</option> \
                     <option value = 'Gagarawa'>Gagarawa</option> \
                     <option value = 'Garki'>Garki</option> \
                     <option value = 'Gumel'>Gumel</option> \
                     <option value = 'Guri'>Guri</option> \
                     <option value = 'Gwaram'>Gwaram</option> \
                     <option value = 'Gwiwa'>Gwiwa</option>\
                     <option value = 'Hadejia'>Hadejia</option> \
                     <option value = 'Jahun'>Jahun</option> \
                     <option value = 'Kafin Hausa'>Kafin Hausa</option> \
                     <option value = 'Kaugama'>Kaugama</option> \
                     <option value = 'Kazaure'>Kazaure</option >\
                     <option value = 'Kiri Kasama'>Kiri Kasama</option> \
                     <option value = 'Kiyawa'>Kiyawa</option>\
                     <option value = 'Maigatari'>Maigatari</option> \
                     <option value = 'Malam Madori'>Malam Madori</option> \
                     <option value = 'Miga'>Miga</option> \
                     <option value = 'Ringim'>Ringim</option> \
                     <option value = 'Roni'> Roni</option > \
                     <option value = 'Sule Tankarkar'>Sule Tankarkar</option> \
                     <option value = 'Taura'>Taura</option >\
                     <option value = 'Yankwashi'>Yankwashi</option>"
                );
        }
        else if (val == "Kaduna") {
            $("#LGASelect").html
                (
                    "<option value = 'Birnin Gwari'>Birnin Gwari</option> \
                     <option value = 'Chikun'>Chikun</option> \
                     <option value = 'Giwa'>Giwa</option> \
                     <option value = 'Igabi'>Igabi</option> \
                     <option value = 'Ikara'>Ikara</option>\
                     <option value = 'Jaba'>Jaba</option> \
                     <option value = 'Gagarawa'>Gagarawa</option> \
                     <option value = 'Jema'a'>Jema'a</option> \
                     <option value = 'Kachia'>Kachia</option> \
                     <option value = 'Kaduna North'>Kaduna North</option> \
                     <option value = 'Kaduna South'>Kaduna South</option> \
                     <option value = 'Gwiwa'>Gwiwa</option>\
                     <option value = 'Kagarko'>Kagarko</option> \
                     <option value = 'Kajuru'>Kajuru</option> \
                     <option value = 'Kaura'>Kaura</option> \
                     <option value = 'Kauru'>Kauru</option> \
                     <option value = 'Kubau'>Kubau</option >\
                     <option value = 'Kudan'>Kudan</option> \
                     <option value = 'Lere'>Lere</option>\
                     <option value = 'Makarf'>Makarf</option> \
                     <option value = 'Sabon Gari'>Sabon Gari</option> \
                     <option value = 'Sanga'>Sanga</option> \
                     <option value = 'Soba'>Soba</option> \
                     <option value = 'Zangon Kataf'>Zangon Kataf</option > \
                     <option value = 'Zaria'>Zaria</option>"
                );
        }
        else if (val == "Kano") {
            $("#LGASelect").html
                (
                    "<option value = 'Ajingi'>Ajingi</option> \
                     <option value = 'Albasu'>Albasu</option> \
                     <option value = 'Bagwai'>Bagwai</option> \
                     <option value = 'Bebeji'>Bebeji</option> \
                     <option value = 'Bich'>Bich</option>\
                     <option value = 'Bunkure'>Bunkure</option> \
                     <option value = 'Dala'>Dala</option> \
                     <option value = 'Dambatta'>Dambatta</option> \
                     <option value = 'Dawakin kudu'>Dawakin kudu</option> \
                     <option value = 'Dawakin Tofa'>Dawakin Tofa</option> \
                     <option value = 'Doguwa'>Doguwa</option> \
                     <option value = 'Fagge'>Fagge</option>\
                     <option value = 'Gabasawa'>Gabasawa</option> \
                     <option value = 'Garko'>Garko</option> \
                     <option value = 'Garun Mallam'>Garun Mallam</option> \
                     <option value = 'Gaya'>Gaya</option> \
                     <option value = 'Gezawa'>Gezawa</option >\
                     <option value = 'Gwale'>Gwale</option> \
                     <option value = 'Gwarzo'>Gwarzo</option>\
                     <option value = 'Kabo'>Kabo</option> \
                     <option value = 'Kano Municipal'>Kano Municipal</option> \
                     <option value = 'Karaye'>Karaye</option> \
                     <option value = 'Kibiya'>Kibiya</option> \
                     <option value = 'Kiru'>Kiru</option > \
                     <option value = 'Kumbtso'>Kumbtso</option> \
                     <option value = 'Kunchi'>Kunchi</option> \
                     <option value = 'Kura'>Kura</option> \
                     <option value = 'Madobi'>Madobi</option> \
                     <option value = 'Makoda'>Makoda</option> \
                     <option value = 'Minjibir'>Minjibir</option> \
                     <option value = 'Nassarawa'>Nassarawa</option> \
                     <option value = 'Rano'>Rano</option> \
                     <option value = 'Rimin Gado'>Rimin Gado</option> \
                     <option value = 'Rogo'>Rogo</option> \
                     <option value = 'Shanono'>Shanono</option> \
                     <option value = 'Sumaila'>Sumaila</option> \
                     <option value = 'Takai'>Takai</option> \
                     <option value = 'Tarauni'>Tarauni</option> \
                     <option value = 'Tofa'>Tofa</option> \
                     <option value = 'Tsanyawa'>Tsanyawa</option> \
                     <option value = 'Tudun Wada'>Tudun Wada</option> \
                     <option value = 'Ungogo'>Ungogo</option> \
                     <option value = 'Warawa'>Warawa</option> \
                     <option value = 'Wudil'>Wudil</option>"
                );
        }
        else if (val == "Katsina") {
            $("#LGASelect").html
                (
                    "<option value = 'Bakori'>Bakori</option> \
                     <option value = 'Batagarawa'>Batagarawa</option> \
                     <option value = 'Batsari'>Batsari</option> \
                     <option value = 'Baure'>Baure</option > \
                     <option value = 'Bindawa'>Bindawa</option> \
                     <option value = 'Charanchi'>Charanchi</option> \
                     <option value = 'Dan Musa'>Dan Musa</option> \
                     <option value = 'Dandume'>Dandume</option> \
                     <option value = 'Danja'>Danja</option> \
                     <option value = 'Daura'>Daura</option> \
                     <option value = 'Dutsi'>Dutsi</option> \
                     <option value = 'Dutsin-Ma'>Dutsin-Ma</option> \
                     <option value = 'Faskari'>Faskari</option> \
                     <option value = 'Funtua'>Funtua</option> \
                     <option value = 'Ingawa'>Ingawa</option> \
                     <option value = 'Jibia'>Jibia</option> \
                     <option value = 'Kafur'>Kafur</option> \
                     <option value = 'Kaita'>Kaita</option> \
                     <option value = 'Kankara'>Kankara</option> \
                     <option value = 'Kankia'>Kankia</option> \
                     <option value = 'Katsina'>Katsina</option> \
                     <option value = 'Kurfi'>Kurfi</option> \
                     <option value = 'Kusada'>Kusada</option> \
                     <option value = 'Mai’Adua'>Mai’Adua</option> \
                     <option value = 'Malumfashi'>Malumfashi</option> \
                     <option value = 'Mani'>Mani</option> \
                     <option value = 'Mashi'>Mashi</option> \
                     <option value = 'Matazu'>Matazu</option> \
                     <option value = 'Musawa'>Musawa</option> \
                     <option value = 'Rimi'>Rimi</option> \
                     <option value = 'Sabuwa'>Sabuwa</option> \
                     <option value = 'Safana'>Safana</option> \
                     <option value = 'Sandamu'>Sandamu</option> \
                     <option value = 'Zango'>Zango</option>"
                );
        }
        else if (val == "Kebbi") {
            $("#LGASelect").html
                (
                    "<option value = 'Aleiro'>Aleiro</option> \
                     <option value = 'Arewa Dandi'>Arewa Dandi</option> \
                     <option value = 'Argungu'>Argungu</option> \
                     <option value = 'Augie'>Augie</option > \
                     <option value = 'Bagudo'>Bagudo</option> \
                     <option value = 'Birnin Kebbi'>Birnin Kebbi</option> \
                     <option value = 'Bunza'>Bunza</option> \
                     <option value = 'Dandi'>Dandi</option> \
                     <option value = 'Fakai'>Fakai</option> \
                     <option value = 'Gwandu'>Gwandu</option> \
                     <option value = 'Jega'>Jega</option> \
                     <option value = 'Kalgo'>Kalgo</option> \
                     <option value = 'Koko/Besse'>Koko/Besse</option> \
                     <option value = 'Maiyama'>Maiyama</option> \
                     <option value = 'Ngaski'>Ngaski</option> \
                     <option value = 'Sakaba'>Sakaba</option> \
                     <option value = 'Shanga'>Shanga</option> \
                     <option value = 'Suru'>Suru</option> \
                     <option value = 'Danko/Wasagu'>Danko/Wasagu</option> \
                     <option value = 'Yauri'>Yauri</option> \
                     <option value = 'Zuru'>Zuru</option>"
                );
        }
        else if (val == "Kogi") {
            $("#LGASelect").html
                (
                    "<option value = 'Adavi'>Adavi</option> \
                     <option value = 'Ajaokuta'>Ajaokuta</option> \
                     <option value = 'Ankpa'>Ankpa</option> \
                     <option value = 'Bassa'>Bassa</option > \
                     <option value = 'Dekina'>Dekina</option> \
                     <option value = 'Ibaji'>Ibaji</option> \
                     <option value = 'Idah'>Idah</option> \
                     <option value = 'Igalamela-Odolu'>Igalamela-Odolu</option> \
                     <option value = 'Ijumu'>Ijumu</option> \
                     <option value = 'Kabba/Bunu'>Kabba/Bunu</option> \
                     <option value = 'Koton Karfe'>Koton Karfe</option> \
                     <option value = 'Lokoja'>Lokoja</option> \
                     <option value = 'Mopa-Muro'>Mopa-Muro</option> \
                     <option value = 'Ofu'>Ofu</option> \
                     <option value = 'Ogori/Magongo'>Ogori/Magongo</option> \
                     <option value = 'Okehi'>Okehi</option> \
                     <option value = 'Okene'>Okene</option> \
                     <option value = 'Olamaboro'>Olamaboro</option> \
                     <option value = 'Omala'>Omala</option> \
                     <option value = 'Yagba East'>Yagba East</option> \
                     <option value = 'Yagba West'>Yagba West</option>"
                );
        }
        else if (val == "Kwara") {
            $("#LGASelect").html
                (
                    "<option value = 'Asa'>Asa</option> \
                     <option value = 'Baruten'>Baruten</option> \
                     <option value = 'Edu'>Edu</option> \
                     <option value = 'Ekiti'>Ekiti</option > \
                     <option value = 'Ifelodun'>Ifelodun</option> \
                     <option value = 'Ilorin East'>Ilorin East</option> \
                     <option value = 'Ilorin South'>Ilorin South</option> \
                     <option value = 'Ilorin West'>Ilorin West</option> \
                     <option value = 'Irepodun'>Irepodun</option> \
                     <option value = 'Isin'>Isin</option> \
                     <option value = 'Kaiama'>Kaiama</option> \
                     <option value = 'Moro'>Moro</option> \
                     <option value = 'Offa'>Offa</option> \
                     <option value = 'Oke Ero'>Oke Ero</option> \
                     <option value = 'Oyun'>Oyun</option> \
                     <option value = 'Pategi'>Pategi</option>"
                );
        }
        else if (val == "Lagos") {
            $("#LGASelect").html
                (
                    "<option value = 'Agege'>Agege</option> \
                     <option value = 'Alimosho Ifelodun'>Alimosho Ifelodun</option> \
                     <option value = 'Alimosho'>Alimosho</option> \
                     <option value = 'Amuwo-Odofin'>Amuwo-Odofin</option > \
                     <option value = 'Apapa'>Apapa</option> \
                     <option value = 'Badagry'>Badagry</option> \
                     <option value = 'Epe'>Epe</option> \
                     <option value = 'Eti-Osa'>Eti-Osa</option> \
                     <option value = 'Ibeju-Lekki'>Ibeju-Lekki</option> \
                     <option value = 'Ifako/Ijaye'>Ifako/Ijaye</option> \
                     <option value = 'Ikeja'>Ikeja</option> \
                     <option value = 'Ikorodu'>Ikorodu</option> \
                     <option value = 'Kosofe'>Kosofe</option> \
                     <option value = 'Lagos Island'>Lagos Island</option> \
                     <option value = 'Lagos Mainland'>Lagos Mainland</option> \
                     <option value = 'Mushin'>Mushin</option> \
                     <option value = 'Ojo'>Ojo</option> \
                     <option value = 'Oshodi –Isolo'>Oshodi –Isolo</option> \
                     <option value = 'Shomolu'>Shomolu</option> \
                     <option value = 'Surulere'>Surulere</option>"
                );
        }
        else if (val == "Nassarawa") {
            $("#LGASelect").html
                (
                    "<option value = 'Akwanga'>Akwanga</option> \
                     <option value = 'Awe'>Awe</option> \
                     <option value = 'Doma'>Doma</option> \
                     <option value = 'Karu'>Karu</option > \
                     <option value = 'Keana'>Keana</option> \
                     <option value = 'Keffi'>Keffi</option> \
                     <option value = 'Kokona'>Kokona</option> \
                     <option value = 'Lafia'>Lafia</option> \
                     <option value = 'Nassarawa'>Nassarawa</option> \
                     <option value = 'Nassarawa/Eggon'>Nassarawa/Eggon</option> \
                     <option value = 'Obi'>Obi</option> \
                     <option value = 'Toto'>Toto</option> \
                     <option value = 'Wamba'>Wamba</option"
                );
        }
        else if (val == "Niger") {
            $("#LGASelect").html
                (
                    "<option value = 'Agaie'>Agaie</option> \
                     <option value = 'Agwara'>Agwara</option> \
                     <option value = 'Bida'>Bida</option> \
                     <option value = 'Borgu'>Borgu</option > \
                     <option value = 'Bosso'>Bosso</option> \
                     <option value = 'Chanchaga'>Chanchaga</option> \
                     <option value = 'Edati'>Edati</option> \
                     <option value = 'Gbako'>Gbako</option> \
                     <option value = 'Gurara'>Gurara</option > \
                     <option value = 'Katcha'>Katcha</option> \
                     <option value = 'Kontagora'>Kontagora</option> \
                     <option value = 'Lapai'>Lapai</option> \
                     <option value = 'Lavun'>Lavun</option > \
                     <option value = 'Magama'>Magama</option> \
                     <option value = 'Mariga'>Mariga</option> \
                     <option value = 'Mashegu'>Mashegu</option> \
                     <option value = 'Mokwa'>Mokwa</option> \
                     <option value = 'Munya'>Munya</option > \
                     <option value = 'Paikoro'>Paikoro</option> \
                     <option value = 'Rafi'>Rafi</option> \
                     <option value = 'Rijau'>Rijau</option> \
                     <option value = 'Shiroro'>Shiroro</option> \
                     <option value = 'Suleja'>Suleja</option> \
                     <option value = 'Tafa'>Tafa</option> \
                     <option value = 'Wushishi'>Wushishi</option"
                );
        }
        else if (val == "Ogun") {
            $("#LGASelect").html
                (
                    "<option value = 'Abeokuta North'>Abeokuta North</option> \
                     <option value = 'Abeokuta South'>Abeokuta South</option> \
                     <option value = 'Ado-Odo/Ota'>Ado-Odo/Ota</option> \
                     <option value = 'Ewekoro'>Ewekoro</option > \
                     <option value = 'Ifo'>Ifo</option> \
                     <option value = 'Ijebu East'>Ijebu East</option> \
                     <option value = 'Ijebu North'>Ijebu North</option> \
                     <option value = 'Ijebu North East'>Ijebu North East</option> \
                     <option value = 'Ijebu Ode'>Ijebu Ode</option > \
                     <option value = 'Ikenne'>Ikenne</option> \
                     <option value = 'Imeko Afon'>Imeko Afon</option> \
                     <option value = 'Ipokia'>Ipokia</option> \
                     <option value = 'Obafemi Owode'>Obafemi Owode</option > \
                     <option value = 'Odogbolu'>Odogbolu</option> \
                     <option value = 'Odeda'>Odeda</option> \
                     <option value = 'Ogun Waterside'>Ogun Waterside</option> \
                     <option value = 'Remo North'>Remo North</option> \
                     <option value = 'Sagamu'>Sagamu</option > \
                     <option value = 'Yewa North'>Yewa North</option> \
                     <option value = 'Yewa South'>Yewa South</option>"
                );
        }
        else if (val == "Ondo") {
            $("#LGASelect").html
                (
                    "<option value = 'Akoko North-East'>Akoko North-East</option> \
                     <option value = 'Akoko North-West'>Akoko North-West</option> \
                     <option value = 'Akoko South-East'>Akoko South-East</option> \
                     <option value = 'Akoko South-West'>Akoko South-West</option > \
                     <option value = 'Akure North'>Akure North</option> \
                     <option value = 'Akure South'>Akure South</option> \
                     <option value = 'Ese Odo'>Ese Odo</option> \
                     <option value = 'Idanre'>Idanre</option> \
                     <option value = 'Ifedore'>Ifedore</option > \
                     <option value = 'Ilaje'>Ilaje</option> \
                     <option value = 'Ile Oluji/Okeigbo'>Ile Oluji/Okeigbo</option> \
                     <option value = 'Irele'>Irele</option> \
                     <option value = 'Odigbo'>Odigbo</option > \
                     <option value = 'Okitipupa'>Okitipupa</option> \
                     <option value = 'Ondo East'>Ondo East</option> \
                     <option value = 'Ondo West'>Ondo West</option> \
                     <option value = 'Ose'>Ose</option> \
                     <option value = 'Owo'>Owo</option >"
                );
        }
        else if (val == "Osun") {
            $("#LGASelect").html
                (
                    "<option value = 'Aiyedaade'>Aiyedaade</option> \
                     <option value = 'Aiyedire'>Aiyedire</option> \
                     <option value = 'Atakunmosa East'>Atakunmosa East</option> \
                     <option value = 'Atakunmosa West'>Atakunmosa West</option > \
                     <option value = 'Boluwaduro'>Boluwaduro</option> \
                     <option value = 'Boripe'>Boripe</option> \
                     <option value = 'Ede North'>Ede North</option> \
                     <option value = 'Ede South'>Ede South</option> \
                     <option value = 'Egbedore'>Egbedore</option > \
                     <option value = 'Ejigbo'>Ejigbo</option> \
                     <option value = 'Ife Central'>Ife Central</option> \
                     <option value = 'Ife East'>Ife East</option> \
                     <option value = 'Ife North'>Ife North</option > \
                     <option value = 'Ife South'>Ife South</option> \
                     <option value = 'Ifedayo'>Ifedayo</option> \
                     <option value = 'Ifelodun'>Ifelodun</option> \
                     <option value = 'Ila'>Ila</option> \
                     <option value = 'Ilesa East'>Ilesa East</option > \
                     <option value = 'Ilesa West'>Ilesa West</option> \
                     <option value = 'Irepodun'>Irepodun</option> \
                     <option value = 'Irewole'>Irewole</option> \
                     <option value = 'Isokan'>Isokan</option> \
                     <option value = 'Iwo'>Iwo</option> \
                     <option value = 'Obokun'>Obokun</option> \
                     <option value = 'Odo Otin'>Odo Otin</option> \
                     <option value = 'Ola Oluwa'>Ola Oluwa</option> \
                     <option value = 'Olorunda'>Olorunda</option> \
                     <option value = 'Oriade'>Oriade</option> \
                     <option value = 'Orolu'>Orolu</option> \
                     <option value = 'Osogbo'>Osogbo</option"
                );
        }
        else if (val == "Oyo") {
            $("#LGASelect").html
                (
                    "<option value = 'Afijio'>Afijio</option> \
                     <option value = 'Akinyele'>Akinyele</option> \
                     <option value = 'Atiba'>Atiba</option> \
                     <option value = 'Atisbo'>Atisbo</option > \
                     <option value = 'Egbeda'>Egbeda</option> \
                     <option value = 'Ibadan North'>Ibadan North</option> \
                     <option value = 'Ibadan North-East'>Ibadan North-East</option> \
                     <option value = 'Ibadan North-West'>Ibadan North-West</option> \
                     <option value = 'Ibadan South-West'>Ibadan South-West</option> \
                     <option value = 'Ibadan South-East'>Ibadan South-East</option> \
                     <option value = 'Ibarapa Central'>Ibarapa Central</option> \
                     <option value = 'Ibarapa East'>Ibarapa East</option> \
                     <option value = 'Ibarapa North'>Ibarapa North</option> \
                     <option value = 'Ido'>Ido</option> \
                     <option value = 'Irepo'>Irepo</option> \
                     <option value = 'Iseyin'>Iseyin</option> \
                     <option value = 'Itesiwaju'>Itesiwaju</option> \
                     <option value = 'Iwajowa'>Iwajowa</option> \
                     <option value = 'Kajola'>Kajola</option> \
                     <option value = 'Lagelu'>Lagelu</option> \
                     <option value = 'Ogbomosho North'>Ogbomosho North</option> \
                     <option value = 'Ogbomosho South'>Ogbomosho South</option> \
                     <option value = 'Oyo East'>Oyo East</option> \
                     <option value = 'Oyo West'>Oyo West</option> \
                     <option value = 'Olorunsogo'>Olorunsogo</option> \
                     <option value = 'Oluyole'>Oluyole</option> \
                     <option value = 'Ogo Oluwa'>Ogo Oluwa</option> \
                     <option value = 'Orelope'>Orelope</option> \
                     <option value = 'Ori Ire'>Ori Ire</option> \
                     <option value = 'Ona Ara'>Ona Ara</option> \
                     <option value = 'Saki West'>Saki West</option> \
                     <option value = 'Saki East'>Saki East</option> \
                     <option value = 'Surulere'>Surulere</option>"
                );
        }
        else if (val == "Plateau") {
            $("#LGASelect").html
                (
                    "<option value = 'Barkin Ladi'>Barkin Ladi</option> \
                     <option value = 'Bassa'>Bassa</option> \
                     <option value = 'Bokkos'>Bokkos</option> \
                     <option value = 'Jos East'>Jos East</option > \
                     <option value = 'Jos North'>Jos North</option> \
                     <option value = 'Jos South'>Jos South</option> \
                     <option value = 'Kanam'>Kanam</option> \
                     <option value = 'Kanke'>Kanke</option> \
                     <option value = 'Langtang North'>Langtang North</option> \
                     <option value = 'Langtang South'>Langtang South</option> \
                     <option value = 'Mangu'>Mangu</option> \
                     <option value = 'Mikang'>Mikang</option> \
                     <option value = 'Pankshin'>Pankshin</option> \
                     <option value = 'Qua’an Pan'>Qua’an Pan</option> \
                     <option value = 'Riyom'>Riyom</option> \
                     <option value = 'Shendam'>Shendam</option> \
                     <option value = 'Wase'>Wase</option>"
                );
        }
        else if (val == "Rivers") {
            $("#LGASelect").html
                (
                    "<option value = 'Port Harcourt'>Port Harcourt</option> \
                     <option value = 'Obio-Akpor'>Obio-Akpor</option> \
                     <option value = 'Okrika'>Okrika</option> \
                     <option value = 'Ogu–Bolo'>Ogu–Bolo</option > \
                     <option value = 'Eleme'>Eleme</option> \
                     <option value = 'Tai'>Tai</option> \
                     <option value = 'Gokana'>Gokana</option> \
                     <option value = 'Khana'>Khana</option> \
                     <option value = 'Oyigbo'>Oyigbo</option> \
                     <option value = 'Opobo–Nkoro'>Opobo–Nkoro</option> \
                     <option value = 'Andoni'>Andoni</option> \
                     <option value = 'Bonny'>Bonny</option> \
                     <option value = 'Degema'>Degema</option> \
                     <option value = 'Asari-Toru'>Asari-Toru</option> \
                     <option value = 'Akuku-Toru'>Akuku-Toru</option> \
                     <option value = 'Abua–Odual'>Abua–Odual</option> \
                     <option value = 'Ahoada West'>Ahoada West</option> \
                     <option value = 'Ahoada East'>Ahoada East</option> \
                     <option value = 'Ogba–Egbema–Ndoni'>Ogba–Egbema–Ndoni</option> \
                     <option value = 'Emohua'>Emohua</option> \
                     <option value = 'Ikwerre'>Ikwerre</option> \
                     <option value = 'Etche'>Etche</option> \
                     <option value = 'Omuma'>Omuma</option>"
                );
        }
        else if (val == "Sokoto") {
            $("#LGASelect").html
                (
                    "<option value = 'Binji'>Binji</option> \
                     <option value = 'Bodinga'>Bodinga</option> \
                     <option value = 'Dange Shuni'>Dange Shuni</option> \
                     <option value = 'Gada'>Gada</option > \
                     <option value = 'Goronyo'>Goronyo</option> \
                     <option value = 'Gudu'>Gudu</option> \
                     <option value = 'Gwadabawa'>Gwadabawa</option> \
                     <option value = 'Illela'>Illela</option> \
                     <option value = 'Isa'>Isa</option> \
                     <option value = 'Kebbe'>Kebbe</option> \
                     <option value = 'Kware'>Kware</option> \
                     <option value = 'Rabah'>Rabah</option> \
                     <option value = 'Sabon Birni'>Sabon Birni</option> \
                     <option value = 'Shagari'>Shagari</option> \
                     <option value = 'Silame'>Silame</option> \
                     <option value = 'Sokoto North'>Sokoto North</option> \
                     <option value = 'Sokoto South'>Sokoto South</option> \
                     <option value = 'Tambuwal'>Tambuwal</option> \
                     <option value = 'Tangaza'>Tangaza</option> \
                     <option value = 'Tureta'>Tureta</option> \
                     <option value = 'Wamako'>Wamako</option> \
                     <option value = 'Wurno'>Wurno</option> \
                     <option value = 'Yabo'>Yabo</option>"
                );
        }
        else if (val == "Taraba") {
            $("#LGASelect").html
                (
                    "<option value = 'Ardo Kola'>Ardo Kola</option> \
                     <option value = 'Bali'>Bali</option> \
                     <option value = 'Donga'>Donga</option> \
                     <option value = 'Gashaka'>Gashaka</option > \
                     <option value = 'Gassol'>Gassol</option> \
                     <option value = 'Ibi'>Ibi</option> \
                     <option value = 'Jalingo'>Jalingo</option> \
                     <option value = 'Karim Lamido'>Karim Lamido</option> \
                     <option value = 'Kurmi'>Kurmi</option> \
                     <option value = 'Lau'>Lau</option> \
                     <option value = 'Sardauna'>Sardauna</option> \
                     <option value = 'Takum'>Takum</option> \
                     <option value = 'Ussa'>Ussa</option> \
                     <option value = 'Wukari'>Wukari</option> \
                     <option value = 'Yorro'>Yorro</option> \
                     <option value = 'Zing'>Zing</option>"
                );
        }
        else if (val == "Yobe") {
            $("#LGASelect").html
                (
                    "<option value = 'Bade'>Bade</option> \
                     <option value = 'Bursari'>Bursari</option> \
                     <option value = 'Damaturu'>Damaturu</option> \
                     <option value = 'Geidam'>Geidam</option > \
                     <option value = 'Gujba'>Gujba</option> \
                     <option value = 'Gulani'>Gulani</option> \
                     <option value = 'Fika'>Fika</option> \
                     <option value = 'Fune'>Fune</option> \
                     <option value = 'Jakusko'>Jakusko</option> \
                     <option value = 'Karasuwa'>Karasuwa</option> \
                     <option value = 'Machina'>Machina</option> \
                     <option value = 'Nangere'>Nangere</option> \
                     <option value = 'Nguru'>Nguru</option> \
                     <option value = 'Potiskum'>Potiskum</option> \
                     <option value = 'Tarmuwa'>Tarmuwa</option> \
                     <option value = 'Yunusari'>Yunusari</option> \
                     <option value = 'Yusufari'>Yusufari</option>"
                );
        }
        else if (val == "Zamfara") {
            $("#LGASelect").html
                (
                    "<option value = 'Anka'>Anka</option> \
                     <option value = 'Bakura'>Bakura</option> \
                     <option value = 'Birnin Magaji/Kiyaw'>Birnin Magaji/Kiyaw</option> \
                     <option value = 'Bukkuyum'>Bukkuyum</option > \
                     <option value = 'Bungudu'>Bungudu</option> \
                     <option value = 'Tsafe'>Tsafe</option> \
                     <option value = 'Gummi'>Gummi</option> \
                     <option value = 'Gusau'>Gusau</option> \
                     <option value = 'Kaura Namoda'>Kaura Namoda</option> \
                     <option value = 'Maradun'>Maradun</option> \
                     <option value = 'Maru'>Maru</option> \
                     <option value = 'Shinkafi'>Shinkafi</option> \
                     <option value = 'Talata Mafara'>Talata Mafara</option> \
                     <option value = 'Zurmi'>Zurmi</option>"
                );
        }
        else if (val == "selected") {
            $("#LGASelect").html
                (
                    "<option value = '0'></option>"
                );
        }
    });

    /*======For date picker=====*/
    $('input[name="daterangepicker"]').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true        
    }) 
      
});

/*===For Profile Image upload===*/
$(function () {
    $("#fileupload").change(function (event) {
        var x = URL.createObjectURL(event.target.files[0]);
        $("#upload-img").attr("src", x);
        console.log(event);
    });
})




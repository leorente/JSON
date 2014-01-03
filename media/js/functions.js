/// <reference path="jquery-1.10.2.min.js" />
var oTable;

function Ajax(DTO, NomePagina, ElementHtml, btnLabelLoading, metodoNome) {

    var oldLabel;
    $.ajax({
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(DTO),
        dataType: "json",
        type: "POST",
        url: NomePagina + "/" + metodoNome,
        beforeSend: function () {
            oldLabel = ElementHtml.attr("value");
            ElementHtml.attr("disabled", "disabled");
            ElementHtml.attr("value", btnLabelLoading);
        },
        complete: function () {
            ElementHtml.attr("value", oldLabel);
            ElementHtml.removeAttr("disabled");
        },
        error: function (jqXHR, textStatus, errorThrown) { console.log(jqXHR); }
    });
}

function PopulaGrid(nomePag, nomeMetodo, DTO, htmlGridElement) {
    $.ajax({
        type: "POST",
        url: nomePag + "/" + nomeMetodo,
        data: JSON.stringify(DTO),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            // Popula DataTable (Jquery plugin)
            oTable = htmlGridElement.dataTable({
                "aaData": response.d,
                "fnCreatedRow": function (nRow, aData, iDisplayIndex) {
                    /* Append the grade to the default row class name */
                    $('td:last-child', nRow).parent().append('<td><input type="button" id="' + aData.Id + '" itemIndex="' + iDisplayIndex + '" class="btn btn-danger btn-xs deleteReg" value="Delete" /></td>');
                },
                "aoColumns": [
                    { "mDataProp": "Id" },
                    { "mDataProp": "FirstName" },
                    { "mDataProp": "LastName" },
                    { "mDataProp": "Address" },
                    { "mDataProp": "City" },
                    { "mDataProp": "State" },
                    { "mDataProp": "Zip" },
                ],
                "aaSorting": [[0, "desc"]],
            });

            // Acerto para Loading da grid.
            $("#grid").toggleClass("hidden", "display").hide().fadeIn("slow");
        },
        error: function (request, status, error) {
            console.log(request);
        }
    });
}
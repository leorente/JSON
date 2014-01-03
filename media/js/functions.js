/// <reference path="jquery-1.10.2.min.js" />
var oTable;

function Ajax(DTO, NomePagina, ElementHtml, btnLabelLoading, metodoNome, locationHref) {
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

            if (locationHref !== undefined) {
                location.href = locationHref;
            }
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
                    // Cria botoes de delete
                    $('td:last-child', nRow).parent().append('<td><input type="button" id="' + aData.Id + '" itemIndex="' + iDisplayIndex + '" class="btn btn-danger btn-xs deleteReg" value="Apagar" /></td>');
                },
                "aoColumns": [
                    { "mDataProp": "Id" },
                    { "mDataProp": "Nome" },
                    { "mDataProp": "SobreNome" },
                    { "mDataProp": "Endereco" },
                    { "mDataProp": "Cep" },
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
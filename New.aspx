<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="New.aspx.cs" Inherits="New" %>

<asp:Content ID="c" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            var nomePagInicial = location.pathname.substring(location.pathname.lastIndexOf("/") + 1);

            $("#Save").click(function () {
                var NewPerson = {};
                $('input[type=text]').each(function () {
                    NewPerson[this.id] = this.value;
                });

                Ajax({ 'obj': NewPerson }, nomePagInicial, $(this), "Gravando...", "Add");
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="Server">
    <fieldset>
        <legend>Formulario</legend>

        <div class="form-group">
            <label for="FirstName">First Name:</label>
            <input type="text" id="FirstName" />
        </div>
        <div class="form-group">
            <label for="LastName">Last Name:</label>
            <input type="text" id="LastName" />
        </div>
        <div class="form-group">
            <label>Address:</label>
            <input type="text" id="Address" />
        </div>

        <div class="form-group">
            <label>City:</label>
            <input type="text" id="City" />
        </div>

        <div class="form-group">
            <label>State:</label>
            <input type="text" id="State" />
        </div>

        <div class="form-group">
            <label>Zip</label>
            <input type="text" id="Zip" />
        </div>
    </fieldset>

    <input type="button" id="Save" value="Save" class="btn btn-primary btn-lg" />
    <label class='loading_msg label label-primary'><i class='glyphicon glyphicon-repeat'></i> Salvando...</label>
</asp:Content>
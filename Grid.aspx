<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="Grid.aspx.cs" Inherits="Grid" %>

<asp:Content ID="h" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            var nomePag = location.pathname.substring(location.pathname.lastIndexOf("/") + 1);
            PopulaGrid(nomePag, "Get", { 'obj': 0 }, $("#grid"));

            // Clique do botão delete do grid
            $('body').on('click', '.deleteReg', function () {
                if (confirm("Você deseja apagar o registro com ID " + this.id + " ?")) {
                    Ajax({ 'obj': this.id }, nomePag, $(this), "Apagando...", "Delete");
                    oTable.fnDeleteRow($(this).attr("itemIndex"));
                } else
                    return false;
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="Server">
    <fieldset>
        <legend>Grid</legend>

        <table id="grid" class="hidden">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nome</th>
                    <th>Sobre Nome</th>
                    <th>Endereço</th>
                    <th>Cep</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody></tbody>
            <tfoot></tfoot>
        </table>
    </fieldset>
</asp:Content>

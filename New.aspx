<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeFile="New.aspx.cs" Inherits="New" %>

<asp:Content ID="c" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            var nomePagInicial = location.pathname.substring(location.pathname.lastIndexOf("/") + 1);

            $("#Save").click(function () {
                var NewPessoa = {};
                $('input[type=text]').each(function () {
                    NewPessoa[this.id] = this.value;
                });

                Ajax({ 'obj': NewPessoa }, nomePagInicial, $(this), "Gravando...", "Add", "Grid.aspx");
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="container" runat="Server">
    <fieldset>
        <legend>Formulario</legend>

        <div class="form-group">
            <label for="Nome">Nome:</label>
            <input type="text" id="Nome" />
        </div>
        <div class="form-group">
            <label for="SobreNome">Sobre Nome:</label>
            <input type="text" id="SobreNome" />
        </div>
        <div class="form-group">
            <label>Endereço:</label>
            <input type="text" id="Endereco" />
        </div>

        <div class="form-group">
            <label>Cep:</label>
            <input type="text" id="Cep" />
        </div>
    </fieldset>

    <input type="button" id="Save" value="Save" class="btn btn-primary btn-lg" />
    <label class='loading_msg label label-primary'><i class='glyphicon glyphicon-repeat'></i> Salvando...</label>
</asp:Content>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintPage.aspx.cs" Inherits="Revindex.Dnn.RevindexStorefront.PrintPage" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body onload="OnLoad()">
    <form id="form1" runat="server">
    <asp:Panel ID="ContentPanel" name="ContentPanel" runat="server" ClientIDMode="Static">
		<asp:PlaceHolder ID="MessagePlaceHolder" runat="server" EnableViewState="False" />
		<asp:Literal ID="BodyLiteral" runat="server"></asp:Literal>
    </asp:Panel>
    <script src="https://unpkg.com/jspdf@1.5.3/dist/jspdf.min.js"></script>
    <script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
    <script>
        function ConvertPxToPt(px) {
            return px * 72 / 96;
        }

        function ConvertPtToPx(pt) {
            return pt * 96 / 72;
        }

        function OnLoad() {

            <% if (this.Output == "printer") { %> 
                window.print()
            <% } else if (this.Output == "pdf") { %>
        
                var doc = new jsPDF("<%= this.Orientation %>", "pt", "<%= this.Paper %>")
                var pageWidthPt = doc.internal.pageSize.getWidth()
                var pageHeightPt = doc.internal.pageSize.getHeight()
                var marginTopPt = <%= this.MarginTop %>
                var marginRightPt = <%= this.MarginRight %>
                var marginBottomPt = <%= this.MarginBottom %>
                var marginLeftPt = <%= this.MarginLeft %>
                var printHeightPt = pageHeightPt - (marginTopPt + marginBottomPt)
                var resizedCanvasWidthPt = pageWidthPt - (marginLeftPt + marginRightPt)

                // Force content to be same width as paper size
                document.getElementById("ContentPanel").style.width = resizedCanvasWidthPt + "pt"

                html2canvas(document.getElementById("ContentPanel"), {
                    scale: 2,
                    backgroundColor: "#ffffff"
                })
                .then(function (srcCanvas) {
                    
                    var resizedCanvasHeightPt = ConvertPxToPt(srcCanvas.height) * resizedCanvasWidthPt / ConvertPxToPt(srcCanvas.width)

                    // Resize image keeping aspect ratio and margin
                    var resizedCanvas = document.createElement('canvas')
                    var resizedCtx = resizedCanvas.getContext('2d')
                    resizedCtx.imageSmoothingEnabled = false;
                    resizedCanvas.width = ConvertPtToPx(resizedCanvasWidthPt)
                    resizedCanvas.height = ConvertPtToPx(resizedCanvasHeightPt)
                    resizedCtx.drawImage(srcCanvas, 0, 0, srcCanvas.width, srcCanvas.height, 0, 0, resizedCanvas.width, resizedCanvas.height)

                    // Split canvas into multiple pages and add each one to PDF page
                    var resizedCanvasHeightLeftPt = resizedCanvasHeightPt
                    var position = 0
                    while (resizedCanvasHeightLeftPt > 0) {
                        var splitCanvas = document.createElement('canvas')
                        var splitCtx = splitCanvas.getContext('2d')
                        splitCanvas.width = ConvertPtToPx(resizedCanvasWidthPt)
                        splitCanvas.height = ConvertPtToPx(printHeightPt)
                        
                        splitCtx.drawImage(resizedCanvas, 0, position * splitCanvas.height, resizedCanvas.width, splitCanvas.height, 0, 0, splitCanvas.width, splitCanvas.height)
                        var splitImg = new Image()
                        splitImg.src = splitCanvas.toDataURL("image/png")

                        if (position > 0)
                            doc.addPage()

                        doc.addImage(splitImg, 'JPEG', marginLeftPt, marginTopPt, resizedCanvasWidthPt, printHeightPt);

                        resizedCanvasHeightLeftPt -= printHeightPt
                        position++
                    }

                    // Output file
                    doc.save("<%= this.OutFile %>")
                })
            <% } %>
        }
    </script>
    </form>
</body>
</html>

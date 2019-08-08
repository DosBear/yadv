<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rpr="urn:customs.ru:Information:SQDocuments:RosPatentRes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="rpr:RosPatentRes">
      <html>
         <head>
            <title>Сведения из Госреестра товарных знаков и знаков обслуживания/из Перечня общеизвестных в РФ товарных знаков/из Госреестра наименований мест происхождений товаров РФ</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
					background: #ffffff;
				}

				div.page {
					width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					height: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}
				
				.remark {
					text-align:right;
					font: 15;
					font-family: Arial, serif;
					text-decoration: underline;
				}
				
				.header {
					font-weight: bold;
					margin-top:20px;
				}
				
				 table {
					width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
				}

				td {
					border: 1px solid gray;
					font-family: Courier, serif;
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-fase: Courier;
				}
				.graph {
							font-family: Arial;
							font-size: 10pt;
							}
				jh {
				font: 16;
				font-face: Arial;
				}
				dog1 {
	            position:relative;
	            left: 50px;
	            bottom: 50px;
	            }
	            .gra {
							font-family: Arial;
							font-size: 6pt;
							}
				.g{
							border-right:0pt solid;
							}
				</style>
         </head>
         <body>
            <div class="page">
               <table>
                  <tr>
                     <td align="center" class="graph" style="border:solid 0pt">
                        <font face="Times new roman" size="4">
                           <b>Сведения
				<xsl:if test="rpr:DocSign=1"> из Госреестра товарных знаков и знаков обслуживания</xsl:if>
                              <xsl:if test="rpr:DocSign=2"> из Перечня общеизвестных в РФ товарных знаков</xsl:if>
                              <xsl:if test="rpr:DocSign=3"> из Госреестра наименований мест происхождений товаров РФ</xsl:if>
                           </b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">
                        <u>Тип объекта</u>: 
				<xsl:value-of select="rpr:ObjectType"/>
                     </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">
                        <u>Номер объекта</u>: 
				<xsl:value-of select="rpr:ObjectNum"/>
                     </td>
                  </tr>
                  <xsl:if test="rpr:ObjectDescription">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
                           <u>Описание объекта</u>: <xsl:value-of select="rpr:ObjectDescription"/>
                        </td>
                     </tr>
                  </xsl:if>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>

<!-- Бланк в свободной форме -->

<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:mvcf="urn:customs.ru:Information:CustomsDocuments:MovementConfirmation:5.13.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="mvcf:MovementConfirmation">
      <html>
         <head>
            <title>Уведомление о фактическом ввозе/вывозе товара</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
					background: #cccccc;
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
							font-size: 12pt;
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
                        <font face="Times new roman" size="5">
                           <b>Уведомление 
							  <xsl:if test="mvcf:DocSign='3'">о прибытии МПО в ММПО</xsl:if>
							  <xsl:if test="mvcf:DocSign='2'">о завершении действия пропуска</xsl:if>
							  <xsl:if test="mvcf:DocSign='1'">об убытии товаров</xsl:if>
                              <xsl:if test="mvcf:DocSign='0'">о фактическом ввозе товара</xsl:if>
                           </b>
                        </font>
                     </td>
                  </tr>
                  <tr>
                     <td style="border:solid 0pt"> </td>
                  </tr>
                  <tr>
                     <td class="graph" style="border:solid 0pt">Дата фактического 
						<xsl:if test="mvcf:DocSign='3'">прибытия МПО в ММПО: </xsl:if>
						<xsl:if test="mvcf:DocSign='2'">завершения действия пропуска: </xsl:if>
						<xsl:if test="mvcf:DocSign='1'">убытия товаров: </xsl:if>
                        <xsl:if test="mvcf:DocSign='0'">ввоза товаров: </xsl:if>
                        <xsl:call-template name="russian_date">
                           <xsl:with-param name="dateIn" select="mvcf:MovementDate"/>
                        </xsl:call-template>
                     </td>
                  </tr>
                  <xsl:if test="mvcf:RegistrationNumber">
					  <tr>
						 <td class="graph" style="border:solid 0pt">
							<xsl:text>Регистрационный номер уведомления о</xsl:text>
							<xsl:if test="mvcf:DocSign='3'"> прибытии МПО в ММПО: </xsl:if>
							<xsl:if test="mvcf:DocSign='2'"> завершении действия пропуска: </xsl:if>
							<xsl:if test="mvcf:DocSign='1'">б убытии товаров: </xsl:if>
							<xsl:if test="mvcf:DocSign='0'"> ввозе: </xsl:if>
							<xsl:value-of select="mvcf:RegistrationNumber/mvcf:CustomsCode"/>
							<xsl:text>/</xsl:text>
							<xsl:call-template name="russian_date_gtd">
							   <xsl:with-param name="dateIn" select="mvcf:RegistrationNumber/mvcf:RegistrationDate"/>
							</xsl:call-template>
							<xsl:text>/</xsl:text>
							<xsl:value-of select="mvcf:RegistrationNumber/mvcf:Number"/>
						 </td>
					  </tr>
                  </xsl:if>
                  <xsl:if test="mvcf:MPO_Number">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
							Уникальный номер МПО: <xsl:value-of select="mvcf:MPO_Number"/>
                        </td>
                     </tr>
                  </xsl:if>
                  <xsl:if test="mvcf:Comments">
                     <tr>
                        <td class="graph" style="border:solid 0pt">
							Комментарий: <xsl:value-of select="mvcf:Comments"/>
                        </td>
                     </tr>
                  </xsl:if>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template name="russian_date">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template name="russian_date_gtd">
      <xsl:param name="dateIn"/>
      <xsl:choose>
         <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
            <xsl:value-of select="substring($dateIn,9,2)"/>
            <xsl:value-of select="substring($dateIn,6,2)"/>
            <xsl:value-of select="substring($dateIn,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dateIn"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>

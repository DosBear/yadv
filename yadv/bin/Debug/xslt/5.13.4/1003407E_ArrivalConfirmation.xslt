<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:arcn="urn:customs.ru:Information:TransportDocuments:Railway:ArrivalConfirmation:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
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
      <xsl:param name="dategtd"/>
      <xsl:choose>
         <xsl:when test="substring($dategtd,5,1)='-' and substring($dategtd,8,1)='-'">
            <xsl:value-of select="substring($dategtd,9,2)"/>
            <xsl:value-of select="substring($dategtd,6,2)"/>
            <xsl:value-of select="substring($dategtd,3,2)"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="$dategtd"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="arcn:ArrivalConfirmation">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Подтверждение о прибытии</title>
            <style type="text/css">
				body {background-color: #cccccc;}

				div.page {
					width: 210mm;
					margin: 6pt auto;
					padding: 10mm;
					background: white;
					border: solid 1px black;
				}

				/*Стиль для удаления чёрной границы вокруг нарисованной "страницы"  при печати*/
				@media print {div.page {border: none; margin: 0; padding: 0;}}

				h1 {
					text-align: center;
					font-size: 16pt;
					margin-bottom: 10pt;
					counter-reset: numbered;
				}

				h2.numbered:after {
					content: " № " counter(numbered);
					counter-increment: numbered;
				}

				h2 {
					font-size: 14pt;
					text-align: center;
					margin-top: 20pt;
				}


				p {padding-left: 10pt;}
				
				.low 
				{
					font-size: 13;
				}
				
				.auxiliary tbody tr td { border: 0; }
			</style>
         </head>
         <body>
            <div class="page">
               <h1>Подтверждение о прибытии</h1>
               <xsl:apply-templates select="arcn:NotifDate"/>
				
				Подтверждение о прибытии: 
				<xsl:apply-templates select="arcn:Confirmation"/>
               <br/>
               <!--Номер транзитной декларации:
				<xsl:apply-templates select="arcn:TD"/><br/>-->
               <xsl:choose>
                  <xsl:when test="arcn:TD">
											Номер транзитной декларации:
											
												<xsl:value-of select="arcn:TD/cat_ru:CustomsCode"/>/<xsl:call-template name="russian_date_gtd">
                        <xsl:with-param name="dategtd" select="arcn:TD/cat_ru:RegistrationDate"/>
                     </xsl:call-template>/<xsl:value-of select="arcn:TD/cat_ru:GTDNumber"/>
                  </xsl:when>
                  <xsl:otherwise>
											Номер книжки МДП:
											
												<xsl:value-of select="arcn:TIRID/arcn:TIRSeries"/>
                     <xsl:value-of select="arcn:TIRID/arcn:TIRID"/>
                  </xsl:otherwise>
               </xsl:choose>
               <br/>
               <xsl:if test="arcn:Comment">
					Комметарий: 
					<xsl:value-of select="arcn:Comment"/>
               </xsl:if>
               <xsl:apply-templates select="arcn:CustomsPerson"/>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="arcn:NotifDate">
      <div align="right">
         <table border="1" style="margin-top:10px; width:60mm; border: 0">
            <tbody>
               <tr>
                  <td align="center" style="border-right:0; border-left:0; border-top:0">
                     <xsl:call-template name="russian_date">
                        <xsl:with-param name="dateIn" select="."/>
                     </xsl:call-template>
                     <xsl:text disable-output-escaping="yes">&amp;nbsp</xsl:text>
                     <xsl:value-of select="substring(//arcn:NotifTime, 1, 5)"/>
                  </td>
               </tr>
               <tr>
                  <td align="center" class="low" style="border:0;">(Дата, время подачи уведомления)</td>
               </tr>
            </tbody>
         </table>
      </div>
   </xsl:template>
   <xsl:template match="arcn:Confirmation">
      <span>
         <xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if>
         <xsl:if test="cat_ru:PrDocumentDate">
			от 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>
   </xsl:template>
   <xsl:template match="arcn:TD">
      <xsl:value-of select="cat_ru:CustomsCode"/> / 
	<xsl:value-of select="substring(cat_ru:RegistrationDate,9,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,6,2)"/>
      <xsl:value-of select="substring(cat_ru:RegistrationDate,3,2)"/> / 
	<xsl:value-of select="cat_ru:GTDNumber"/>
   </xsl:template>
   <xsl:template match="arcn:CustomsPerson">
      <table border="1" style="margin-top:50px; width:100%; border:0; ">
         <tbody>
            <tr>
               <td align="center" style="border-right:0; border-left:0; border-top:0" width="60%">
                  <xsl:value-of select="cat_ru:PersonName"/>
               </td>
               <td style="border:0;" width="40px"/>
               <td align="center" style="border-right:0; border-left:0; border-top:0" width="25%">
                  <xsl:value-of select="cat_ru:LNP"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="low" style="border:0;">(Ф.И.О. должностного лица ТО, выдавшего Подтверждение)</td>
               <td style="border:0;"/>
               <td align="center" class="low" style="border:0;">(ЛНП)</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
</xsl:stylesheet>

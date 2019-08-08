<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:acf="urn:customs.ru:Information:TransportDocuments:Railway:ActCommonForm:5.12.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="/">
      <xsl:apply-templates/>
   </xsl:template>
   <xsl:template match="acf:ActCommonForm">
      <html>
         <head>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <title>Акт общей формы</title>
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
               <h1>Акт общей формы</h1>
               <table border="1" style="border:0" width="100%">
                  <tbody>
                     <tr>
                        <td style="border: 0;" width="15%">Станция, код </td>
                        <td align="center" style="border-left: 0; border-right: 0; border-top: 0">
                           <xsl:apply-templates select="acf:Station"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" style="border:0" width="100%">
                  <tbody>
                     <tr>
                        <td style="border: 0;" width="10%">Поезд N </td>
                        <td align="center" style="border-left: 0; border-right: 0; border-top: 0" width="35%">
                           <xsl:value-of select="acf:TrainNumber"/>
                        </td>
                        <td align="center" style="border: 0;" width="15%">на перегоне</td>
                        <td align="center" style="border-left: 0; border-right: 0; border-top: 0" width="40%">
                           <xsl:value-of select="acf:Span"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <xsl:apply-templates select="acf:ActInfo/cat_ru:PrDocumentDate"/>
               <p align="center">Настоящий акт составлен в присутствии следующих лиц:</p>
               <table border="1" style="border:0" width="100%">
                  <tbody>
                     <xsl:for-each select="acf:Person">
                        <tr>
                           <td align="center" style="border-left: 0; border-right: 0; border-top: 0">
                              <xsl:apply-templates select="."/>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="low" style="border: 0">(фамилия, должность)</td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
               <xsl:call-template name="space"/>
               <table border="1" style="border:0" width="100%">
                  <tbody>
                     <tr>
                        <td style="border: 0; vertical-align: bottom" width="15%">Перевозчик</td>
                        <td align="center" style="border-left: 0; border-right: 0; border-top: 0">
                           <xsl:apply-templates select="acf:Carrier"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" style="border:0" width="100%">
                  <tbody>
                     <tr>
                        <td style="border: 0;" width="25%">Станция отправления</td>
                        <td align="center" style="border-left: 0; border-right: 0; border-top: 0">
                           <xsl:apply-templates select="acf:DepartureStation"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" style="border:0" width="100%">
                  <tbody>
                     <tr>
                        <td style="border: 0;" width="25%">Станция назначения</td>
                        <td align="center" style="border-left: 0; border-right: 0; border-top: 0">
                           <xsl:apply-templates select="acf:DispatchStation"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" style="border:0" width="100%">
                  <tbody>
                     <tr>
                        <td style="border: 0;" width="15%">Отправка N</td>
                        <td align="center" style="border-left: 0; border-right: 0; border-top: 0">
                           <xsl:value-of select="acf:ShipmentNumber"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <table border="1" style="border:0" width="100%">
                  <tbody>
                     <tr>
                        <td style="border: 0;" width="30%">дата приема груза к перевозке <xsl:apply-templates select="acf:ReceiptDate"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <xsl:call-template name="space"/>
               <table border="1" style="border:0" width="100%">
                  <tbody>
                     <xsl:for-each select="acf:Goods">
                        <tr>
                           <td style="border: 0;" width="20%">Вагон, контейнер N </td>
                           <td align="center" style="border-left: 0; border-right: 0; border-top: 0">
                              <!--<xsl:for-each select="acf:Goods">-->
                              <xsl:if test="acf:Carriage">
                                 <xsl:value-of select="acf:Carriage"/>
                              </xsl:if>
                              <xsl:if test="acf:Container">
                                 <xsl:if test="acf:Carriage">,</xsl:if>
                                 <xsl:value-of select="acf:Container"/>
                              </xsl:if>
                              <!--</xsl:for-each>-->
                           </td>
                           <td style="border: 0;" width="20%"> наименование груза </td>
                        </tr>
                        <tr>
                           <td align="center" colspan="3" style="border-left: 0; border-right: 0; border-top: 0">
                              <!--<xsl:for-each select="acf:Goods">-->
                              <xsl:for-each select="acf:GoodsDescription">
                                 <xsl:value-of select="."/>
                              </xsl:for-each>
                              <!--</xsl:for-each>	-->
                           </td>
                        </tr>
                     </xsl:for-each>
                  </tbody>
               </table>
				
				Описание обстоятельств, вызвавших составление акта:<br/>
               <span style="text-decoration:underline">
                  <xsl:value-of select="acf:Reason"/>
               </span>
               <div align="right" style="margin-top:20px">
                  <table>
                     <tbody>
                        <xsl:variable name="numbCol" select="count(acf:Person)"/>
                        <tr>
                           <td rowspan="$numbCol" style="vertical-align:top">Подписи: </td>
                           <td>
                              <xsl:for-each select="acf:Person">
                                 <span style="text-decoration:underline">
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:value-of select="cat_ru:PersonSurname"/>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:if test="acf:Comment">(<xsl:value-of select="acf:Comment"/>)</xsl:if>
                                    <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                                    <xsl:if test="cat_ru:IssueDate">
                                       <xsl:call-template name="russian_date">
                                          <xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
                                       </xsl:call-template>
                                    </xsl:if>
                                 </span>
                                 <br/>
                              </xsl:for-each>
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </div>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="acf:Station | acf:DepartureStation | acf:DispatchStation">
      <!-- ЖД станция -->
      <xsl:value-of select="acf:StationName"/>
      <xsl:if test="acf:StationCode"> (<xsl:value-of select="acf:StationCode"/>)</xsl:if>;
	<xsl:if test="acf:RailwayCode">
		код ж/д: <xsl:value-of select="acf:RailwayCode"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="acf:ActInfo/cat_ru:PrDocumentDate">
      <div align="right" style="margin-top:10px; ">
         <span style="text-decoration:underline">
			"<xsl:value-of select="substring(., 9, 2)"/>"
			<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:call-template name="month">
               <xsl:with-param name="numb" select="substring(., 6, 2)"/>
            </xsl:call-template>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="substring(., 1, 4)"/> г.
		</span>
      </div>
   </xsl:template>
   <xsl:template name="month">
      <xsl:param name="numb"/>
      <xsl:choose>
         <xsl:when test="01 or 1">января</xsl:when>
         <xsl:when test="02 or 2">февраля</xsl:when>
         <xsl:when test="03 or 3">марта</xsl:when>
         <xsl:when test="04 or 4">апреля</xsl:when>
         <xsl:when test="05 or 5">мая</xsl:when>
         <xsl:when test="06 or 6">июня</xsl:when>
         <xsl:when test="07 or 7">июля</xsl:when>
         <xsl:when test="08 or 8">августа</xsl:when>
         <xsl:when test="09 or 9">сентября</xsl:when>
         <xsl:when test="10">октября</xsl:when>
         <xsl:when test="11">ноября</xsl:when>
         <xsl:when test="12">декабря</xsl:when>
      </xsl:choose>
   </xsl:template>
   <xsl:template match=" acf:ReceiptDate">
      <span style="text-decoration:underline">
		"<xsl:value-of select="substring(., 9, 2)"/>"
		<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:call-template name="month">
            <xsl:with-param name="numb" select="substring(., 6, 2)"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="substring(., 1, 4)"/> г.
	</span>
   </xsl:template>
   <xsl:template match="acf:Person">
      <xsl:value-of select="cat_ru:PersonSurname"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cat_ru:PersonName"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:value-of select="cat_ru:PersonMiddleName"/>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <xsl:if test="cat_ru:PersonPost">, <xsl:value-of select="cat_ru:PersonPost"/>
      </xsl:if>
      <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
      <!--<xsl:call-template name="russian_date">
		<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
	</xsl:call-template>-->
   </xsl:template>
   <xsl:template match="acf:Carrier">
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName">(</xsl:if>
         <xsl:value-of select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
      </xsl:if>.  
	
	<xsl:choose>
         <xsl:when test="cat_ru:RFOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RKOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RBOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
         </xsl:when>
      </xsl:choose>.
	
	<xsl:if test="cat_ru:Address">
         <xsl:apply-templates select="cat_ru:Address"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCard">
         <xsl:apply-templates select="cat_ru:IdentityCard"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">
         <span>ОГРН: <xsl:value-of select="cat_ru:OGRN"/>
         </span>; 
	</xsl:if>
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span>; 
	</xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>; 
	</xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span>; 
	</xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span>; 
	</xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="cat_ru:Address">
	Адрес: 
	<xsl:if test="cat_ru:CounryName">
         <xsl:value-of select="cat_ru:CounryName"/>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">(<xsl:value-of select="cat_ru:CountryCode"/>)</xsl:if>
      <xsl:if test="cat_ru:Region">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName">, </xsl:if>
         <xsl:value-of select="cat_ru:Region"/>
      </xsl:if>
      <xsl:if test="cat_ru:City">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region">, </xsl:if>
         <xsl:value-of select="cat_ru:City"/>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
         <xsl:if test="cat_ru:CountryCode or cat_ru:CounryName or cat_ru:Region or cat_ru:City">, </xsl:if>
         <xsl:value-of select="cat_ru:StreetHouse"/>
      </xsl:if>. 
	<xsl:if test="cat_ru:PostalCode">Индекс: <xsl:value-of select="cat_ru:PostalCode"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:IdentityCard">
      <span class="header">Документ удостоверяющий личность:</span>;  
	<xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode">(код вида документа - <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode"/>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:IdentityCardNumber"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан 
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
      </xsl:if>
   </xsl:template>
   <xsl:template name="space">
      <table border="1" style="border:0" width="100%">
         <tbody>
            <tr>
               <td style="border-left: 0; border-right: 0; border-top: 0">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </td>
            </tr>
            <tr>
               <td style="border-left: 0; border-right: 0; border-top: 0">
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <!--<xsl:template>
	<table border="1" style="border:0" width="100%">
		<tbody>
			<tr>
				<td style="border: 0;"></td>
				<td style="border-left: 0; border-right: 0; border-top: 0" align="center"></td>
			</tr>
		</tbody>
	</table>
</xsl:template>	-->
</xsl:stylesheet>

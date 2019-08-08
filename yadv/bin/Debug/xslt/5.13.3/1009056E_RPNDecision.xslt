<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:ptnzdn="urn:customs.ru:Information:SQDocuments:RPNDecision:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="utf-8" indent="yes" media-type="text/html" method="html" omit-xml-declaration="yes" version="1.0"/>
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
   <xsl:template name="date_time">
      <xsl:param name="dateTimeIn"/>
      <xsl:call-template name="russian_date">
         <xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
      </xsl:call-template>
      <xsl:text> </xsl:text>
      <xsl:value-of select="substring($dateTimeIn,12,5)"/>
   </xsl:template>
   <xsl:template match="ptnzdn:RPNDecision">
      <html>
         <head>
            <title>Санитарно-карантинный контроль</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
			body {
				background: #cccccc;
			}

			div.page {
				width: 210mm;
				height: 297mm;
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
				
				margin-top:20px;
				font: bold;
				
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
				font-family: Arial, serif;
			}
			
			.auxiliary tbody tr td {
				border: 0;
			}
		</style>
         </head>
         <body>
            <div class="page">
               <h2>Санитарно-карантинный контроль </h2>
               <!-- Дата / время принятия решения -->
               <div align="right">
                  <table border="0" style="margin-top:30px; margin-bottom:20px">
                     <tbody>
                        <tr>
                           <td align="center" style="border-right:0; border-left:0; border-top:0;">
                              <xsl:value-of select="ptnzdn:Decision"/>
                           </td>
                           <td style="border:0;" width="60px"/>
                           <td align="center" style="border-right:0; border-left:0; border-top:0; width:60mm">
                              <xsl:call-template name="russian_date">
                                 <xsl:with-param name="dateIn" select="ptnzdn:DecisionDate"/>
                              </xsl:call-template>
                              <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                              <xsl:if test="ptnzdn:DecisionTime">
                                 <xsl:value-of select="substring(ptnzdn:DecisionTime, 1, 8)"/>
                              </xsl:if>
                           </td>
                        </tr>
                        <tr>
                           <td align="center" class="low" style="border:0;">(Решение)</td>
                           <td style="border:0;" width="40px"/>
                           <td align="center" class="low" style="border:0;">(Дата, время принятия решения)</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <span class="header">Наименование пропускного пункта: </span>
               <span>
                  <xsl:value-of select="ptnzdn:KppName"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
               </span>
               <br/>
               <br/>
               <span class="header">Товар: </span>
               <span>
                  <xsl:for-each select="ptnzdn:GoodsDescription/ptnzdn:GoodName">
                     <xsl:value-of select="."/>
                  </xsl:for-each>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:apply-templates select="ptnzdn:GoodsDescription/ptnzdn:Quantity"/>
               </span>
               <br/>
               <br/>
               <table>
                  <tbody>
                     <tr>
                        <td colspan="2">
                           <span class="header">Транспортное средство: </span>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2">
                           <xsl:apply-templates select="ptnzdn:Transport"/>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <span class="header">Отправитель</span>
                        </td>
                        <td>
                           <span class="header">Получатель</span>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <xsl:apply-templates select="ptnzdn:Consignor"/>
                        </td>
                        <td>
                           <xsl:apply-templates select="ptnzdn:Consignee"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <xsl:apply-templates select="ptnzdn:Officer"/>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="ptnzdn:Quantity">
      <xsl:value-of select="cat_ru:GoodsQuantity"/>
      <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
      <xsl:if test="cat_ru:MeasureUnitQualifierCode">
		(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
	</xsl:if>
   </xsl:template>
   <xsl:template match="ptnzdn:Transport">
      <table border="0" class="auxiliary">
         <!-- вставить в <style/>	.auxiliary tbody tr td { border: 0; } -->
         <tbody>
            <tr>
               <td>
                  <xsl:if test="cat_ru:VIN">Номер шасси <xsl:value-of select="cat_ru:VIN"/>
                  </xsl:if>
                  <br/>
                  <xsl:if test="cat_ru:TransportKindCode">Код типа ТС <xsl:value-of select="cat_ru:TransportKindCode"/>
                  </xsl:if>
                  <br/>
                  <xsl:if test="cat_ru:TransportMarkCode">Код марки ТС <xsl:value-of select="cat_ru:TransportMarkCode"/>
                  </xsl:if>
                  <br/>
               </td>
               <td>
                  <xsl:if test="cat_ru:TransportIdentifier">Идентификатор ТС <xsl:value-of select="cat_ru:TransportIdentifier"/>
                  </xsl:if>
                  <br/>
                  <xsl:if test="cat_ru:TransportMeansNationalityCode">
						Код страны принадлежности ТС 
						<xsl:value-of select="cat_ru:TransportMeansNationalityCode"/>
                  </xsl:if>
                  <br/>
                  <xsl:if test="cat_ru:ActiveTransportIdentifier">
						Идентификатор активного ТС  
						<xsl:value-of select="cat_ru:ActiveTransportIdentifier"/>
                  </xsl:if>
                  <br/>
                  <xsl:if test="cat_ru:TransportRegNumber">
						Номер свидетельства о регистрации ТС 
						<xsl:value-of select="cat_ru:TransportRegNumber"/>
                  </xsl:if>
                  <br/>
               </td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="ptnzdn:Consignor | ptnzdn:Consignee">
      <xsl:if test="cat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="cat_ru:OrganizationLanguage"/>
         <br/>
      </xsl:if>
      <xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName">(</xsl:if>
         <xsl:value-of select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
      </xsl:if>
      <br/>
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
      </xsl:choose>
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
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
         <span>ИНН: <xsl:value-of select="cat_ru:INN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
         <span>	КПП: <xsl:value-of select="cat_ru:KPP"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">
         <span>УНП: <xsl:value-of select="cat_ru:UNP"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
         <span>Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">
         <span>БИН: <xsl:value-of select="cat_ru:BIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
         <span>ИИН: <xsl:value-of select="cat_ru:IIN"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:for-each select="cat_ru:ITN">
         <span>	
			ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/<xsl:value-of select="cat_ru:KATOCode"/>/<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/>
            </xsl:if>
         </span>
         <br/>
      </xsl:for-each>
   </xsl:template>
   <xsl:template match="cat_ru:Address">
      <span class="header">Адрес:</span>
      <br/>
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
      </xsl:if>
      <xsl:if test="cat_ru:PostalCode">
         <br/>Почтовый индекс: <xsl:value-of select="cat_ru:PostalCode"/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="cat_ru:IdentityCard">
      <span class="header">Документ удостоверяющий личность:</span>
      <br/>
      <xsl:if test="cat_ru:IdentityCardName">
         <xsl:value-of select="cat_ru:IdentityCardName"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode">(код вида документа - <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardName or cat_ru:IdentityCardCode">
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
         <span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:IdentityCardNumber"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
         <br/>
      </xsl:if>
      <br/>
   </xsl:template>
   <xsl:template match="ptnzdn:Officer">
      <!--ФИО - отдельные поля-->
      <table border="0" style="margin-top:50px; width:100%">
         <tbody>
            <tr>
               <td align="center" style="border-right:0; border-left:0; border-top:0; width:55%">
                  <xsl:value-of select="cat_ru:PersonSurname"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="cat_ru:PersonName"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="cat_ru:PersonMiddleName"/>
               </td>
               <td style="border:0;"/>
               <td align="center" style="border-right:0; border-left:0; border-top:0" width="30%">
                  <xsl:value-of select="cat_ru:PersonPost"/>
               </td>
            </tr>
            <tr>
               <td align="center" class="low" style="border:0;">(Ф.И.О. инспектора)</td>
               <td style="border:0;"/>
               <td align="center" class="low" style="border:0;">(Должность)</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
</xsl:stylesheet>

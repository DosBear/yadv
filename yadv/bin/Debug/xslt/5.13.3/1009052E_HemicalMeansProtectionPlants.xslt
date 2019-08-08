<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:hmprpl="urn:customs.ru:Information:SQDocuments:HemicalMeansProtectionPlants:5.10.0" xmlns:sq_cat="urn:customs.ru:Information:SQDocuments:SQCommonAgregateTypesCust:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="hmprpl:HemicalMeansProtectionPlants">
      <html>
         <head>
            <title>Заключение (разрешительный документ) на ввоз средств защиты растений (пестицидов)</title>
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
               <h2>Заключение (разрешительный документ) на ввоз средств защиты растений (пестицидов)</h2>
               <table border="1">
                  <tbody>
                     <tr>
                        <td>Заключение</td>
                        <td>
                           <xsl:apply-templates select="hmprpl:Conclusion"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Заявитель</td>
                        <td>
                           <xsl:apply-templates select="hmprpl:Applicant"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Внешнеторговый контракт</td>
                        <td>
                           <xsl:apply-templates select="hmprpl:ForeignTradeContract"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Товар</td>
                        <td>
                           <xsl:apply-templates select="hmprpl:GoodsDescription"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <xsl:apply-templates select="hmprpl:PersonConclusion"/>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="hmprpl:Conclusion | hmprpl:ForeignTradeContract">
      <span>
         <xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if>
         <br/>
         <xsl:if test="cat_ru:PrDocumentDate">
			создан(о) 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>
      <br/>
      <xsl:if test="hmprpl:ConclusionDeadLine">
         <span>Действителен до </span>
         <xsl:call-template name="date_time">
            <xsl:with-param name="dateTimeIn" select="hmprpl:ConclusionDeadLine"/>
         </xsl:call-template>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="hmprpl:Applicant">
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
   <xsl:template match="hmprpl:GoodsDescription">
      <span>
		Наименование 
		<xsl:for-each select="hmprpl:GoodName">
            <xsl:value-of select="."/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         </xsl:for-each>
         <xsl:if test="hmprpl:TNVED">
			(код ТН ВЭД  <xsl:value-of select="hmprpl:TNVED"/>)
		</xsl:if>
         <br/>
      </span>
      <span>
		Страна отправления   
		<xsl:value-of select="hmprpl:DepartureCountry"/>
      </span>
      <br/>
      <span>
		Страна происхождения   
		<xsl:value-of select="hmprpl:OriginCountry"/>
      </span>
      <br/>
      <span>
		Количество 
		<xsl:apply-templates select="hmprpl:Quantity"/>
      </span>
      <br/>
      <span>
		Количество в доп. ед. измерения 
		<xsl:apply-templates select="hmprpl:AddQuantity"/>
      </span>
   </xsl:template>
   <xsl:template match="hmprpl:Quantity | hmprpl:AddQuantity">
      <xsl:value-of select="cat_ru:GoodsQuantity"/>
      <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
      <xsl:if test="cat_ru:MeasureUnitQualifierCode">
		(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
	</xsl:if>
   </xsl:template>
   <xsl:template match="hmprpl:PersonConclusion">
      <table border="0" style="margin-top:50px; width:100%">
         <tbody>
            <tr>
               <td align="center" style="border-right:0; border-left:0; border-top:0">
                  <xsl:value-of select="cat_ru:PersonName"/>
               </td>
               <td style="border:0;" width="40px"/>
               <td align="center" style="border-right:0; border-left:0; border-top:0" width="25%">
                  <xsl:value-of select="cat_ru:LNP"/>
               </td>
               <td style="border:0;" width="40px"/>
               <td align="center" style="border-right:0; border-left:0; border-top:0" width="25%">
                  <xsl:value-of select="sq_cat:PersonPost"/>
               </td>
               <td style="border:0;" width="40px"/>
               <td align="center" style="border-right:0; border-left:0; border-top:0" width="25%">
                  <xsl:value-of select="hmprpl:StampNumber"/>
               </td>
            </tr>
            <tr>
               <td align="center" style="border:0;">Ф.И.О.</td>
               <td style="border:0;"/>
               <td align="center" style="border:0;">ЛНП</td>
               <td style="border:0;"/>
               <td align="center" style="border:0;">Должность</td>
               <td style="border:0;"/>
               <td align="center" style="border:0;">Номер печати</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
</xsl:stylesheet>

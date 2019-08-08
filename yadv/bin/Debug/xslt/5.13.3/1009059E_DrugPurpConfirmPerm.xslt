<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:dgprcf="urn:customs.ru:Information:SQDocuments:DrugPurpConfirmPerm:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="dgprcf:DrugPurpConfirmPerm">
      <html>
         <head>
            <title>Подтверждение целевого назначения наркотических лекарственных средств вывозимых из РФ и предназначенных для оказания гуманитарной помощи (содействия) или помощи при ЧС в соответствии с Правилами вывоза наркотических средств и психотропных веществ, предназначенных для оказания гуманитарной помощи (содействия) или помощи при ЧС</title>
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
				
				.common {
					font: 13;
					/*font-weight: bold;*/
					font-family: Arial, serif;
				}
				
				/*.info tbody tr td {
					border: 0;
				}*/
				
			</style>
         </head>
         <body>
            <div class="page">
               <h2>Подтверждение целевого назначения наркотических лекарственных средств вывозимых из РФ и предназначенных для оказания гуманитарной помощи (содействия) или помощи при ЧС в соответствии с Правилами вывоза наркотических средств и психотропных веществ, предназначенных для оказания гуманитарной помощи (содействия) или помощи при ЧС</h2>
               <table border="1" style="table-layout:fixed;word-wrap:break-word; width:100%;">
                  <tbody>
                     <tr>
                        <td>Цель ввоза/вывоза</td>
                        <td>
                           <xsl:value-of select="dgprcf:Purpose"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Количество листов в приложении</td>
                        <td>
                           <xsl:value-of select="dgprcf:SheetsCount"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Организация-заявитель</td>
                        <td>
                           <xsl:apply-templates select="dgprcf:ApplicantOrg"/>
                        </td>
                     </tr>
                     <!--<tr>
						<td>Организация, в адрес которой планируется осуществлять ввоз/вывоз</td>
						<td><xsl:apply-templates select="dgprcf:Importer"/></td>
					</tr>-->
                     <tr>
                        <td>Разрешение</td>
                        <td>
                           <xsl:apply-templates select="dgprcf:Permission"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Описание лекарственного средства/ фарм. субстанции/ биообразца</td>
                        <td>
                           <xsl:apply-templates select="dgprcf:ItemDescription"/>
                        </td>
                     </tr>
                     <tr>
                        <td>Государственная регистрация</td>
                        <td>
                           <xsl:apply-templates select="dgprcf:ItemDescription/dgprcf:GosRegistration"/>
                        </td>
                     </tr>
                  </tbody>
               </table>
               <xsl:apply-templates select="dgprcf:Customs"/>
               <xsl:apply-templates select="dgprcf:AuthorizedPerson"/>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="dgprcf:ItemDescription">
      <xsl:if test="dgprcf:Name">
         <span>
			Наименование:  
			<xsl:for-each select="dgprcf:Name">
               <xsl:value-of select="."/>
               <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            </xsl:for-each>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="dgprcf:ExpitarionDate">
		Срок годности: 
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="dgprcf:ExpitarionDate"/>
         </xsl:call-template>
         <br/>
      </xsl:if>
      <xsl:if test="dgprcf:Cost">
		Стоимость: 
		<xsl:value-of select="dgprcf:Cost"/>
         <br/>
      </xsl:if>
      <xsl:if test="dgprcf:Producer">
         <br/>Производитель: 
		<xsl:apply-templates select="dgprcf:Producer"/>
         <br/>
      </xsl:if>
      <xsl:if test="dgprcf:Count">
		Количество: 
		<xsl:apply-templates select="dgprcf:Count"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="dgprcf:GosRegistration | dgprcf:Permission">
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
      <xsl:if test="dgprcf:IssuePeriod">
         <span>Период действия: <xsl:value-of select="dgprcf:IssuePeriod"/>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="dgprcf:ApplicantOrg | dgprcf:Importer | dgprcf:Producer">
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
   <xsl:template match="dgprcf:Customs">
      <div style="margin-top:50px;">
		Таможенный орган: 
		<span style="text-decoration:underline;">
            <xsl:choose>
               <xsl:when test="cat_ru:OfficeName">
                  <xsl:value-of select="cat_ru:OfficeName"/> 
					(код ТО - <xsl:value-of select="cat_ru:Code"/>
                  <xsl:if test="cat_ru:CustomsCountryCode">
							, код государства - <xsl:value-of select="cat_ru:CustomsCountryCode"/>
                  </xsl:if>)
				</xsl:when>
               <xsl:otherwise>
					код ТО - <xsl:value-of select="cat_ru:Code"/>
                  <xsl:if test="cat_ru:CustomsCountryCode">
						 (код государства - <xsl:value-of select="cat_ru:CustomsCountryCode"/>)
					</xsl:if>
               </xsl:otherwise>
            </xsl:choose>
         </span>
      </div>
   </xsl:template>
   <xsl:template match="dgprcf:AuthorizedPerson">
      <table border="0" style="margin-top:50px; width:100%">
         <tbody>
            <tr>
               <td align="center" style="border-right:0; border-left:0; border-top:0">
                  <xsl:value-of select="cat_ru:PersonSurname"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="cat_ru:PersonName"/>
                  <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
                  <xsl:value-of select="cat_ru:PersonMiddleName"/>
               </td>
               <td style="border:0;" width="40px"/>
               <td align="center" style="border-right:0; border-left:0; border-top:0" width="25%">
                  <xsl:value-of select="cat_ru:PersonPost"/>
               </td>
               <td style="border:0;" width="40px"/>
               <td align="center" style="border-right:0; border-left:0; border-top:0" width="25%">
                  <xsl:call-template name="russian_date">
                     <xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
                  </xsl:call-template>
               </td>
            </tr>
            <tr>
               <td align="center" style="border:0;">Ф.И.О.</td>
               <td style="border:0;"/>
               <td align="center" style="border:0;">Должность</td>
               <td style="border:0;"/>
               <td align="center" style="border:0;">Дата подписания</td>
            </tr>
         </tbody>
      </table>
   </xsl:template>
   <xsl:template match="dgprcf:Count">
      <xsl:value-of select="cat_ru:GoodsQuantity"/>
      <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
      <xsl:if test="cat_ru:MeasureUnitQualifierCode">
		(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
	</xsl:if>
   </xsl:template>
</xsl:stylesheet>

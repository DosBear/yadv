<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:invbmp="urn:customs.ru:Information:SQDocuments:MZSRInvestigation:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="invbmp:MZSRInvestigation">
      <html>
         <head>
            <title>Разрешения на ввоз/вывоз на/с территории РФ и за ее пределы биологических материалов/ конкретной партии незарегистрированных лекарственных средств для проведения экспертизы, клинических исследований, оказания медицинской помощи по жизненным показаниям конкретного пациента, оказания гуманитарной помощи (содействия)</title>
            <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
            <style type="text/css">
				body {
					background: #cccccc;
				}

				div.page {
					width: 210mm;
					/*height: 297mm;*/
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					/*padding-left: 20mm;*/
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					/*height: 210mm;*/
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					padding-left: 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}

				.title{
					font-weight: bold;
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
					/*font-family: Courier, serif;*/
					vertical-align:top;
				}
				
				td.bordered {
					border: 1px solid gray;
				}
				
				.common {
					font: 13;
					/*font-weight: bold;*/
					font-family: Arial, serif;
				}
			</style>
         </head>
         <body>
            <div class="page">
               <h2>Разрешения на ввоз/вывоз на/с территории РФ и за ее пределы биологических материалов/ конкретной партии незарегистрированных лекарственных средств для проведения экспертизы, клинических исследований, оказания медицинской помощи по жизненным показаниям конкретного пациента, оказания гуманитарной помощи (содействия)</h2>
               <table>
                  <tbody>
					 <xsl:if test="invbmp:BDRDID">
						 <tr>
							<td class="title" style="width: 30%">Идентификатор документа по БД РД</td>
							<td><xsl:value-of select="invbmp:BDRDID"/></td>
						 </tr>
					 </xsl:if>
					 <xsl:if test="invbmp:SheetsCount">
						 <tr>
							<td class="title" style="width: 30%">Количество листов в приложении</td>
							<td><xsl:value-of select="invbmp:SheetsCount"/></td>
						 </tr>
                     </xsl:if>
                      <tr>
                        <td class="title" style="width: 30%; vertical-align:middle">Цель ввоза/вывоза</td>
                        <td><xsl:value-of select="invbmp:Purpose"/></td>
                     </tr>
                    <tr>
                        <td class="title" style="width: 30%; vertical-align:middle">Организация-заявитель</td>
                        <td><xsl:apply-templates select="invbmp:ApplicantOrg"/></td>
                     </tr>
                     <xsl:if test="invbmp:Importer">
                        <tr>
                           <td class="title" style="width: 30%; vertical-align:middle">Организация, в адрес которой планируется осуществлять ввоз/вывоз</td>
                           <td><xsl:apply-templates select="invbmp:Importer"/></td>
                        </tr>
                     </xsl:if>
                     <tr>
                        <td class="title" style="width: 30%; vertical-align:middle">Разрешение</td>
                        <td><xsl:apply-templates select="invbmp:Permission"/></td>
                     </tr>
                     <tr>
                        <td class="title" style="width: 30%; vertical-align:middle">Описание лекарственного средства/ фарм. субстанции/ биообразца</td>
                        <td><xsl:apply-templates select="invbmp:ItemDescription"/></td>
                     </tr>
                     <tr>
                        <td class="title" style="width: 30%">Должностное лицо, подписавшее разрешение</td>
                        <td><xsl:apply-templates select="invbmp:AuthorizedPerson"/></td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="invbmp:ItemDescription">
      <xsl:if test="invbmp:Name">
         <span>
			Наименование:  
			<xsl:for-each select="invbmp:Name">
               <xsl:value-of select="."/>
            </xsl:for-each>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="invbmp:InternationalName">
		Международное непатентованное наименование: 
		<xsl:value-of select="invbmp:InternationalName"/>
         <br/>
      </xsl:if>
      <xsl:if test="invbmp:GosRegistration">
		Государственная регистрация: 
		<xsl:apply-templates select="invbmp:GosRegistration"/>
         <br/>
      </xsl:if>
      <xsl:if test="invbmp:Info">
		Дополнительная информация: 
		<xsl:value-of select="invbmp:Info"/>
         <br/>
      </xsl:if>
      <xsl:if test="invbmp:ExpitarionDate">
		Срок годности: 
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="invbmp:ExpitarionDate"/>
		</xsl:call-template>
		<br/>
      </xsl:if>
      <xsl:if test="invbmp:Cost">
		Стоимость: 
		<xsl:value-of select="invbmp:Cost"/>
         <br/>
      </xsl:if>
      <xsl:if test="invbmp:Count">
		Количество: 
		<xsl:apply-templates select="invbmp:Count"/>
		<br/>
      </xsl:if>
      <xsl:if test="invbmp:Producer">
		<span class="header">Информация о производителе: </span>
		<br/>
		<xsl:apply-templates select="invbmp:Producer"/>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="invbmp:GosRegistration">
      <span>
         <xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if>
         <xsl:if test="cat_ru:PrDocumentDate"> от 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>
   </xsl:template>
   <xsl:template match="invbmp:Permission">
      <span class="header">
         <xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:value-of select="cat_ru:PrDocumentNumber"/>
         </xsl:if>
         <xsl:if test="cat_ru:PrDocumentDate"> от 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>
      <br/>
      <xsl:if test="invbmp:IssuePeriod">
         <span>Период действия: <xsl:value-of select="invbmp:IssuePeriod"/>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="invbmp:Status">
         <span>Статус: 
			<xsl:choose>
               <xsl:when test="invbmp:Status = '1'">Действующее</xsl:when>
               <xsl:when test="invbmp:Status = '2'">Приостановленное</xsl:when>
               <xsl:when test="invbmp:Status = '3'">Анулированное</xsl:when>
               <xsl:when test="invbmp:Status = '4'">Находится на переоформлении</xsl:when>
               <xsl:otherwise><xsl:value-of select="invbmp:Status"/></xsl:otherwise>
            </xsl:choose>
         </span>
         <br/>
      </xsl:if>
      <xsl:if test="invbmp:EndDate">
         <span>
			Дата аннулирования: 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="invbmp:EndDate"/>
            </xsl:call-template>
         </span>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="invbmp:ApplicantOrg | invbmp:Importer | invbmp:Producer">
      <xsl:if test="cat_ru:OrganizationLanguage">
			Язык заполнения: 
			<xsl:value-of select="cat_ru:OrganizationLanguage"/>
			<br/>
      </xsl:if>
      <b><xsl:value-of select="cat_ru:OrganizationName"/>
      <xsl:if test="cat_ru:ShortName">
         <xsl:if test="cat_ru:OrganizationName">(</xsl:if>
         <xsl:value-of select="cat_ru:ShortName"/>
         <xsl:if test="cat_ru:OrganizationName">)</xsl:if>
      </xsl:if>
      </b><br/>
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
         <xsl:when test="cat_ru:KGOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
         </xsl:when>
         <xsl:when test="cat_ru:RAOrganizationFeatures">
            <xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
         </xsl:when>
      </xsl:choose>
      <xsl:if test="cat_ru:Address">
         <xsl:apply-templates select="cat_ru:Address"/>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCard">
         <xsl:apply-templates select="cat_ru:IdentityCard"/>
      </xsl:if>
      <xsl:if test="cat_ru:Contact">
         <xsl:apply-templates select="cat_ru:Contact"/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">ОГРН: <xsl:value-of select="cat_ru:OGRN"/> </xsl:if>
		<xsl:if test="cat_ru:INN"> ИНН: <xsl:value-of select="cat_ru:INN"/> </xsl:if>
		<xsl:if test="cat_ru:KPP"> КПП: <xsl:value-of select="cat_ru:KPP"/></xsl:if>
		<br/>
   </xsl:template>
   <xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">УНП: <xsl:value-of select="cat_ru:UNP"/> </xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber"> Идентификационный номер: 
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
		<br/>
  </xsl:template>
   <xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">БИН: <xsl:value-of select="cat_ru:BIN"/> </xsl:if>
		<xsl:if test="cat_ru:IIN"> ИИН: <xsl:value-of select="cat_ru:IIN"/> </xsl:if>
		<xsl:for-each select="cat_ru:ITN">
			 ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/
			<xsl:value-of select="cat_ru:KATOCode"/>/
			<xsl:value-of select="cat_ru:RNN"/>
			<xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/></xsl:if>
		</xsl:for-each>
		<br/>
   </xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">ИНН/ПИН: <xsl:value-of select="cat_ru:KGINN"/> </xsl:if>
		<xsl:if test="cat_ru:KGOKPO"> ОКПО: <xsl:value-of select="cat_ru:KGOKPO"/></xsl:if>
		<br/>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">УНН: <xsl:value-of select="cat_ru:UNN"/> </xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber"> НЗОУ: <xsl:value-of select="cat_ru:SocialServiceNumber"/> </xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate"> Номер справки об НЗОУ: 
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
		<br/>
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
      <xsl:if test="cat_ru:IdentityCardName"><xsl:value-of select="cat_ru:IdentityCardName"/></xsl:if>
      <xsl:if test="cat_ru:IdentityCardCode">(код вида документа - <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
      <xsl:if test="cat_ru:IdentityCardSeries or cat_ru:IdentityCardNumber">
		  <br/>
         <span>
			Серия номер:
			<xsl:value-of select="cat_ru:IdentityCardSeries"/>
            <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
            <xsl:value-of select="cat_ru:IdentityCardNumber"/>
         </span>
      </xsl:if>
      <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">
		<br/> Выдан
		<xsl:call-template name="russian_date">
            <xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
         </xsl:call-template>
         <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
         <xsl:value-of select="cat_ru:OrganizationName"/>
      </xsl:if>
      <br/>
   </xsl:template>
	<!-- Шаблон для типа cat_ru:ContactType -->
	<xsl:template match="cat_ru:Contact">
		<span class="header">Контактная информация:</span>
		<br/>
		<xsl:if test="cat_ru:Phone">
			тел.: 
			<xsl:for-each select="cat_ru:Phone">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="cat_ru:Fax"> факс: <xsl:value-of select="cat_ru:Fax"/></xsl:if>
		<xsl:if test="cat_ru:Telex"> телекс: <xsl:value-of select="cat_ru:Telex"/></xsl:if>
		<xsl:if test="cat_ru:E_mail"> e-mail: 
			<xsl:for-each select="cat_ru:E_mail">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
   <xsl:template match="invbmp:Count">
      <xsl:value-of select="cat_ru:GoodsQuantity"/>
      <xsl:if test="cat_ru:MeasureUnitQualifierName"> <xsl:value-of select="cat_ru:MeasureUnitQualifierName"/></xsl:if>
      <xsl:if test="cat_ru:MeasureUnitQualifierCode">	(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)</xsl:if>
   </xsl:template>
   <xsl:template match="invbmp:AuthorizedPerson">
		<xsl:value-of select="cat_ru:PersonSurname"/> 
		<xsl:value-of select="cat_ru:PersonName"/> 
		<xsl:if test="cat_ru:PersonMiddleName">
			 <xsl:value-of select="cat_ru:PersonMiddleName"/> 
		</xsl:if>
		  <xsl:if test="cat_ru:PersonPost">
			(<xsl:value-of select="cat_ru:PersonPost"/>) 
		</xsl:if>
		  <xsl:if test="cat_ru:IssueDate">
			 <br/>
			Дата подписания:
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IssueDate"/>
			 </xsl:call-template>
		  </xsl:if>
   </xsl:template>
</xsl:stylesheet>

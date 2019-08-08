<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:rzdmed="urn:customs.ru:Information:SQDocuments:RZNMedizd:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
   <xsl:template match="rzdmed:RZNMedizd">
      <html>
         <head>
            <title>Регистрационное удостоверение</title>
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
				
				.title {
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
					/*border: 1px solid gray;
					font-family: Courier, serif;*/
					vertical-align:top;
				}
				
				.low {
					font: 12;
					font-family: Arial, serif;
				}
			</style>
         </head>
         <body>
            <div class="page">
               <h2>
				   <xsl:choose>
						<xsl:when test="rzdmed:Registration/cat_ru:PrDocumentName">
							<xsl:value-of select="rzdmed:Registration/cat_ru:PrDocumentName"/>
						</xsl:when>
						<xsl:otherwise>РЕГИСТРАЦИОННОЕ УДОСТОВЕРЕНИЕ<br/>НА МЕДИЦИНСКОЕ ИЗДЕЛИЕ</xsl:otherwise>
					</xsl:choose>
					<br/>
					<xsl:if test="rzdmed:Registration/cat_ru:PrDocumentNumber">
						№ <xsl:value-of select="rzdmed:Registration/cat_ru:PrDocumentNumber"/>
					</xsl:if>
               </h2>
				<xsl:if test="rzdmed:Registration/cat_ru:PrDocumentDate">
					<br/><b>
					<xsl:call-template name="russian_date">
						<xsl:with-param name="dateIn" select="rzdmed:Registration/cat_ru:PrDocumentDate"/>
					</xsl:call-template>
					</b>
				</xsl:if>
				<xsl:if test="rzdmed:Registration/rzdmed:ExpirationDate">
					<br/>Действителен до 
					<xsl:call-template name="date_time">
						<xsl:with-param name="dateTimeIn" select="rzdmed:Registration/rzdmed:ExpirationDate"/>
					</xsl:call-template>
				</xsl:if>
				<br/><br/>Настоящее регистрационное удостоверение выдано<br/>
				<xsl:apply-templates select="rzdmed:ApplicantOrg"/>
				<br/>
				<span>и подтверждает, что медицинское изделие</span><br/>
				<xsl:apply-templates select="rzdmed:GoodsDescription"/>
				<br/>
				<span>соответствующее регистрационному досье № 40354 от 16.11.2012</span>
				<br/><br/><br/><br/>
				<span>В соответствии с приказом Росздравнадзора от 05 июня 2013 года № 2246-Пр/13 допущено к обращению на территории Российской Федерации.</span>
				<br/><br/><br/><br/>
				<xsl:if test="rzdmed:Application">Cм. приложение.</xsl:if>
            </div>
            <div class="page">
				<h2>ПРИЛОЖЕНИЕ</h2>
                <table>
					<tr>
						<td style="width: 30%">Идентификатор документа по БД РД</td>
						<td style="border-bottom: 1px solid gray"><xsl:value-of select="rzdmed:BDRDID"/></td>
					</tr>
				</table>
				<br/>
				<xsl:for-each select="rzdmed:Application"><xsl:value-of select="."/></xsl:for-each>
            </div>
         </body>
      </html>
   </xsl:template>
   <xsl:template match="rzdmed:Registration">
      <span>
         <xsl:value-of select="cat_ru:PrDocumentName"/>
         <xsl:if test="cat_ru:PrDocumentNumber"> № <xsl:value-of select="cat_ru:PrDocumentNumber"/></xsl:if>
         <xsl:if test="cat_ru:PrDocumentDate"> от 
			<xsl:call-template name="russian_date">
               <xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
            </xsl:call-template>
         </xsl:if>
      </span>
      <br/>
      <xsl:if test="rzdmed:ExpirationDate">
         <span>Действителен до </span>
         <xsl:call-template name="date_time">
            <xsl:with-param name="dateTimeIn" select="rzdmed:ExpirationDate"/>
         </xsl:call-template>
         <br/>
      </xsl:if>
   </xsl:template>
   <xsl:template match="rzdmed:ApplicantOrg | rzdmed:Producer">
      <!--xsl:if test="rzdmed:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="rzdmed:OrganizationLanguage"/>
         <br/>
      </xsl:if-->
      <span class="title">
		  <xsl:for-each select="rzdmed:OrganizationName"><xsl:value-of select="."/></xsl:for-each>
		  <xsl:if test="rzdmed:ShortName">
			 <xsl:if test="rzdmed:OrganizationName">(</xsl:if>
			 <xsl:value-of select="rzdmed:ShortName"/>
			 <xsl:if test="rzdmed:OrganizationName">)</xsl:if>
		  </xsl:if>
		  <xsl:choose>
			 <xsl:when test="rzdmed:RFOrganizationFeatures">, 
				<xsl:apply-templates select="rzdmed:RFOrganizationFeatures"/>
			 </xsl:when>
			 <xsl:when test="rzdmed:RKOrganizationFeatures">, 
				<xsl:apply-templates select="rzdmed:RKOrganizationFeatures"/>
			 </xsl:when>
			 <xsl:when test="rzdmed:RBOrganizationFeatures">, 
				<xsl:apply-templates select="rzdmed:RBOrganizationFeatures"/>
			 </xsl:when>
			 <xsl:when test="rzdmed:KGOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
			 </xsl:when>
			 <xsl:when test="rzdmed:RAOrganizationFeatures">
				<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
			 </xsl:when>
		  </xsl:choose>
      </span>
      <xsl:if test="rzdmed:Address">
         <br/><xsl:apply-templates select="rzdmed:Address"/>
      </xsl:if>
      <xsl:if test="rzdmed:IdentityCard">
         <br/><xsl:apply-templates select="rzdmed:IdentityCard"/>
      </xsl:if>
      <!--xsl:if test="rzdmed:Id">
         <span>
			Внутренний идентификатор организации 
			<xsl:value-of select="rzdmed:Id"/>
         </span>
      </xsl:if-->
      <br/>
   </xsl:template>
   <xsl:template match="rzdmed:RFOrganizationFeatures">
      <xsl:if test="cat_ru:OGRN">ОГРН: <xsl:value-of select="cat_ru:OGRN"/></xsl:if>
      <xsl:if test="cat_ru:INN"> ИНН: <xsl:value-of select="cat_ru:INN"/></xsl:if>
      <xsl:if test="cat_ru:KPP"> КПП: <xsl:value-of select="cat_ru:KPP"/></xsl:if>
   </xsl:template>
   <xsl:template match="rzdmed:RBOrganizationFeatures">
      <xsl:if test="cat_ru:UNP">УНП: <xsl:value-of select="cat_ru:UNP"/></xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber"> Идентификационный номер: <xsl:value-of select="cat_ru:RBIdentificationNumber"/></xsl:if>
   </xsl:template>
   <xsl:template match="rzdmed:RKOrganizationFeatures">
      <xsl:if test="cat_ru:BIN">БИН: <xsl:value-of select="cat_ru:BIN"/></xsl:if>
      <xsl:if test="cat_ru:IIN"> ИИН: <xsl:value-of select="cat_ru:IIN"/></xsl:if>
      <xsl:for-each select="cat_ru:ITN">
			 ИТН: 
			<xsl:value-of select="cat_ru:CategoryCode"/>/
			<xsl:value-of select="cat_ru:KATOCode"/>/
			<xsl:value-of select="cat_ru:RNN"/>
            <xsl:if test="cat_ru:ITNReserv">/<xsl:value-of select="cat_ru:ITNReserv"/></xsl:if>
      </xsl:for-each>
   </xsl:template>
	<xsl:template match="rzdmed:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">ИНН/ПИН: <xsl:value-of select="cat_ru:KGINN"/> </xsl:if>
		<xsl:if test="cat_ru:KGOKPO"> ОКПО: <xsl:value-of select="cat_ru:KGOKPO"/></xsl:if>
	</xsl:template>
	<xsl:template match="rzdmed:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">УНН: <xsl:value-of select="cat_ru:UNN"/> </xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber"> НЗОУ: <xsl:value-of select="cat_ru:SocialServiceNumber"/> </xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate"> Номер справки об НЗОУ: 
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
   <xsl:template match="rzdmed:Address">
	   <span class="title">
		  <xsl:if test="rzdmed:CounryName">
			 <xsl:value-of select="rzdmed:CounryName"/>
		  </xsl:if>
		  <xsl:if test="rzdmed:CountryCode"> (<xsl:value-of select="rzdmed:CountryCode"/>)</xsl:if>
		  <xsl:if test="rzdmed:PostalCode">
				<xsl:if test="rzdmed:CountryCode or rzdmed:CounryName">, </xsl:if>
			  <xsl:value-of select="rzdmed:PostalCode"/>
		  </xsl:if>
		  <xsl:if test="rzdmed:Region">
			 <xsl:if test="rzdmed:CountryCode or rzdmed:CounryName or rzdmed:PostalCode">, </xsl:if>
			 <xsl:value-of select="rzdmed:Region"/>
		  </xsl:if>
		  <xsl:if test="rzdmed:City">
			 <xsl:if test="rzdmed:CountryCode or rzdmed:CounryName or rzdmed:Region or rzdmed:PostalCode">, </xsl:if>
			 <xsl:value-of select="rzdmed:City"/>
		  </xsl:if>
		  <xsl:if test="rzdmed:StreetHouse">
			 <xsl:if test="rzdmed:CountryCode or rzdmed:CounryName or rzdmed:Region or rzdmed:City">, </xsl:if>
			 <xsl:value-of select="rzdmed:StreetHouse"/>
		  </xsl:if>
      </span>
   </xsl:template>
   <xsl:template match="rzdmed:IdentityCard">
	   <span class="title">
		  <xsl:if test="cat_ru:IdentityCardName"><xsl:value-of select="cat_ru:IdentityCardName"/></xsl:if>
		  <xsl:if test="cat_ru:IdentityCardCode"> (код <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
		  <xsl:if test="cat_ru:IdentityCardSeries"> <xsl:value-of select="cat_ru:IdentityCardSeries"/></xsl:if>
		  <xsl:if test="cat_ru:IdentityCardNumber"> № <xsl:value-of select="cat_ru:IdentityCardNumber"/></xsl:if>
		  <xsl:if test="cat_ru:IdentityCardDate or cat_ru:OrganizationName">, выдан 
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
			 </xsl:call-template>
			 <xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
			 <xsl:value-of select="cat_ru:OrganizationName"/>
		  </xsl:if>
      </span>
   </xsl:template>
   <xsl:template match="rzdmed:GoodsDescription">
	   <span class="title"><xsl:for-each select="rzdmed:GoodsName"><xsl:value-of select="."/></xsl:for-each></span><br/>
	   <br/>
		<span>производства</span><br/>
        <xsl:for-each select="rzdmed:Producer">
			<xsl:apply-templates select="."/><br/>
        </xsl:for-each>
		<span>место производства</span><br/>
		<xsl:for-each select="rzdmed:Producer/rzdmed:Address"><xsl:apply-templates select="."/><br/></xsl:for-each>
		<br/>
		<table>
			<tr>
				<td>класс потенциального риска <b><xsl:apply-templates select="rzdmed:Class"/></b></td>
				<td align="right">ОКП <b><xsl:apply-templates select="rzdmed:OKP"/></b></td>
			</tr>
		</table>
      <br/>
      <span>вид медицинского изделия </span><b><xsl:apply-templates select="rzdmed:Category"/></b><br/>
   </xsl:template>
   <xsl:template match="rzdmed:OKP | rzdmed:Category">
      <xsl:if test="rzdmed:Code"><xsl:value-of select="rzdmed:Code"/></xsl:if>
      <xsl:if test="rzdmed:Description"> (<xsl:for-each select="rzdmed:Description"><xsl:value-of select="."/></xsl:for-each>)</xsl:if>
   </xsl:template>
   <xsl:template match="rzdmed:Class">
      <xsl:if test="rzdmed:ClassId"><xsl:value-of select="rzdmed:ClassId"/></xsl:if>
      <xsl:if test="rzdmed:Name"> (<xsl:value-of select="rzdmed:Name"/>)</xsl:if>
   </xsl:template>
</xsl:stylesheet>

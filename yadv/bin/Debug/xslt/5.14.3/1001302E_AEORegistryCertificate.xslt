<?xml version="1.0" encoding="utf-8"?>
<!-- Решение Коллегии Евразийской экономической комиссии № 129 от 26 сентября 2017 года "О форме свидетельства о включении в реестр уполномоченных экономических операторов и порядке ее заполнения"
(с учётом полей из: 
Решение Коллегии Евразийской экономической комиссии № 186 от 19 декабря 2017 года "О форме реестра уполномоченных экономических операторов государства - члена Евразийского экономического союза"
Решение Коллегии Евразийской экономической комиссии № 187 от 19 декабря 2017 года "Об общем реестре уполномоченных экономических операторов государств - членов Евразийского экономического союза")
 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.14.3" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:aeorc="urn:customs.ru:Information:RegistrationDocuments:AEORegistryCertificate:5.14.3" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа AEORegistryCertificateType -->
	<xsl:template match="aeorc:AEORegistryCertificate">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					}

					div.page {
					width: 210mm;
					max-width: 210mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;
					}

					.marg-top
					{
					margin-top:5mm;
					}

					table
					{
					width: 100%;
					max-width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					}

					.inlinetable
					{
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;
					}

					table.border tr td
					{
					border: 1px solid gray;
					}

					.graph {
					font-family: Arial;
					font-size: 10pt;
					}

					.value
					{
					border-bottom: solid 1px black;
					}

					div.title, tr.title td { font-weight:bold;  }
					.bordered { border-collapse: collapse; }
					td.bordered
					{
					border: solid 1px windowtext;
					}

					td.graphMain
					{
					vertical-align:top;
					}
					td.value.graphMain
					{
					vertical-align:bottom;
					}
					.descr{
						font-size: 8pt;
						text-align: center;
						vertical-align: top;
					}
					.indent{
						text-indent: 1.5em;
					}
				</style>
			</head>
			<body>
				<div class="page">
					<table>
						<tbody>
							<tr>
								<td align="center">
									<xsl:variable name="img_gto">
										<xsl:value-of select="'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'"/>
									</xsl:variable>
									<img>
										<xsl:attribute name="src"><xsl:value-of select="concat('data:image/jpeg;base64,',$img_gto)"/></xsl:attribute>
									</img>
								</td>
							</tr>
							<tr>
								<td align="center">
									<br/>
									ЕВРАЗИЙСКИЙ ЭКОНОМИЧЕСКИЙ СОЮЗ
								</td>
							</tr>
							<tr>
								<td align="center">
									<br/>
									СВИДЕТЕЛЬСТВО<br/>о включении в реестр уполномоченных экономических операторов<br/>N <span class="value"><xsl:apply-templates select="aeorc:AEOCertificateRegNumber"/></span>
								</td>
							</tr>
							<tr>
								<td>
									<br/><br/>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:choose>
												<xsl:when test="aeorc:AEOCertificateRegNumber/aeorc:CountryCode='AM'">Комитет государственных доходов при Правительстве Республики Армения</xsl:when>
												<xsl:when test="aeorc:AEOCertificateRegNumber/aeorc:CountryCode='BY'">Государственный таможенный комитет Республики Беларусь</xsl:when>
												<xsl:when test="aeorc:AEOCertificateRegNumber/aeorc:CountryCode='KZ'">Комитет государственных доходов Министерства финансов Республики Казахстан</xsl:when>
												<xsl:when test="aeorc:AEOCertificateRegNumber/aeorc:CountryCode='KG'">Государственная таможенная служба при Правительстве Кыргызской Республики</xsl:when>
												<xsl:when test="aeorc:AEOCertificateRegNumber/aeorc:CountryCode='RU'">Федеральная таможенная служба</xsl:when>
											</xsl:choose>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'center'"/>
										<xsl:with-param name="description" select="'(наименование уполномоченного органа государства - члена Евразийского экономического союза)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:text>настоящим подтверждает, что</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="aeorc:AEOOrganization/aeorc:AEOParentDetails/RUScat_ru:BusinessEntityTypeName"/>
											<xsl:text> </xsl:text>
											<xsl:value-of select="aeorc:AEOOrganization/aeorc:AEOParentDetails/cat_ru:OrganizationName"/>
											<xsl:if test="not(aeorc:AEOOrganization/aeorc:AEOParentDetails/cat_ru:OrganizationName) and aeorc:AEOOrganization/aeorc:AEOParentDetails/cat_ru:ShortName">
												<xsl:value-of select="aeorc:AEOOrganization/aeorc:AEOParentDetails/cat_ru:ShortName"/>
											</xsl:if>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="description" select="'(организационно-правовая форма, наименование юридического лица)'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<xsl:text>включено в реестр уполномоченных экономических операторов.</xsl:text>
									<br/><br/>
									<xsl:text>Место нахождения юридического лица:</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:apply-templates mode="address" select="aeorc:AEOOrganization/aeorc:AEOParentDetails/RUScat_ru:AddressDetails"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<br/><br/>
									<xsl:text>Сведения  о постановке на учет в налоговых органах (органах государственных доходов) государства - члена Евразийского экономического союза:</xsl:text>
									<xsl:call-template name="inlinetable">
										<xsl:with-param name="data">
											<xsl:value-of select="aeorc:AEOOrganization/aeorc:AEOParentDetails/cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
											<xsl:value-of select="aeorc:AEOOrganization/aeorc:AEOParentDetails/cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
											<xsl:value-of select="aeorc:AEOOrganization/aeorc:AEOParentDetails/cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
											<xsl:value-of select="aeorc:AEOOrganization/aeorc:AEOParentDetails/cat_ru:RAOrganizationFeatures/cat_ru:UNN"/>
											<xsl:value-of select="aeorc:AEOOrganization/aeorc:AEOParentDetails/cat_ru:KGOrganizationFeatures/cat_ru:KGINN"/>
										</xsl:with-param>
										<xsl:with-param name="data_align" select="'left'"/>
										<xsl:with-param name="width" select="'100%'"/>
									</xsl:call-template>
									<br/><br/>
									<xsl:text>Настоящее свидетельство вступает в силу с </xsl:text>
									<xsl:choose>
										<xsl:when test="aeorc:AEOCertificateDateBegin">
											<span class="value">
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:call-template name="russian_date">
													<xsl:with-param name="dateIn" select="aeorc:AEOCertificateDateBegin"/>
												</xsl:call-template>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
											</span>
										</xsl:when>
										<xsl:otherwise>
											<span class="value">
												&#160;&#160;&#160;&#160;&#160;&#8212;&#160;&#160;&#160;&#160;&#160;
											</span>
										</xsl:otherwise>
									</xsl:choose>
									<br/><br/>
									<xsl:text>Особые отметки: </xsl:text>
									<span class="value">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
										<xsl:choose>
											<xsl:when test="aeorc:DecisionInfo">
												<xsl:apply-templates select="aeorc:DecisionInfo"/>
											</xsl:when>
											<xsl:otherwise>
												&#160;&#160;&#160;&#160;&#160;&#8212;&#160;&#160;&#160;&#160;&#160;
											</xsl:otherwise>
										</xsl:choose>
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</span>
								</td>
							</tr>
							<tr>
								<td>
									<br/>
									<table>
										<tbody>
											<tr>
												<td width="45%" class="value" align="center">
													<xsl:value-of select="aeorc:SigningDetails/cat_ru:PersonPost"/>
												</td>
												<td></td>
												<td width="45%" class="value" align="right">
													<xsl:for-each select="aeorc:SigningDetails/cat_ru:PersonSurname|aeorc:SigningDetails/cat_ru:PersonName|aeorc:SigningDetails/cat_ru:PersonMiddleName">
														<xsl:value-of select="."/>
														<xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
													</xsl:for-each>
												</td>
											</tr>
											<tr>
												<td class="descr">(должность руководителя уполномоченного органа государства - члена Евразийского экономического союза)</td>
												<td></td>
												<td class="descr">(подпись, инициалы и фамилия руководителя уполномоченного органа государства - члена Евразийского экономического союза)</td>
											</tr>
											<tr valign="bottom">
												<td align="center">
													<br/>
													М.П.
												</td>
												<td></td>
												<td>
													<xsl:call-template name="DateStr">
														<xsl:with-param name="date" select="aeorc:SigningDetails/RUScat_ru:SigningDate"/>
													</xsl:call-template>
												</td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="aeorc:DecisionInfo">
		<xsl:value-of select="cat_ru:PrDocumentName"/>
		<xsl:if test="cat_ru:PrDocumentNumber">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:for-each select="RUScat_ru:CounryName|RUScat_ru:Region|RUScat_ru:District|RUScat_ru:Town|RUScat_ru:City|RUScat_ru:StreetHouse|RUScat_ru:House|RUScat_ru:Room|RUScat_ru:AddressText">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="aeorc:AEOCertificateRegNumber">
		<xsl:value-of select="aeorc:CountryCode"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="aeorc:SerialNumber"/>
		<xsl:text>/</xsl:text>
		<xsl:text>ТИП</xsl:text>
		<xsl:value-of select="aeorc:CertificateKind"/>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="comma" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value" width="{$width_td1}">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
					<xsl:if test="$comma != 0">
						<td width="1%" valign="bottom">,</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$description"/>
					</td>
					<xsl:if test="$comma != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:variable name="month" select="substring($date, 6, 2)"/>
		&#171;<u>&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</u>&#187;
		&#160;&#160;<u>&#160;
		<xsl:choose>
			<xsl:when test="$month=1">января</xsl:when>
			<xsl:when test="$month=2">февраля</xsl:when>
			<xsl:when test="$month=3">марта</xsl:when>
			<xsl:when test="$month=4">апреля</xsl:when>
			<xsl:when test="$month=5">мая</xsl:when>
			<xsl:when test="$month=6">июня</xsl:when>
			<xsl:when test="$month=7">июля</xsl:when>
			<xsl:when test="$month=8">августа</xsl:when>
			<xsl:when test="$month=9">сентября</xsl:when>
			<xsl:when test="$month=10">октября</xsl:when>
			<xsl:when test="$month=11">ноября</xsl:when>
			<xsl:when test="$month=12">декабря</xsl:when>
		</xsl:choose> 					
		</u>&#160;&#160;<xsl:value-of select="substring($date,1,2)"/><u><xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;г.&#160;
	</xsl:template>
</xsl:stylesheet>

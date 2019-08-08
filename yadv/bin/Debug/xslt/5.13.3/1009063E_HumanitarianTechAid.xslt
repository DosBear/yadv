<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.10.0" xmlns:hta="urn:customs.ru:Information:SQDocuments:HumanitarianTechAid:5.13.3" xmlns:sq_cat="urn:customs.ru:Information:SQDocuments:SQCommonAgregateTypesCust:5.10.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.13.3">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="hta:HumanitarianTechAid">
		<html>
			<head>
				<title>Удостоверение о признании средств, товаров, работ и услуг гуманитарной помощью/технической помощью (содействием)</title>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<style type="text/css">
				body {
					background: #cccccc;
				}

				div.page {
					width: 210mm;
					max-width: 210mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 8mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}
				
				div.album_page {
					width: 297mm;
					margin: auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm;
					background: #ffffff;
					border: solid 1pt #000000;
				}

				h2 {
					text-align:center;
					font: 20 ;
					font-family: Arial, serif;
				}

				.title{
					font-weight: bold;
					vertical-align: middle;
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

				td.bordered {
					border: 1px solid gray;
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
									<b>
										<xsl:choose>
											<xsl:when test="hta:ConfirmationInfo/cat_ru:PrDocumentName">
												<xsl:value-of select="hta:ConfirmationInfo/cat_ru:PrDocumentName"/>
											</xsl:when>
											<xsl:otherwise> 
												<xsl:if test="hta:DocSign='0'">ЗАКЛЮЧЕНИЕ </xsl:if>
												<xsl:if test="hta:DocSign='1'">УДОСТОВЕРЕНИЕ </xsl:if>								
											</xsl:otherwise>
										</xsl:choose>
										<xsl:if test="hta:ConfirmationInfo/cat_ru:PrDocumentNumber">
											№<xsl:value-of select="hta:ConfirmationInfo/cat_ru:PrDocumentNumber"/>
										</xsl:if>
										<xsl:if test="hta:ConfirmationInfo/cat_ru:PrDocumentDate"> от 
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="hta:ConfirmationInfo/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
										<br/>о признании средств, товаров, работ и услуг
										<xsl:if test="hta:DocSign='0'"> гуманитарной помощью</xsl:if>
										<xsl:if test="hta:DocSign='1'"> технической помощью (содействием)</xsl:if>
										<br/>(утверждено протоколом заседания Комиссии по вопросам международной гуманитарной и технической помощи при Правительстве Российской Федерации от 28.11.2011 № 4 (44),<br/>внесены изменения протоколом заседания Комиссии по вопросам международной гуманитарной и технической помощи при Правительстве Российской Федерации от 27.10.2016 № 3 (60))<br/>
									</b>
									<xsl:if test="hta:ConfirmationInfo/hta:DateTo">
										<br/>(Срок действия заключения 
										<xsl:call-template name="russian_date">
											<xsl:with-param name="dateIn" select="hta:ConfirmationInfo/hta:DateTo"/>
										</xsl:call-template>
										)
									</xsl:if>
								</font>
							</td>
						</tr>
					</table>
					<br/>
					<xsl:variable name="k_rec" select="count(hta:Recipient)"/>
					<xsl:variable name="k_sup" select="count(hta:Supplier)"/>
					<xsl:if test="hta:OutRegNum">
						<span class="title">Исходящий регистрационный № <xsl:value-of select="hta:OutRegNum"/><br/></span>
					</xsl:if>
					<xsl:for-each select="hta:SessionFirst">
						<span class="title">Протокол №&#32; 
							<xsl:choose>
								<xsl:when test="hta:ComNum"><xsl:value-of select="hta:ComNum"/></xsl:when>
								<xsl:otherwise>б/н</xsl:otherwise>
							</xsl:choose>
							&#32;первого заседания комиссии&#32; 
							<xsl:if test="hta:SessionDate">
								от&#32; 
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="hta:SessionDate"/>
								</xsl:call-template>
							</xsl:if>
							<br/>
						</span>
					</xsl:for-each>
					<xsl:for-each select="hta:SessionLast">
						<span class="title">Протокол №&#32; 
							<xsl:choose>
								<xsl:when test="hta:ComNum"><xsl:value-of select="hta:ComNum"/></xsl:when>
								<xsl:otherwise>б/н</xsl:otherwise>
							</xsl:choose>
							&#32;последнего заседания комиссии&#32; 
							<xsl:if test="hta:SessionDate">
								от&#32; 
								<xsl:call-template name="russian_date">
									<xsl:with-param name="dateIn" select="hta:SessionDate"/>
								</xsl:call-template>
							</xsl:if>
							<br/>
						</span>
					</xsl:for-each>
					<xsl:if test="hta:BusNum">
						<span class="title">Номер дела: <xsl:value-of select="hta:BusNum"/></span>
					</xsl:if>
					<br/>
					<table>	
						<tr>
							<td class="title" rowspan="{$k_rec}" style="width: 25%">Получатель(и):</td>
							<td class="bordered"><xsl:apply-templates select="hta:Recipient[1]"/></td>
						</tr>	
						<xsl:for-each select="hta:Recipient[position() &gt; 1]">
							<tr>
								<td class="bordered"><xsl:apply-templates select="."/></td>
							</tr>	
						</xsl:for-each>
						<tr><td colspan="2"><br/></td></tr>
						<xsl:if test="hta:Supplier">
							<tr>
								<td class="title" rowspan="{$k_sup}">Поставщик(и):</td>
								<td class="bordered"><xsl:apply-templates select="hta:Supplier[1]"/></td>
							</tr>	
							<xsl:for-each select="hta:Supplier[position() &gt; 1]">
								<tr>
									<td class="bordered"><xsl:apply-templates select="."/></td>
								</tr>	
							</xsl:for-each>
							<tr><td colspan="2"><br/></td></tr>
						</xsl:if>
						<xsl:if test="(hta:ProviderAsDonor='true' or hta:ProviderAsDonor='1') and not(hta:Supplier)">
							<tr>
								<td class="title" rowspan="{$k_sup}">Поставщик:</td>
								<td class="bordered">Поставщиком является донор</td>
							</tr>	
							<tr><td colspan="2"><br/></td></tr>
						</xsl:if>
						<tr>
							<td class="title">Донор:</td>
							<td class="bordered">
								<xsl:value-of select="hta:Donor"/>
								<xsl:if test="hta:DonorOrganization">
									<br/>Международная организация: 
									<xsl:value-of select="hta:DonorOrganization"/>
								</xsl:if>
								<xsl:if test="hta:DonorContract">
									<br/>Соглашение/ договор/ контракт с донором:<br/>
									<xsl:for-each select="hta:DonorContract">
										 - <xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()"><br/></xsl:if> 
									</xsl:for-each>
								</xsl:if>
							</td>
						</tr>
						<tr><td colspan="2"><br/></td></tr>
						<xsl:if test="hta:CountryName">
							<tr>
								<td class="title">Страна:</td>
								<td class="bordered"><xsl:value-of select="hta:CountryName"/></td>
							</tr>	
							<tr><td colspan="2"><br/></td></tr>
						</xsl:if>
						<xsl:if test="hta:AidProjectReestrNum or hta:AidProjectReestrInfo">
							<tr>
								<td class="title">
									Регистрационный №<br/>и наименование проекта/программы:
								</td>
								<td class="bordered">
									<xsl:if test="hta:AidProjectReestrNum">
										Регистрационный номер:<xsl:value-of select="hta:AidProjectReestrNum"/>
										<br/>
									</xsl:if>
									<xsl:if test="hta:AidProjectReestrInfo">
										Наименование: <xsl:value-of select="hta:AidProjectReestrInfo"/>
										<br/>
									</xsl:if>
								</td>
							</tr>
							<tr><td colspan="2"><br/></td></tr>
						</xsl:if>
						<xsl:if test="hta:Contract">
							<tr>
								<td class="title">Наименование соглашения, договора, контракта:</td>
								<td class="bordered"> 
									<xsl:for-each select="hta:Contract">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()"><br/></xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr><td colspan="2"><br/></td></tr>
						</xsl:if>
						<xsl:if test="hta:ConfirmationInfo/hta:Validity">
							<tr>
								<td class="title">Срок действия удостоверения:</td>
								<td class="bordered"><xsl:value-of select="hta:ConfirmationInfo/hta:Validity"/> г.</td>
							</tr>
							<tr><td colspan="2"><br/></td></tr>
						</xsl:if>
						<xsl:if test="hta:Help">
							<tr>
								<td class="title">Сведения о виде технической помощи (содействия):</td>
								<td class="bordered">
									<xsl:for-each select="hta:Help">
										<xsl:if test="hta:HelpFunds">
											Средства: <xsl:value-of select="hta:HelpFunds"/><br/>
										</xsl:if>
										<xsl:if test="hta:HelpGoods">
											Товары: <xsl:value-of select="hta:HelpGoods"/><br/>
										</xsl:if>
										<xsl:if test="hta:HelpWorking">
											Работы: <xsl:value-of select="hta:HelpWorking"/><br/>
										</xsl:if>
										<xsl:if test="hta:HelpServices">
											Услуги: <xsl:value-of select="hta:HelpServices"/><br/>
										</xsl:if>
										<xsl:if test="hta:HelpComment">
											Краткое описание: 
											<xsl:for-each select="hta:HelpComment"><xsl:value-of select="."/></xsl:for-each><br/>
										</xsl:if>
									</xsl:for-each>
								</td>
							</tr>
							<tr><td colspan="2"><br/></td></tr>
						</xsl:if>
						<xsl:if test="hta:Goods">
							<tr>
								<td class="title">Сведения о товарах/ работах/ услугах:</td>
								<td>
									<table>
										<tr class="title">
											<td class="bordered" style="font-size:10pt;vertical-align: middle">№ п/п</td>
											<td class="bordered" style="font-size:10pt;vertical-align: middle">Наименование товара</td>
											<td class="bordered" style="font-size:10pt;vertical-align: middle">Стоимость</td>
											<td class="bordered" style="font-size:10pt;vertical-align: middle">Общая стоимость</td>
											<td class="bordered" style="font-size:10pt;vertical-align: middle">Валюта</td>
											<td class="bordered" style="font-size:10pt;vertical-align: middle">Количество</td>
											<td class="bordered" style="font-size:10pt;vertical-align: middle">Вес в осн. ЕИ</td>
											<td class="bordered" style="font-size:10pt;vertical-align: middle">Вес в ДЕИ</td>
										</tr>
										<xsl:for-each select="hta:Goods">
											<tr>
												<td class="bordered"><xsl:value-of select="hta:NameNumPP"/></td>
												<td class="bordered" style="font-size:10pt;">
													<xsl:for-each select="hta:GoodsDescription"><xsl:value-of select="."/></xsl:for-each>
												</td>
												<td class="bordered" style="font-size:10pt;word-break: break-all">
													<xsl:choose>
														<xsl:when test="substring(hta:Cost, 1, 1)='.'">
															<xsl:value-of select="translate(concat('0', hta:Cost), '.', ',')"/>
														</xsl:when>
														<xsl:otherwise><xsl:value-of select="translate(hta:Cost, '.', ',')"/></xsl:otherwise>
													</xsl:choose>
												</td>
												<td class="bordered" style="font-size:10pt;word-break: break-all">
													<xsl:choose>
														<xsl:when test="substring(hta:CostTotal, 1, 1)='.'">
															<xsl:value-of select="translate(concat('0', hta:CostTotal), '.', ',')"/>
														</xsl:when>
														<xsl:otherwise><xsl:value-of select="translate(hta:CostTotal, '.', ',')"/></xsl:otherwise>
													</xsl:choose>		
												</td>
												<td class="bordered" style="font-size:10pt;">
													<xsl:if test="hta:CurrencyName"><xsl:value-of select="hta:CurrencyName"/></xsl:if>
													<xsl:if test="hta:Currency or hta:CurrencyDigitalCode"> (</xsl:if>
													<xsl:if test="hta:Currency"><xsl:value-of select="hta:Currency"/></xsl:if>
													<xsl:if test="hta:Currency and hta:CurrencyDigitalCode">, </xsl:if>
													<xsl:if test="hta:CurrencyDigitalCode"><xsl:value-of select="hta:CurrencyDigitalCode"/></xsl:if>
													<xsl:if test="hta:Currency or hta:CurrencyDigitalCode">)</xsl:if>
												</td>
												<td class="bordered" style="font-size:10pt;"><xsl:apply-templates select="hta:GoodsQuantity"/></td>
												<td class="bordered" style="font-size:10pt;"><xsl:apply-templates select="hta:WeightQuantity"/></td>
												<td class="bordered" style="font-size:10pt;"><xsl:apply-templates select="hta:WeightSupQuantity"/></td>
											</tr>
										</xsl:for-each>
									</table>
								</td>
							</tr>	
						</xsl:if>
					</table>
					<br/>
					<span class="title">
						<xsl:if test="hta:DocSign='0'">
							Подтвердить принадлежность к гуманитарной помощи.
							<br/><br/>Общая стоимость: 
						</xsl:if>
						<xsl:if test="hta:DocSign='1'">
							Настоящим удостоверяем, что денежные средства, товары, работы, услуги на сумму 
						</xsl:if>
						<xsl:if test="hta:Sum">
							<xsl:for-each select="hta:Sum">
								<xsl:apply-templates select="."/>
								<xsl:if test="position()!=last()">, </xsl:if>
							</xsl:for-each>
						</xsl:if>
						<xsl:if test="hta:DocSign='1'"> являются технической помощью (содействием).</xsl:if>
					</span>
				</div>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="hta:ContractCash|hta:Sum">
		<xsl:choose>
			<xsl:when test="substring(hta:Amount, 1, 1)='.'"><xsl:value-of select="translate(concat('0', hta:Amount), '.', ',')"/></xsl:when>
			<xsl:otherwise><xsl:value-of select="translate(hta:Amount, '.', ',')"/></xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:if test="hta:CurrencyName">
			<xsl:text> </xsl:text>
			<xsl:value-of select="hta:CurrencyName"/>
		</xsl:if>
		<xsl:if test="hta:CurrencyCode">
			<xsl:text> (</xsl:text>
			<xsl:value-of select="hta:CurrencyCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
		<xsl:if test="position()!=last()">, </xsl:if>
	</xsl:template>
	<xsl:template match="hta:DonorContract|hta:Contract">
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:value-of select="cat_ru:PrDocumentName"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentName">
			<xsl:text> № </xsl:text>
			<xsl:value-of select="cat_ru:PrDocumentNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:PrDocumentDate">
			<xsl:text> от </xsl:text>
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="cat_ru:PrDocumentDate"/>
			</xsl:call-template>
		</xsl:if>
		<xsl:if test="hta:ContractCash">
			<xsl:text> сумма и валюта </xsl:text>
			<xsl:apply-templates select="hta:ContractCash"/>
		</xsl:if>
		<xsl:if test="position()!=last()"><br/></xsl:if>
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
	<xsl:template match="hta:GoodsQuantity | hta:WeightQuantity | hta:WeightSupQuantity">
		<xsl:choose>
			<xsl:when test="substring(cat_ru:GoodsQuantity, 1, 1)='.'">
				<xsl:value-of select="translate(concat('0', cat_ru:GoodsQuantity), '.', ',')"/>
			</xsl:when>
			<xsl:otherwise><xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/></xsl:otherwise>
		</xsl:choose>		
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
		(код <xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>)
	</xsl:if>
	</xsl:template>
	<xsl:template match="hta:Recipient | hta:Supplier">
		<!--<xsl:if test="RUScat_ru:OrganizationLanguage">
		Язык заполнения: 
		<xsl:value-of select="RUScat_ru:OrganizationLanguage"/><br/>
	</xsl:if>-->
		<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
		<xsl:if test="RUScat_ru:ShortName">
			<xsl:if test="RUScat_ru:OrganizationName">(</xsl:if>
			<xsl:value-of select="RUScat_ru:ShortName"/>
			<xsl:if test="RUScat_ru:OrganizationName">)</xsl:if>
		</xsl:if>
		<br/>
		<xsl:choose>
			<xsl:when test="RUScat_ru:RFOrganizationFeatures">
				<xsl:apply-templates select="RUScat_ru:RFOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="RUScat_ru:RKOrganizationFeatures">
				<xsl:apply-templates select="RUScat_ru:RKOrganizationFeatures"/>
			</xsl:when>
			<xsl:when test="RUScat_ru:RBOrganizationFeatures">
				<xsl:apply-templates select="RUScat_ru:RBOrganizationFeatures"/>
			</xsl:when>
			 <xsl:when test="RUScat_ru:KGOrganizationFeatures">
				<xsl:apply-templates select="RUScat_ru:KGOrganizationFeatures"/>
			 </xsl:when>
			 <xsl:when test="RUScat_ru:RAOrganizationFeatures">
				<xsl:apply-templates select="RUScat_ru:RAOrganizationFeatures"/>
			 </xsl:when>
		</xsl:choose>
		<xsl:if test="RUScat_ru:Address">
			<xsl:apply-templates select="RUScat_ru:Address"/>
		</xsl:if>
		<!--xsl:if test="RUScat_ru:IdentityCard">
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if-->
	</xsl:template>
	<xsl:template match="RUScat_ru:RFOrganizationFeatures">
		<xsl:if test="cat_ru:OGRN">ОГРН: <xsl:value-of select="cat_ru:OGRN"/> </xsl:if>
		<xsl:if test="cat_ru:INN"> ИНН: <xsl:value-of select="cat_ru:INN"/> </xsl:if>
		<xsl:if test="cat_ru:KPP">	КПП: <xsl:value-of select="cat_ru:KPP"/></xsl:if>
		<br/>
	</xsl:template>
	<xsl:template match="RUScat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">УНП: <xsl:value-of select="cat_ru:UNP"/> </xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber"> Идентификационный номер: 
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
		<br/>
	</xsl:template>
	<xsl:template match="RUScat_ru:RKOrganizationFeatures">
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
	<xsl:template match="RUScat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">ИНН/ПИН: <xsl:value-of select="cat_ru:KGINN"/> </xsl:if>
		<xsl:if test="cat_ru:KGOKPO"> ОКПО: <xsl:value-of select="cat_ru:KGOKPO"/></xsl:if>
		<br/>
	</xsl:template>
	<xsl:template match="RUScat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">УНН: <xsl:value-of select="cat_ru:UNN"/> </xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber"> НЗОУ: <xsl:value-of select="cat_ru:SocialServiceNumber"/> </xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate"> Номер справки об НЗОУ: 
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
		<br/>
	</xsl:template>
	<xsl:template match="RUScat_ru:Address">
		<span>Адрес: </span>
		<xsl:value-of select="."/>
		<!--xsl:if test="RUScat_ru:CounryName">
			<xsl:value-of select="RUScat_ru:CounryName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">(<xsl:value-of select="RUScat_ru:CountryCode"/>)</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName">, </xsl:if>
			<xsl:value-of select="RUScat_ru:Region"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region">, </xsl:if>
			<xsl:value-of select="RUScat_ru:City"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:City">, </xsl:if>
			<xsl:value-of select="RUScat_ru:StreetHouse"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostalCode">
			<br/>Почтовый индекс: <xsl:value-of select="RUScat_ru:PostalCode"/>
		</xsl:if-->
		<br/>
	</xsl:template>
	<xsl:template match="cat_ru:IdentityCard">
		<span class="header">Документ удостоверяющий личность:</span>
		<xsl:if test="cat_ru:IdentityCardName">
			<xsl:value-of select="cat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardCode"> (код вида документа <xsl:value-of select="cat_ru:IdentityCardCode"/>)</xsl:if>
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
</xsl:stylesheet>
